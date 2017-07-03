package com.tengxiang.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.tengxiang.common.FileExportUtils;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.Applicant;
import com.tengxiang.model.admin.BusinessTeam;
import com.tengxiang.model.admin.Category;
import com.tengxiang.model.admin.CheckLoginInterceptor;
import com.tengxiang.model.admin.Requirement;
import com.tengxiang.model.admin.User;

/**
 * 应聘者信息
 * 
 */
@Before(CheckLoginInterceptor.class)
public class ApplicantController extends Controller {
	/**
	 * xls导出的标题
	 */
	static String[] titles = { "姓名", "年龄", "联系方式", "学历", "工作年限", "职位", "录入时间",
			"更新时间", "初试时间", "复试时间", "面试官", "转正薪资", "状况", "面试结果", "招聘专员", "备注",
			"领导意见" };
	/**
	 * xls导出的标题对应的数据字段
	 */
	static String[] columns = { "name", "age", "number", "level", "work_year",
			"postion", "offer_data", "update_time", "interview_time",
			"reinterview_time", "interview_man", "salary", "is_ok", "reason",
			"user_name", "advice", "advice2" };

	public void index() {
		setAttr("sjlylist",
				getModel(Category.class).getChildByCode(
						"APPLICANT_DATA_RESOURCE"));
		setAttr("xllist", getModel(Category.class).getChildByCode("LEVEL"));

		setAttr("rydjlist",
				getModel(Category.class).getChildByCode("JAPAN_LEVEL"));
		setAttr("msfslist",
				getModel(Category.class).getChildByCode("INTERVIEW_ID"));
		setAttr("zwlist", getModel(Category.class).getChildByCode("WORK"));
		setAttr("ztlist", getModel(Category.class).getChildByCode("ZHUANGTAI"));
		setAttr("zslist", getModel(Requirement.class).getxqmc());

		setAttr("type",

				setAttr("rydjlist",
						getModel(Category.class).getChildByCode("JAPAN_LEVEL")));
		setAttr("msfslist",
				getModel(Category.class).getChildByCode("INTERVIEW_ID"));
		setAttr("zwlist", getModel(Category.class).getChildByCode("WORK"));
		setAttr("ztlist", getModel(Category.class).getChildByCode("ZHUANGTAI"));
		setAttr("zslist", getModel(Requirement.class).getxqmc());

		setAttr("type",

				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		render("applicant.jsp");
	}

	/**
	 * 查询求职者信息
	 */
	public void allApplicant() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String interview_id = getPara("interview_id");
		String is_interview = getPara("is_interview");
		String requirement_name = getPara("project_name");
		String is_ok = getPara("is_ok");
		String applicant_name = getPara("applicant_name");

		String user_name = getPara("user_name");
		String mobile = getPara("number");
		String advice = getPara("advice");
		Page<Applicant> applicants = getModel(Applicant.class).getPageList(
				pageIndex, limit, interview_id, is_interview, requirement_name,
				is_ok, applicant_name, user_name, mobile, advice);

		results.put("rows", applicants.getList());
		results.put("results", applicants.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	public void updateApplicant() {

		Map<String, Object> results = new HashMap<String, Object>();

		Applicant applicant = getModel(Applicant.class);
		applicant.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));

		if (Util.isEmpty(applicant.get("id"))) {

			applicant.put("user_name", getSessionAttr("userName"));
			applicant.put("offer_data",
					new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			applicant.save();

		} else {
			applicant.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));

			applicant.update();
		}

		results.put("success", true);
	}

	/**
	 * 导出数据到xls
	 */
	public void exportApplicant() {
		String ids = getPara("ids");

		String[] applicantIds = ids.split("-"); // 应聘者id数组
		
		String user_name  =getSessionAttr("userName");

		/**
		 * 查询当前登录系统用户的选中的应聘者
		 */
		List<Applicant> datas = getModel(Applicant.class).getListByIds(
				applicantIds,user_name);

		List<Map<String,String>> values = new ArrayList<Map<String,String>>();
		
		

		for (int i = 0; i < datas.size(); i++) {
			Applicant app = datas.get(i);
			Map<String,String> map = new HashMap<String,String>();
			for (int j = 0; j < columns.length; j++) {
				if (null != app.get(columns[j])) {
					map.put(columns[j], app.get(columns[j]).toString());
				}
			}
			values.add(map);
		}

		String timestamp = new SimpleDateFormat("yyyyMMdd")
				.format(new Date());
		String fileName = user_name+"应聘者记录报告_" + timestamp + ".xls";// 文件名
		File file = null;
		try {
			 file =FileExportUtils.exportFile(user_name, titles, columns, values,
					fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if (file.exists()) {
			renderFile(file);
			return;
		} else {
			renderHtml("<div align='center' style='margin-top: 20%'>文件不存在！请联系管理员。&nbsp;<a href='javascript:void(0);'onclick='window.history.back();'>关闭</a></div>");
			return;
		}
		
	}

	public void delApplicant() {

		Map<String, Object> results = new HashMap<String, Object>();
		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Applicant applicant = getModel(Applicant.class);
			applicant.set("id", getPara(i));
			applicant.set("flag", "0");
			applicant.update();
			i++;
		}
		results.put("success", true);
		renderJson(results);
	}

	public Map<String, Object> paraMap2ModelMap(Map<String, String[]> para,
			Enumeration<?> names) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String name;
		while (names.hasMoreElements()) {
			name = names.nextElement().toString();

			if ("b".equals(name)) {
				continue;
			}

			try {
				modelMap.put(name, para.get(name)[0]);
			} catch (ActiveRecordException e) {
				continue;
			}
		}

		return modelMap;
	}

	public void allRequirement() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String id = getPara("id");
		String requirement = getModel(Applicant.class).getRequirementname(id)
				.get(0).get("requirement_name");
		System.out.println(requirement);
		String requirements[] = requirement.split(",");
		StringBuffer idsStr = new StringBuffer();
		for (int i = 0; i < requirements.length; i++) {
			if (i > 0) {
				idsStr.append(",");
			}
			idsStr.append("'").append(requirements[i]).append("'");
		}
		System.out.println(idsStr);

		Page<Requirement> users = getModel(Requirement.class)
				.getPageListforapplicant(pageIndex, limit, idsStr);

		results.put("rows", users.getList());
		results.put("results", users.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	public void getListByName() {
		String name = null;
		if (!StringUtils.isEmptyOrWhitespaceOnly(getPara("applicant_name"))) {
			try {
				name = new String(getPara("applicant_name").getBytes(
						"iso-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		List<Applicant> list = getModel(Applicant.class).getListByName(name);

		renderJson("ypzs", list);

	}

	public void isHasForNam() {
		String name = null;
		String mobile = getPara("number");
		if (!StringUtils.isEmptyOrWhitespaceOnly(getPara("name"))) {
			try {
				name = new String(getPara("name").getBytes("iso-8859-1"),
						"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		List<Applicant> list = getModel(Applicant.class).getApplicantByName(
				name, mobile);

		if (null == list || list.size() == 0) {
			Applicant app = getModel(Applicant.class);
			app.set("flag", "0");
			renderJson("app", app);
		} else {
			Applicant app = list.get(0);
			app.set("flag", "1");
			renderJson("app", app);
		}

	}

	/**
	 * 是否存在此名字和手机号码的应聘者 并计算分成系数 手机号码和名字构成唯一约束（同一个公司可能存在同名）
	 */
	public void isHasForName() {
		String name = null;
		String mobile = getPara("number");
		if (!StringUtils.isEmptyOrWhitespaceOnly(getPara("name"))) {
			try {
				name = new String(getPara("name").getBytes("iso-8859-1"),
						"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		List<Applicant> list = getModel(Applicant.class).getApplicantByName(
				name, mobile);

		if (null == list || list.size() == 0) {
			Applicant app = getModel(Applicant.class);
			app.set("flag", "0");
			renderJson("app", app);
		} else {
			Applicant app = list.get(0);
			app.set("flag", "1");
			renderJson("app", app);
		}

	}

	public void getRatio() {
		String report_time2 = getPara("report_time2");// 入职时间（实际报道时间）
		String year = getPara("year"); // 销售业绩录入年份
		String price = getPara("price");// 应聘者单价
		String ratio = "";
		// 计算当前时间和入职时间相差的天数
		int days = Util
				.daysBetween(report_time2, Util.dateToString(new Date()));
		// 同一个人分成有效期为3年
		double count = days / 365.0;
		if (count <= 1) {
			// 不满足一年 按照当前年份计算
			BusinessTeam bt = getModel(BusinessTeam.class)
					.getRatio(year, price);
			ratio += "此人在我公司工作0-1年;";
			ratio += bt.getDouble("ratio");

		} else if (count <= 2) {
			Integer nextYear = Integer.valueOf(year) + 1;
			BusinessTeam bt = getModel(BusinessTeam.class).getRatio(
					nextYear.toString(), price);
			ratio += "此人在我公司工作1-2年;";
			ratio += bt.getDouble("ratio");
		} else if (count <= 3) {
			Integer nextTwoYear = Integer.valueOf(year) + 2;
			BusinessTeam bt = getModel(BusinessTeam.class).getRatio(
					nextTwoYear.toString(), price);
			ratio += "此人在我公司工作2-3年;";
			ratio += bt.getDouble("ratio");
		} else {
			ratio += "此人在我公司工作3年以上无提成;";
			ratio += 0;
		}

		BusinessTeam app = getModel(BusinessTeam.class);
		app.set("ratio", ratio);
		renderJson("app", app);

	}
}
