package com.tengxiang.controller;

/**
 * 销售业绩
 */
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
import com.tengxiang.model.admin.Project;
import com.tengxiang.model.admin.SaleTargetTeam;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class SaleResultController extends Controller {

	public void index() {
		List<Project> xmmclist = Project.dao.getPname();
		this.setAttr("xmmclist", xmmclist);
		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		render("saleresult.jsp");
	}

	/**
	 * 销售业绩一览
	 */
	public void allSaleResult() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));

		String year = getPara("year");
		String month = getPara("month");
		String applicant_name = getPara("applicant_name");

		Page<SaleTargetTeam> requirements = getModel(SaleTargetTeam.class)
				.getPageList2(pageIndex, limit, year, month, applicant_name);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	/**
	 * 新增和编辑销售业绩
	 */
	public void updateSaleResult() {

		Map<String, Object> results = new HashMap<String, Object>();

		SaleTargetTeam saletargetteam = getModel(SaleTargetTeam.class);

		saletargetteam.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));

		if (Util.isEmpty(saletargetteam.get("id"))) {
			saletargetteam.put("create_time",
					Util.getDate("yyyy-MM-dd HH:mm:ss"));
			saletargetteam.put("creator", getSessionAttr("userID"));
			saletargetteam.put("flag", "1");
			saletargetteam.save();
		} else {
			saletargetteam.put("update_time",
					Util.getDate("yyyy-MM-dd HH:mm:ss"));
			saletargetteam.put("updator", getSessionAttr("userID"));
			saletargetteam.update();
		}
		results.put("success", true);

	}

	/**
	 * 删除销售业绩
	 */
	public void delSaleResult() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			SaleTargetTeam saletargetteam = getModel(SaleTargetTeam.class);
			saletargetteam.set("id", getPara(i));
			saletargetteam.set("flag", "0");
			saletargetteam.set("update_time",
					Util.getDate("yyyy-MM-dd HH:mm:ss"));
			saletargetteam.set("updator", getSessionAttr("userID"));
			saletargetteam.update();
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
			//work_year=一年半  report_time2=2016-01-10
			if ("applicantname".equals(name)) {
				continue;
			}
			
			if ("ticheng".equals(name)) {
				continue;
			}
			
			if ("project_name".equals(name)) {
				continue;
			}
			
			if ("work_year".equals(name)) {
				continue;
			}
			
			if ("report_time2".equals(name)) {
				continue;
			}
			
			if ("number".equals(name)) {
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
