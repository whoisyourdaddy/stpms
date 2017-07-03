package com.tengxiang.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.Category;
import com.tengxiang.model.admin.Project;
import com.tengxiang.model.admin.Requirement;
import com.tengxiang.model.admin.User;




public class ProjectController extends Controller{
	public void index(){
		setAttr("xmddList", getModel(Category.class).getChildByCode("LOCATION"));
		setAttr("kfcsList", getModel(Category.class).getChildByCode("KFCS"));
	    setSessionAttr("Type", getModel(User.class).getAllType(getSessionAttr("userName")).get(0).get("type"));	
	    setAttr("gzfxlist",
				getModel(Category.class).getChildByCode("WORK_DIRECTION"));
	    //查处项目对应多少需求
/*	    setSessionAttr("project_name", re.get("project_name"));
	    setSessionAttr("require", re.get("count(id)"));*/
		render("ProjectList.jsp");
	}
	public void allProject(){

		Map <String, Object>results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String name = getPara("name");
		String location = getPara("location");
		String num = getPara("num");
		
		Page<Project> users = getModel(Project.class).getPageList(pageIndex, limit,name,location,num);

		results.put("rows", users.getList());
		results.put("results", users.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
	
	public void updateProject(){

		Map <String, Object>results = new HashMap<String, Object>();

		Project user = getModel(Project.class);
		user.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		
		if(Util.isEmpty(user.get("id"))){
			user.save();
		} else {
			user.update();
		}		
		results.put("success", true);
	}
	

	
	public void delProject(){

		Map <String, Object>results = new HashMap<String, Object>();
		int i = 0;
		while(!Util.isEmpty(getPara(i))){
			Project project = getModel(Project.class);
			project.set("id", getPara(i));
			project.set("flag", "0");
			project.update();
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
	
	public void allRequirement(){

		Map <String, Object>results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String id = getPara("id");
		Page<Requirement> users = getModel(Requirement.class).getPageList(pageIndex, limit,id);

		results.put("rows", users.getList());
		results.put("results", users.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}
}
