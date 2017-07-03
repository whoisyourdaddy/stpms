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
import com.tengxiang.model.admin.Fpxs;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class FpxsController extends Controller {
	public void index() {
		setAttr("fpxsList", getModel(Category.class)
				.getChildByCode("FENPEIXISHU"));
		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		
		List<User> zpzylist = User.dao.getUname();//招聘专员
		this.setAttr("zpzylist", zpzylist);
		render("fpxsList.jsp");
	}
    /*
     * 分配系数一览
     */
	public void allFpxs() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String userid = getPara("userid");
		String type = getPara("type");
		String create_time = getPara("create_time");
		Page<Fpxs> Fpxss = getModel(Fpxs.class).getPageList(pageIndex, limit,
				userid, create_time, type);
		results.put("rows", Fpxss.getList());
		results.put("results", Fpxss.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	
	/*
	 * 新增和编辑分配指标
	 */
	public void updateFpxs(){
		Map<String, Object> results = new HashMap<String, Object>();
		Fpxs fpxs = getModel(Fpxs.class);
		fpxs.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		if (Util.isEmpty(fpxs.get("id"))) {
			fpxs.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			fpxs.put("creator", getSessionAttr("userID"));
			fpxs.put("flag", "1");
			fpxs.save();
		} else {
			fpxs.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			fpxs.put("updator", getSessionAttr("userID"));
			fpxs.update();
		}
		results.put("success", true);
	}
	
/*
 * 删除分配系数	
 */
	public void delFpxs() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Fpxs fpxs = getModel(Fpxs.class);
			fpxs.set("id", getPara(i));
			fpxs.set("flag", "0");
			fpxs.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			fpxs.set("updator", getSessionAttr("userID"));
			fpxs.update();
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
			//数据库存入type_name对应type 去掉该属性
			if ("type_name".equals(name)) {
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
