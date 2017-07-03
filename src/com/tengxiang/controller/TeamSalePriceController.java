package com.tengxiang.controller;

/**
 * 按年-月团队销售分成统计
 */
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.SaleTargetTeam;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class TeamSalePriceController extends Controller {

	public void index() {
		setAttr("type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		render("teamsaleprice.jsp");
	}

	/**
	 * 按照年月统计每个月销售额
	 */
	public void allTeamSalePrice() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));

		String year = getPara("year");
		String month = getPara("month");

		Page<SaleTargetTeam> requirements = getModel(SaleTargetTeam.class)
				.getPageList(pageIndex, limit, year, month);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	/**
	 * 按照年月统计每个月销售额详情
	 */
	public void detail() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String id = getPara("id");

		String year = id.split("_")[0];
		String month = id.split("_")[1];

		Page<SaleTargetTeam> requirements = getModel(SaleTargetTeam.class)
				.getPageList2(pageIndex, limit, year, month, null);

		results.put("rows", requirements.getList());
		results.put("results", requirements.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

}
