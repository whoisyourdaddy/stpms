package com.tengxiang.model.admin;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

public class CheckLoginInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {

		System.out.println("Before invoking " + ai.getActionKey());
	
		if(ai.getController().getSessionAttr("userID") == null ||
				ai.getController().getSessionAttr("userID").equals("")){
			//ai.getController().redirect("/login");
			ai.getController().render("/WEB-INF/view/login.jsp");
		}else {
//			ai.getController().setAttr("userID", ai.getController().getSessionAttr("userID"));
			ai.invoke();
		}
		System.out.println("After invoking " + ai.getActionKey());
	}

}
