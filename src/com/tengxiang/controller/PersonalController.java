package com.tengxiang.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.Category;
import com.tengxiang.model.admin.Personal;
import com.tengxiang.model.admin.User;

/**
 * 个人业务提成
 * @author Administrator
 *
 */
@Before(CheckLoginInterceptor.class)
public class PersonalController extends Controller {
	public void index() {
		setAttr("fpxsList",
				getModel(Category.class).getChildByCode("FENPEIXISHU"));
		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));

		List<User> zpzylist = User.dao.getUname();// 招聘专员
		this.setAttr("zpzylist", zpzylist);
		render("personal.jsp");
	}

	public void allPersonal() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String userid = getPara("userid");
		String money = getPara("money");
		String ratio = getPara("ratio");
		Page<Personal> Personal = getModel(Personal.class).getPageList(
				pageIndex, limit, userid, money, ratio);
		results.put("rows", Personal.getList());
		results.put("results", Personal.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	
	public void updatePersonal() {

		Map<String, Object> results = new HashMap<String, Object>();

		Personal Personal = getModel(Personal.class);
		Personal.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));

		if (Util.isEmpty(Personal.get("id"))) {
			Personal.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			Personal.put("creator", getSessionAttr("userID"));
			Personal.set("flag", "1");
			Personal.save();

		} else {
			Personal.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			Personal.put("updator", getSessionAttr("userID"));
			Personal.update();
		}

		results.put("success", true);
	}

	public void delPersonal() {

		Map<String, Object> results = new HashMap<String, Object>();
		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Personal Personal = getModel(Personal.class);
			Personal.set("id", getPara(i));
			Personal.set("flag", "0");
			Personal.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			Personal.set("updator", getSessionAttr("userID"));
			Personal.update();
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
			if ("ticheng".equals(name)) {
				continue;
			}
			if ("user_name".equals(name)) {
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

}
