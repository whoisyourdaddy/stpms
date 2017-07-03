package com.tengxiang.model.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

public class FileOperateUtils {
	// 一次读取多少字节
	public static int bufferSize = 1024 * 8;

	

	/**
	 * 上传文件
	 * 
	 * @param HttpServletRequest
	 *            request HttpServletRequest对象
	 * @param File
	 *            INfile对象
	 * @param String
	 *            INfilePath 保存目录
	 * @param String
	 *            INfileName 保存文件名(含后缀名)
	 * @param String
	 *            INsuffix 后缀名限制数组,多个格式以"|"分开 ，不限格式则为 *
	 * @param int INmaxFileSize 最大大小
	 * @return int 0:成功 1:上传文件失败 2:上传文件类型错误 3：上传文件过大 4:上传文件为空 5:上传文件路径错误
	 * @throws Exception
	 */
	public static int uploadFile(File INfile, String INfilePath,
			String INfileName, String INsuffix, int INmaxFileSize)
			throws Exception {
		int state = 0;
		if (bufferSize > Integer.MAX_VALUE) {
			bufferSize = 1024 * 8;
		} else if (bufferSize < 8) {
			bufferSize = 8;
		}
		if (INmaxFileSize < 1) {
			INmaxFileSize = 1024 * 1024 * 1024;
		} else if (INmaxFileSize > Long.MAX_VALUE) {
			INmaxFileSize = 1024 * 1024 * 1024;
		}
		// 判定文件大小
		if (INfile.length() <= INmaxFileSize) {
			INfilePath = INfilePath.replace("\\", "/");
			String lastChar = INfilePath.substring(INfilePath.length() - 1);
			if (!"/".equals(lastChar)) {
				INfilePath += "/";
			}
			createDirectory(INfilePath);
			File destFile = new File(INfilePath, INfileName);
			FileUtils.copyFile(INfile, destFile);
		}
		// 检查后缀名是否符合要求
		if (!checkFileSuffixName(INfileName, INsuffix)) {
			return 1;
		}
		// 上传
		FileInputStream fis = null;
		try {
			long size = INfile.length();
			if (size <= 0) {
				state = 4;
			} else {
				if (size <= INmaxFileSize) {
					fis = new FileInputStream(INfile);
					state = upload4Stream(INfileName, INfilePath, fis);
				} else {
					state = 3;
				}
			}
		} catch (FileNotFoundException e) {
			state = 5;
			throw e;
		} catch (IOException e) {
			state = 1;
			throw e;
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return state;
	}

	/**
	 * 通过输入流参数上传文件
	 * 
	 * @createDate Oct 9, 2010 11:22:47 PM
	 * @param uploadFileName
	 *            文件名称
	 * @param savePath
	 *            保存路径
	 * @param InputStream
	 *            上传的文件的输入流
	 * @return 是否上传成功
	 * @throws Exception
	 */
	public static int upload4Stream(String fileName, String path, InputStream is)
			throws Exception {
		int state = 1;
		FileOutputStream fos = null;

		try {
			path = path.replace("\\", "/");
			String lastChar = path.substring(path.length() - 1);
			if (!"/".equals(lastChar)) {
				path += "/";
			}
			createDirectory(path);
			fos = new FileOutputStream(path + fileName);

			byte[] buffer = new byte[bufferSize];
			int len = 0;
			while ((len = is.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
			state = 0;
		} catch (FileNotFoundException e) {
			state = 5;
			throw e;
		} catch (IOException e) {
			state = 1;
			throw e;
		} finally {
			if (is != null) {
				is.close();
			}
			if (fos != null) {
				fos.flush();
				fos.close();
			}
		}
		return state;
	}

	/**
	 * 下载文件
	 * 
	 * @param response
	 *            HttpServletResponse 对象
	 * @param filepath
	 *            文件路径
	 * @param filename
	 *            文件名
	 */
	public static void downloadFile(HttpServletResponse response,
			String filepath, String filename) {
		// 文件页面头类型

		if (filename.indexOf("apk") > 0)
			response.setContentType("application/vnd.android.package-archive");
		else
			response.setContentType("application/x-download");
		try {
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes(), "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		OutputStream output = null;
		InputStream input = null;
		try {

			// 读取文件
			input = new FileInputStream(new File(filepath));
			output = response.getOutputStream();

			// 使用缓冲区进行读取
			byte[] buffer = new byte[1024 * 8];
			int readByte = 0;
			while ((readByte = input.read(buffer)) > 0) {
				output.write(buffer, 0, readByte);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (output != null) {
					output.flush();
					output.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				if (input != null)
					input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 检查后缀名是否正确
	 * 
	 * @param String
	 *            suffixName，文件后缀名
	 * @param String
	 *            suffixNameArray 允许文件后缀的范围多个格式用“|”分开,列：jpb|gif|png
	 * @return boolean true:正确 false:格式不符合
	 */
	private static boolean checkFileSuffixName(String suffixName,
			String suffixNameArray) {
		if (suffixNameArray.equals("*")) {
			return true;
		}
		String[] _suffixNameArray = suffixNameArray.split("\\|");
		if (suffixName == null || suffixName.trim().equals(""))
			return false;
		for (int i = 0; i < _suffixNameArray.length; i++) {
			if (suffixName.equalsIgnoreCase(_suffixNameArray[i]))
				return true;
		}
		return false;
	}

	public static File createFile(String filePath, String fileName) {
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		File file = new File(f, fileName);
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} /*
		 * else { try { file.delete(); file.createNewFile(); } catch
		 * (IOException e) { e.printStackTrace(); } }
		 */
		return file;
	}

	public void delFile(String path, String filename) {
		File file = new File(path + "/" + filename);
		if (file.exists() && file.isFile())
			file.delete();
	}

	public static String getWebAppsDir() {
		String tomcatDir = System.getProperty("catalina.home", File.separator);
		if (!File.separator.equals(tomcatDir.substring(tomcatDir.length() - 1))) {
			tomcatDir = tomcatDir + File.separator;
		}
		return tomcatDir + "webapps";
	}

	/**
	 * 创建目录
	 * 
	 * @param path
	 *            文件路径
	 * @throws IOException
	 *             写入异常
	 */
	public static void createDirectory(String path) throws IOException {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		} else {
			if (!file.isDirectory())
				file.mkdir();
		}
	}

	/*
	 * 使用文件通道的方式复制文件
	 * 
	 * @param s
	 * 
	 * 源文件
	 * 
	 * @param t
	 * 
	 * 复制到的新文件
	 */

	public static boolean fileChannelCopy(File s, File t) {
		FileInputStream fi = null;
		FileOutputStream fo = null;
		FileChannel in = null;
		FileChannel out = null;
		try {
			fi = new FileInputStream(s);
			fo = new FileOutputStream(t);
			in = fi.getChannel();// 得到对应的文件通道
			out = fo.getChannel();// 得到对应的文件通道
			in.transferTo(0, in.size(), out);// 连接两个通道，并且从in通道读取，然后写入out通道
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				fi.close();
				in.close();
				fo.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static float getExcelCellAutoHeight(String str, float fontCountInline) {
		float defaultRowHeight = 12.00f;// 每一行的高度指定
		float defaultCount = 0.00f;
		for (int i = 0; i < str.length(); i++) {
			float ff = getregex(str.substring(i, i + 1));
			defaultCount = defaultCount + ff;
		}
		return ((int) (defaultCount / fontCountInline) + 1) * defaultRowHeight;// 计算
	}

	public static float getregex(String charStr) {

		if (charStr == " ") {
			return 0.5f;
		}
		// 判断是否为字母或字符
		if (Pattern.compile("^[A-Za-z0-9]+$").matcher(charStr).matches()) {
			return 0.5f;
		}
		// 判断是否为全角

		if (Pattern.compile("[\u4e00-\u9fa5]+$").matcher(charStr).matches()) {
			return 1.00f;
		}
		// 全角符号 及中文
		if (Pattern.compile("[^x00-xff]").matcher(charStr).matches()) {
			return 1.00f;
		}
		return 0.5f;

	}

}
