package com.tengxiang.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.Applicant;
import com.tengxiang.model.admin.Category;
import com.tengxiang.model.admin.Project;
import com.tengxiang.model.admin.Requirement;
import com.tengxiang.model.admin.User;

public class RequirementController extends Controller {
	static String us1;// 登录用户分配参数
	static String ur1;// 未分配参数

	public void index() {

		List<Project> xmmclist = Project.dao.getPname();
		List<User> zpzylist = User.dao.getUname();
		this.setAttr("xmmclist", xmmclist);
		this.setAttr("zpzylist", zpzylist);

		String us = getRequest().getParameter("us");
		String ur = getRequest().getParameter("ur");
		RequirementController.us1 = us;
		RequirementController.ur1 = ur;

		setAttr("rylxlist",
				getModel(Category.class).getChildByCode("STAFF_LEIXING"));
		setAttr("gzfxlist",
				getModel(Category.class).getChildByCode("WORK_DIRECTION"));
		setAttr("wcztlist", getModel(Category.class)
				.getChildByCode("RE_STATUS"));

		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		setAttr("kfcsList", getModel(Category.class).getChildByCode("KFCS"));
		render("requirement.jsp");
	}

	public void allRequirement() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String staff_leixing = getPara("staff_leixing");
		String work_year = getPara("work_year");
		String work_direction = getPara("work_direction");
		String project_name = getPara("project_name");
		String create_time = getPara("create_time");
		User re = new User();
		String type = re.getAllType(getSessionAttr("userName")).get(0)
				.get("type");
		String user_name = getSessionAttr("userName");

		String us = RequirementController.us1;// 登录用户分配参数
		String ur = RequirementController.ur1;// 未分配参数

		Page<Requirement> requirements = getModel(Requirement.class)
				.getPageList(pageIndex, limit, staff_leixing, work_year,
						work_direction, project_name, create_time, type,
						user_name, us, ur);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	public void updateRequirement() {

		Map<String, Object> results = new HashMap<String, Object>();

		Requirement requirement = getModel(Requirement.class);

		requirement.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		requirement.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
		if (Util.isEmpty(requirement.get("id")) /*
												 * &&
												 * Util.isEmpty(requirement.get
												 * ("status")) &&
												 * Util.isEmpty(requirement
												 * .get("user_name"))
												 */) {

			requirement.save();

		} else {
			/*
			 * if(!Util.isEmpty(requirement.get("status"))){
			 * requirement.set("status", requirement.get("status")); }
			 * if(!Util.isEmpty(requirement.get("user_name"))){
			 * requirement.set("user_name", requirement.get("user_name")); }
			 * else{
			 */
			requirement.update();
			/* } */
		}
		results.put("success", true);

	}

	public void delRequirement() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Requirement requirement = getModel(Requirement.class);
			requirement.set("id", getPara(i));
			requirement.set("flag", "0");
			requirement.update();
			i++;
		}
		results.put("success", true);
		renderJson(results);
	}

	/**
	 * 抢任务
	 */
	public void qiangRequirement() {
		Map<String, Object> results = new HashMap<String, Object>();
		
		String user_name = getSessionAttr("userName");

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Requirement requirement = getModel(Requirement.class);
			requirement.set("id", getPara(i));
			requirement.set("user_name", user_name);
			requirement.update();
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

	public void allRequirement1() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String staff_leixing = getPara("staff_leixing");
		String work_year = getPara("work_year");
		String work_direction = getPara("work_direction");
		String project_name = getPara("project_name");
		String create_time = getPara("create_time");
		User re = new User();
		String type = re.getAllType(getSessionAttr("userName")).get(0)
				.get("type");
		String user_name = getSessionAttr("userName");

		Page<Requirement> requirements = getModel(Requirement.class)
				.getPageList1(pageIndex, limit, staff_leixing, work_year,
						work_direction, project_name, create_time, type,
						user_name);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	public void allxqmc() {
		List<Requirement> requirements = getModel(Requirement.class).getxqmc();
		renderJson(JsonKit.toJson(requirements));
	}

	public void allApplicant() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));

		String requirement_name = getModel(Requirement.class)
				.getrequirementname(getPara("id")).get(0)
				.get("requirement_name");

		Page<Applicant> applicants = getModel(Applicant.class)
				.getPageListrequire(pageIndex, limit, requirement_name);

		results.put("rows", applicants.getList());
		results.put("results", applicants.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	public void allProject() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String id = getPara("id");
		Page<Project> users = getModel(Project.class).getPageList(pageIndex,
				limit, id);

		results.put("rows", users.getList());
		results.put("results", users.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
}
