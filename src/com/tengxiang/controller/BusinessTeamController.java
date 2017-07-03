package com.tengxiang.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.BusinessTeam;

/**
 * 团队销售指标系数
 * 
 * @author Administrator
 *
 */
public class BusinessTeamController extends Controller {
	public void index() {

		render("BusinessTeam.jsp");
	}

	/**
	 * 团队销售指标系数一览
	 */
	public void allBusinessTeam() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String year = getPara("year");
		String minsale = getPara("minsale");
		String maxsale = getPara("maxsale");
		String ratio = getPara("ratio");
		Page<BusinessTeam> BusinessTeams = getModel(BusinessTeam.class)
				.getPageList(pageIndex, limit, year, minsale, maxsale, ratio);
		results.put("rows", BusinessTeams.getList());
		results.put("results", BusinessTeams.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	/**
	 * 新增和编辑团队销售指标系数
	 */
	public void updateBusinessTeam() {

		Map<String, Object> results = new HashMap<String, Object>();

		BusinessTeam businessteam = getModel(BusinessTeam.class);

		businessteam.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));

		if (Util.isEmpty(businessteam.get("id"))) {
			businessteam
					.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			businessteam.put("creator", getSessionAttr("userID"));
			businessteam.put("flag", "1");
			businessteam.save();
		} else {
			businessteam
					.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			businessteam.put("updator", getSessionAttr("userID"));
			businessteam.update();
		}
		results.put("success", true);

	}

	public void delBusinessTeam() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			BusinessTeam businessteam = getModel(BusinessTeam.class);
			businessteam.set("id", getPara(i));
			businessteam.set("flag", "0");
			businessteam.update();
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
			// 数据库存入user_name对应id 去掉该属性
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
