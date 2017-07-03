package com.tengxiang.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class CheckLoginInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {
	
		if(ai.getController().getSessionAttr("userID") == null ||
				ai.getController().getSessionAttr("userID").equals("")){
			ai.getController().redirect("/admin");
		}else {
			ai.invoke();
		}
	}

}
