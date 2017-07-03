package com.tengxiang.controller;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.model.admin.First;
import com.tengxiang.model.admin.Requirement;
import com.tengxiang.model.admin.User;

public class FirstController extends Controller {

	public void index() {
		setSessionAttr("Type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));

		// 查找登录用户有多少个需求
		Requirement res1 = Requirement.dao.getAllRequire(getPara("Require"),
				getSessionAttr("userName").toString());
		setSessionAttr("Require", res1.get("count(id)"));

		// 查找出共有多少个需求
		Requirement res2 = Requirement.dao.getRequire(getPara("Require"));
		setSessionAttr("Require1", res2.get("count(id)"));

		// 查找出未分配需求
		Requirement res3 = Requirement.dao.getRequire1(getPara("Require"));
		setSessionAttr("Require2", res3.get("count(id)"));
		render("first.jsp");
	}

	public void allFirst() {

		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String user_name = getSessionAttr("userName");

		Page<First> firsts = getModel(First.class).getPageList(pageIndex,
				limit, user_name);

		results.put("rows", firsts.getList());
		results.put("results", firsts.getTotalRow());
		renderJson(JsonKit.toJson(results));

	}

}
