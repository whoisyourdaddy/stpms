package com.tengxiang.controller;

import com.jfinal.core.Controller;
import com.tengxiang.model.admin.Category;


public class CommonController extends Controller {

	public void getData(){
		renderJson(Category.dao.getData(getPara()));
	}
	public void getChildByCode(){
		renderJson(Category.dao.getChildByCode(getPara()));
	}
	
}
