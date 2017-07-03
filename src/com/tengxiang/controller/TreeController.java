package com.tengxiang.controller;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.Category;

public class TreeController extends Controller{
	public void index(){
		render("tree.jsp");
	}
	
	public void allTree(){
		//String json  =JsonKit.toJson(getModel(Category.class).getTree());
		String json   = JSONObject.toJSONString(getModel(Category.class).getTree());
		renderJson(json);		
	}
	
	//删除树叶
	public void delTree(){
		Map <String, Object>results = new HashMap<String, Object>();
		Category category =getModel(Category.class);		
		category.deleteById(getPara("treeid"));
		results.put("success", true);
		renderJson(results);
	}
	
	public void updateTree(){
		Map <String, Object>results = new HashMap<String, Object>();
		Category category =getModel(Category.class);
		if(!Util.isEmpty(category.get("id"))){
			category.update();	
		}else{
			category.save();
		}
		results.put("success", true);
		renderJson(results);
	}
	
	
}
