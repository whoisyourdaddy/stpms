package com.tengxiang.common;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
	static String[] titles = { "姓名", "年龄", "联系方式", "学历", "工作年限", "职位", "录入时间",
			"更新时间", "初试时间", "复试时间", "面试官", "转正薪资", "状况", "面试结果", "招聘专员", "备注",
			"领导意见" };

	static String[] columns = { "name", "age", "number", "level", "work_year",
			"postion", "offer_data", "update_time", "interview_time",
			"reinterview_time", "interview_man", "salary", "is_ok", "reason",
			"user_name", "advice", "advice2" };

	public static void main(String[] args) throws IOException {
		String timestamp = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date());
		String fileName = "吴滢test应聘者记录_" + timestamp + ".xls";

		List<Map<String,String>> values = new ArrayList<Map<String,String>>();

		Map<String,String> map = new HashMap<String,String>();
		map.put("name", "测试1");
		map.put("offer_data", "2016/5/16");
		map.put("age", "10");
		values.add(map);

		Map map2 = new HashMap();
		map2.put("name", "测试2");
		map2.put("age", "20");
		map2.put("offer_data", "2016/5/16");
		map2.put("update_time", "2016/5/20");
		map.put("advice2", "好好干");
		values.add(map2);

		FileExportUtils.exportFile("吴滢", titles, columns, values, fileName);
		System.out.println("导出成功");

	}
}
