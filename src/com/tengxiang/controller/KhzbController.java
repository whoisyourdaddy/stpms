package com.tengxiang.controller;

/**
 * 年度考核指标
 */
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.Khzb;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class KhzbController extends Controller {

	public void index() {
		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		render("khzb.jsp");
	}

	/**
	 * 考核指标一览
	 */
	public void allKhzb() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		User re = new User();
		String type = re.getAllType(getSessionAttr("userName")).get(0)
				.get("type");
		String user_name = getSessionAttr("userName");
		
		String year = getPara("year");

		Page<Khzb> requirements = getModel(Khzb.class).getPageList(pageIndex,
				limit,  type, user_name,year);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	/**
	 * 新增和编辑考核指标
	 */
	public void updateKhzb() {

		Map<String, Object> results = new HashMap<String, Object>();

		Khzb khzb = getModel(Khzb.class);

		khzb.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		
		if (Util.isEmpty(khzb.get("id"))) {
			khzb.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			khzb.put("creator", getSessionAttr("userID"));
			khzb.put("flag", "1");
			khzb.save();
		} else {
			khzb.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			khzb.put("updator", getSessionAttr("userID"));
			khzb.update();
		}
		results.put("success", true);

	}

	/**
	 * 删除考核指标
	 */
	public void delKhzb() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Khzb khzb = getModel(Khzb.class);
			khzb.set("id", getPara(i));
			khzb.set("flag", "0");
			khzb.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			khzb.set("updator", getSessionAttr("userID"));
			khzb.update();
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
			//数据库存入user_name对应id 去掉该属性
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
