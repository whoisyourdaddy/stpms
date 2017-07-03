package com.tengxiang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.Applicant;
import com.tengxiang.model.admin.Teamprice;

/**
 * 团队录用人员分红
 * @author Administrator
 *
 */
@Before(CheckLoginInterceptor.class)
public class TeampriceController extends Controller {
	public void index() {
		render("teamprice.jsp");
	}

	public void allTeamprice() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String start_time = getPara("start_time");
		String end_time = getPara("end_time");
		
		String jd1_time ;//该季度第一天
		String jd2_time ; //该季度最后一天
		
		if (start_time != null) {
			jd1_time = start_time;
		}else{
			jd1_time = Util.getJdStart();
		}
		
		if (end_time != null) {
			jd2_time = end_time;
		}else{
			jd2_time = Util.getJdEnd();
		}
		
		String fromyear = jd1_time.substring(0, 4);
		String frommonth = jd1_time.substring(5, 7);
		
		String toyear = jd2_time.substring(0, 4);
		String tomonth = jd2_time.substring(5, 7);
		
		Page<Teamprice> Teamprices = getModel(Teamprice.class).getPageList(
				pageIndex, limit, fromyear, frommonth,toyear,tomonth);
		
		List <Applicant>  l  =getModel(Applicant.class).getListLyry(jd1_time, jd2_time);
		
		for (Teamprice a : Teamprices.getList()) {
			int yz_count =Integer.parseInt(a.get("yz_count").toString());
			a.put("jd1_time", jd1_time);
			a.put("jd2_time", jd2_time);
			a.put("sz_count", l.size());
			a.put("jc_salary", getJc_salary(l.size(), yz_count));
		}
		results.put("rows", Teamprices.getList());
		results.put("results", Teamprices.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	/**
	 * 按照人数显示详情
	 */
	public void detail() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String id = getPara("id");

		String jd1_time = id.split("_")[0];
		String jd2_time = id.split("_")[1];

		Page<Applicant> Applicants = getModel(Applicant.class)
				.getPageListLyry1(pageIndex, limit,jd1_time,jd2_time);

		results.put("rows", Applicants.getList());
		results.put("results", Applicants.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	/**
	 * 团队奖惩算法
	 * 按季度结算
	 * @return
	 */
	public static String getJc_salary(double a,double b) {
		double c=(a/b-0.8)*500*3;
		if(a/b>=0.8){
			c=500*3;
		}
		return String.valueOf((int)c);	
	}
}
