package com.tengxiang.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.jfinal.kit.PathKit;


public class FileExportUtils {
	private static String webRootPath;
	public static String getWebRootPath() {
		if (webRootPath == null)
			webRootPath = detectWebRootPath();;
		return webRootPath;
	}
	
	private static String detectWebRootPath() {
		try {
			String path = FileExportUtils.class.getResource("/").toURI().getPath();
			return new File(path).getParentFile().getParentFile().getCanonicalPath();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 通用导出xls方法
	 * 
	 * @param sheetName
	 *            sheet名称
	 * @param titles
	 *            表头
	 * @param columns
	 *            属性列
	 * @param list
	 *            数据
	 * @param fileName
	 *            文件名
	 * @throws IOException
	 */
	public static File exportFile(String sheetName, String[] titles,
			String[] columns, List<Map<String,String>> list, String fileName)
			throws IOException {
		String webdir = PathKit.getWebRootPath()+ File.separator + "export";
		String filename2 = new String(fileName.getBytes(), "UTF-8");
		File file = createFile(webdir, filename2);
		FileOutputStream fos = null;
		HSSFWorkbook wb = null;
		wb = new HSSFWorkbook();
		HSSFSheet sheet = null;
		fos = new FileOutputStream(file, true);
		for (int j = 0; j < 10; j++) {
			sheet = wb.createSheet();
			//wb.setSheetName(0, sheetName, HSSFCell.ENCODING_UTF_16);
			wb.setSheetName(0, sheetName);

			// 设置标题行
			HSSFRow row = null;
			HSSFCell cell = null;
			row = sheet.createRow((int) 0);
			for (int i = 0; titles != null && i < titles.length; i++) {
				cell = row.createCell( i);
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				// 参考 ："2012-08-10"的宽度为2500
				//sheet.setColumnWidth( i,  (25 * 256));
				sheet.setColumnWidth( i,  titles[i].length()/2*2500);
				cell.setCellValue(titles[i]);
			}

			Map<String, String> map = null;
			// 用于循环时Excel的行号
			int c = 1;
			for (int i = 0 + j * 10; list != null && i < list.size(); i++) {
				if (j == 0) {
					// 在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
					row = sheet.createRow((int) (i + 1));
				} else {
					row = sheet.createRow((int) (i + 1 - j * 10));
				}
				map = list.get(i);
				for (int i2 = 0; i2 < columns.length; i2++) {
					cell = row.createCell( i2);
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					// poi2.5x版本设置编码解决中文乱码(默认Unicode);
					// 引入高版本jar(无setEncoding()API方法)对原ExcelUtil方法有影响，也会导致XXImportController报错
					//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					if (map.get(columns[i2]) == null) {
						cell.setCellValue("");
					} else {
						// float
						// height=getExcelCellAutoHeight(map.get(columns[i2]).toString(),
						// 8f);
						// sheet.setColumnWidth((short)i, (short)(height));
						cell.setCellValue(map.get(columns[i2]).toString());
					}
				}
				c++;
				if (c > 1000)// 每一页1000行数据，多出的新建一页
					break;
			}
			if (c <= 1000) {
				break;
			}
		}
		wb.write(fos);// 写入文件
		wb.close();
		fos.flush();
		fos.close();
		return file;
	}

	public static File createFile(String filePath, String fileName) {
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		File file = new File(f, fileName);
		if (file.exists()) {
			file.delete();
		}
		try {
			file.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}
}
