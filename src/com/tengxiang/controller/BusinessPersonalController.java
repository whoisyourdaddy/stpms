package com.tengxiang.controller;

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
import com.tengxiang.model.admin.BusinessPersonal;
/**
 * 个人销售指标系数
 * @author Administrator
 *
 */
@Before(CheckLoginInterceptor.class)
public class BusinessPersonalController extends Controller {
	public void index() {
		render("businesspersonal.jsp");
	}

	public void allBusinessPersonal() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String minsale = getPara("minsale");
		String maxsale = getPara("maxsale");
		String ratio = getPara("ratio");
		Page<BusinessPersonal> BusinessPersonal = getModel(BusinessPersonal.class).getPageList(pageIndex, limit,
				minsale, maxsale, ratio);
		results.put("rows", BusinessPersonal.getList());
		results.put("results", BusinessPersonal.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	
	public void updateBusinessPersonal(){

		Map <String, Object>results = new HashMap<String, Object>();

		BusinessPersonal BusinessPersonal = getModel(BusinessPersonal.class);
		BusinessPersonal.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		
		if(Util.isEmpty(BusinessPersonal.get("id"))){
			BusinessPersonal.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			BusinessPersonal.put("creator", getSessionAttr("userID"));
			BusinessPersonal.put("flag", "1");
			BusinessPersonal.save();
			
		} else {
			BusinessPersonal.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			BusinessPersonal.put("updator", getSessionAttr("userID"));
			BusinessPersonal.update();
		}
		
		results.put("success", true);
	}
	
	public void delBusinessPersonal(){

		Map <String, Object>results = new HashMap<String, Object>();
		int i = 0;
		while(!Util.isEmpty(getPara(i))){
			BusinessPersonal BusinessPersonal = getModel(BusinessPersonal.class);
			BusinessPersonal.set("id", getPara(i));
			BusinessPersonal.set("flag", "0");
			BusinessPersonal.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			BusinessPersonal.set("updator", getSessionAttr("userID"));
			BusinessPersonal.update();
			i++;
		}
		results.put("success", true);
		renderJson(results);
	}
	public Map<String, Object> paraMap2ModelMap(Map<String, String[]> para, Enumeration<?> names){
		 Map<String, Object> modelMap = new  HashMap<String, Object>();
		 String name;
		 while(names.hasMoreElements()){
			 name = names.nextElement().toString();
			 
			 if("b".equals(name)){
				 continue;
			 }
			 try{
				 modelMap.put(name, para.get(name)[0]);
			 } catch(ActiveRecordException e){
				 continue;
			 }
		 }
		 
		 return modelMap;
	}
	
//	public void allRequirement(){
//
//		Map <String, Object>results = new HashMap<String, Object>();
//		int pageIndex = Integer.valueOf(getPara("pageIndex"));
//		int limit = Integer.valueOf(getPara("limit"));
//		String id = getPara("id");
//		String requirement = getModel(BusinessPersonal.class).getRequirementname(id).get(0).get("requirement_name");
//		System.out.println(requirement);
//		String requirements[] = requirement.split(",");
//		StringBuffer idsStr = new StringBuffer(); 
//		for (int i = 0; i < requirements.length; i++) { 
//			if (i > 0) { 
//			idsStr.append(","); 
//			} 
//			idsStr.append("'").append(requirements[i]).append("'"); 
//			} 
//		System.out.println(idsStr);
//
//		Page<Requirement> users = getModel(Requirement.class).getPageListforBusinessPersonal(pageIndex, limit, idsStr);
//
//		
//		results.put("rows", users.getList());
//		results.put("results", users.getTotalRow());
//		renderJson(JsonKit.toJson(results));
//	}
}
