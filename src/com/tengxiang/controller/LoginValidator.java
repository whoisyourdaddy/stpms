package com.tengxiang.controller;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class LoginValidator extends Validator {

	@Override
	protected void validate(Controller c) {
		validateRequiredString("username", "loginMsg", "请输入用户名和密码!");
		validateRequiredString("password", "loginMsg", "请输入用户名和密码!");
	}

	@Override
	protected void handleError(Controller c) {
		c.keepPara();		

		 c.redirect("/admin");

	}

}
