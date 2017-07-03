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
import com.tengxiang.model.admin.Projecttarget;
import com.tengxiang.model.admin.User;

public class ProjecttargetController extends Controller{
	public void index() {
		List<User> zpzylist = User.dao.getUname();//招聘专员
		this.setAttr("zpzylist", zpzylist);
        render("projecttarget.jsp");
	}
	/**
	 * 业务接单一览
	 */
	public void allProjecttarget() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String userid = getPara("userid");
		String company = getPara("company");
		String sale = getPara("sale");
		
		Page<Projecttarget> projecttargets = getModel(Projecttarget.class).getPageList(pageIndex, limit,
				userid,company,sale);
		results.put("rows",projecttargets.getList());
		results.put("results", projecttargets.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	
	/*
	 * 新增和编辑业务接单
	 */
	public void updateProjecttarget() {

		Map<String, Object> results = new HashMap<String, Object>();

		Projecttarget projecttarget = getModel(Projecttarget.class);

		projecttarget.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		
		if (Util.isEmpty(projecttarget.get("id"))) {
			projecttarget.put("crete_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			projecttarget.put("creator", getSessionAttr("userID"));
			projecttarget.put("flag", "1");
			projecttarget.save();
		} else {
			projecttarget.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			projecttarget.put("updator", getSessionAttr("userID"));
			projecttarget.update();
		}
		results.put("success", true);

	}
/*
 * 删除业务接单
 */
	public void delProjecttarget() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Projecttarget projecttarget = getModel(Projecttarget.class);
			projecttarget.set("id", getPara(i));
			projecttarget.set("flag", "0");
			projecttarget.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			projecttarget.set("updator", getSessionAttr("userID"));
			projecttarget.update();
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
			//数据库存入type_name对应type 去掉该属性`
			if ("user_name".equals(name)) {
				continue;
			}
			
			if ("personalfencheng".equals(name)) {
				continue;
			}
			if ("teamfencheng".equals(name)) {
				continue;
			}
			if ("".equals(name)) {
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
