package com.tengxiang.common;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.impl.client.DefaultHttpClient;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * 共通函数
 * 
 * @author stokisyu
 *
 */
public class Util {

	public static final String AS = " as ";

	public static final String COMMA = " , ";
	// http客户端
	public static DefaultHttpClient httpclient;

	static {
		httpclient = new DefaultHttpClient();
	}

	public static void main(String[] args) {
		System.out.println(getMD5Str("123456"));
	}

	/**
	 * MD5 加密
	 */
	public static String getMD5Str(String str) {
		MessageDigest messageDigest = null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.reset();
			messageDigest.update(str.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException caught!");
			System.exit(-1);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		byte[] byteArray = messageDigest.digest();
		StringBuffer md5StrBuff = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++) {
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(
						Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}
		return md5StrBuff.toString();
	}

	/**
	 * 转换成字符类型
	 * 
	 * @param obj
	 * @return
	 */
	public static String toString(Object obj) {
		if (obj == null || "".equals(obj)) {
			return "";
		} else {
			return obj.toString();
		}
	}

	public static boolean isEmpty(Object obj) {
		if (obj == null || "".equals(obj)) {
			return true;
		} else {
			return false;
		}
	}

	public static String changeCode(String value) {

		if (value == null) {
			return "";
		}

		try {
			byte[] arrayStr;
			arrayStr = value.getBytes("iso-8859-1");
			return new String(arrayStr, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

	/**
	 * 将对象转换成数字
	 * 
	 * @param str
	 * @return 转换后的数字，非数字则返回-1
	 */
	public static int toNumber(String str) {
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return -1;
		}
	}

	/**
	 * 获取系统日期
	 * 
	 * @param css
	 *            日期格式
	 * @return 相应格式的系统日期数据
	 */
	public static String getDate(String css) {
		SimpleDateFormat sdf = new SimpleDateFormat(css);
		String ymd = sdf.format(new Date());
		return ymd;
	}

	/**
	 * 、上传单个文件
	 * 
	 * @param ufile
	 *            上传的文件对象
	 * @param savePath
	 *            保存路径
	 * @param type
	 *            文件类型
	 * @return
	 */
	public static String upload(UploadFile ufile, String savePath, String type) {
		String fileName = ""; // 文件名
		String extName = ""; // 文件扩展名
		String newFileName = "";// 新文件名
		fileName = ufile.getFileName();
		extName = fileName.substring(fileName.lastIndexOf(".") + 1)
				.toLowerCase();
		if (Util.typePermit(type, extName)) {
			newFileName = System.currentTimeMillis() + "." + extName;
			ufile.getFile()
					.renameTo(
							new File(PathKit.getWebRootPath() + savePath
									+ newFileName));
		}
		return newFileName;
	}

	/**
	 * 上传文件（多个）
	 * 
	 * @param ufiles
	 *            文件列表
	 * @param savePath
	 *            保存路径
	 * @param type
	 *            文件类型
	 * @return
	 */
	public static List<String> upload(List<UploadFile> ufiles, String savePath,
			String type) {
		String fileName = ""; // 文件名
		String extName = ""; // 文件扩展名
		String newFileName = "";// 新文件名
		List<String> newNames = new ArrayList<String>();
		for (UploadFile uploadFile : ufiles) {
			fileName = uploadFile.getFileName();
			extName = fileName.substring(fileName.lastIndexOf(".") + 1)
					.toLowerCase();
			if (!Util.typePermit(type, extName)) {
				return new ArrayList<String>();
			}
			newFileName = System.currentTimeMillis() + "_"
					+ (1 + (int) (Math.random() * 900)) + "." + extName;
			newNames.add(newFileName);
			uploadFile.getFile().renameTo(new File(savePath + newFileName));

		}
		return newNames;
	}

	/**
	 * 判断文件类型
	 * 
	 * @param type
	 * @param extName
	 * @return
	 */
	private static boolean typePermit(String type, String extName) {
		if (type.equals("image")) {
			return isImage(extName);
		} else if (type.equals("flash")) {
			return isFlash(extName);
		} else if (type.equals("media")) {
			return isMedia(extName);
		} else if (type.equals("file")) {
			return isFile(extName);
		} else {
			return false;
		}
	}

	private static boolean isImage(String extName) {
		String type = "gif,jpg,jpeg,png,bmp";
		List<String> list = Arrays.<String> asList(type.split(","));
		if (!list.contains(extName)) {
			return false;
		} else {
			return true;
		}
	}

	private static boolean isFlash(String extName) {
		String type = "swf,flv";
		List<String> list = Arrays.<String> asList(type.split(","));
		if (!list.contains(extName)) {
			return false;
		} else {
			return true;
		}
	}

	private static boolean isMedia(String extName) {
		String type = "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb";
		List<String> list = Arrays.<String> asList(type.split(","));
		if (!list.contains(extName)) {
			return false;
		} else {
			return true;
		}
	}

	private static boolean isFile(String extName) {
		String type = "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2";
		List<String> list = Arrays.<String> asList(type.split(","));
		if (!list.contains(extName)) {
			return false;
		} else {
			return true;
		}
	}

	public static Map<String, String> getJsSignature(String jsapiTicket,
			String url) {
		String noncestr = "wisdomicroWeixinApi";

		Map<String, String> results = new HashMap<String, String>();

		String timestamp = System.currentTimeMillis() + "";
		String[] arr = new String[] { jsapiTicket, noncestr, timestamp, url };

		results.put("timestamp", timestamp);
		results.put("noncestr", noncestr);

		// 将token、timestamp、nonce三个参数进行字典序排序
		Arrays.sort(arr);
		StringBuilder content = new StringBuilder();

		content.append("jsapi_ticket=");
		content.append(jsapiTicket);
		content.append("&noncestr=");
		content.append(noncestr);
		content.append("&timestamp=");
		content.append(timestamp);
		content.append("&url=");
		content.append(url);

		MessageDigest md = null;
		String tmpStr = null;

		try {
			md = MessageDigest.getInstance("SHA-1");
			// 将三个参数字符串拼接成一个字符串进行sha1加密
			byte[] digest = md.digest(content.toString().getBytes());
			tmpStr = byteToStr(digest);
			results.put("signature", tmpStr);
			System.out.println(tmpStr);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		content = null;
		return results;
	}

	/**
	 * 将字节数组转换为十六进制字符串
	 * 
	 * @param byteArray
	 * @return
	 */
	private static String byteToStr(byte[] byteArray) {
		String strDigest = "";
		for (int i = 0; i < byteArray.length; i++) {
			strDigest += byteToHexStr(byteArray[i]);
		}
		return strDigest;
	}

	/**
	 * 将字节转换为十六进制字符串
	 * 
	 * @param mByte
	 * @return
	 */
	private static String byteToHexStr(byte mByte) {
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a',
				'b', 'c', 'd', 'e', 'f' };
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
		tempArr[1] = Digit[mByte & 0X0F];

		String s = new String(tempArr);
		return s;
	}

	/**
	 * 日期往前后推len天
	 * 
	 * @param date
	 * @param len
	 * @return
	 */
	public static String dayMove(String date, int len) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(date));
			cal.add(Calendar.DATE, len);
			return sdf.format(cal.getTime());
		} catch (Exception e) {
			return date;
		}
	}

	/**
	 * 日期往前后推len月
	 * 
	 * @param date
	 * @param len
	 * @return
	 */
	public static String monthMove(String date, int len) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(date));
			cal.add(Calendar.MONTH, len);
			return sdf.format(cal.getTime());
		} catch (Exception e) {
			return date;
		}
	}

	/**
	 * 得到季度初
	 * 
	 * @return
	 */
	public static String getJdStart() {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(new Date());
		System.out.println(calendar.get(Calendar.MONTH));
		int month = getQuarterInMonth(calendar.get(Calendar.MONTH), true);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return dateToString(calendar.getTime());
	}

	/**
	 * 得到季度末
	 * 
	 * @return
	 */
	public static String getJdEnd() {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(new Date());
		int month = getQuarterInMonth(calendar.get(Calendar.MONTH), false);
		calendar.set(Calendar.MONTH, month + 1);
		calendar.set(Calendar.DAY_OF_MONTH, 0);
		return dateToString(calendar.getTime());
	}

	/**
	 * 返回第几个月份，不是几月
	 * 
	 * @param month
	 * @param isQuarterStart
	 * @return
	 */
	private static int getQuarterInMonth(int month, boolean isQuarterStart) {
		int months[] = { 0, 3, 6, 9 };
		if (!isQuarterStart) {
			// true 月初 false 月末
			months = new int[] { 2, 5, 8, 11 };
		}
		if (month >= 0 && month <= 2)
			return months[0];
		else if (month >= 3 && month <= 5)
			return months[1];
		else if (month >= 6 && month <= 8)
			return months[2];
		else
			return months[3];
	}

	/*
	 * 时间格式打印
	 */
	public static String dateToString(Date d) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(d);
	}
	
	/*
	 * 时间格式打印
	 */
	public static Date stringToDate(String str) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return df.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	/**
	 * 字符串的日期格式的计算
	 * @param fromdate
	 * @param todate
	 * @return
	 * @throws ParseException
	 */
	public static int daysBetween(String fromdate, String todate) {
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(stringToDate(fromdate));
		long time1 = cal.getTimeInMillis();
		
		cal.setTime(stringToDate(todate));
		long time2 = cal.getTimeInMillis();
		
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

}
