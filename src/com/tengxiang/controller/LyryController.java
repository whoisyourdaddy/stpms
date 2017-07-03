package com.tengxiang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.Applicant;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class LyryController extends Controller{
	public void index() {
		List<User> zpzylist = User.dao.getUname();//招聘专员
		this.setAttr("zpzylist", zpzylist);
		render("lyry.jsp");
	}
	/*
	 * 录用人员一览
	 */
	public void allLyry() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String user_name = getPara("user_name");
		Page<Applicant> Lyrys = getModel(Applicant.class).getPageListLyry(pageIndex, limit,user_name);
		
		
		for (Applicant a : Lyrys.getList()) {
			String  report_time2  = a.get("report_time2");
			
			if(!StringUtils.isEmptyOrWhitespaceOnly(report_time2)){
			a.put("onemonth_time",Util.dayMove(Util.monthMove(report_time2, 1), -1) );
			}
		}
		
		results.put("rows", Lyrys.getList());
		results.put("results", Lyrys.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
}
