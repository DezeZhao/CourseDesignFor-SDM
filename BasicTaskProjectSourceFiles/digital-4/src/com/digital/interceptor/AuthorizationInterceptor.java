package com.digital.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorizationInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map session=invocation.getInvocationContext().getSession()	;
		String user=(String)session.get("CURRENT_USER");
		if(user==null){
			return Action.INPUT;
		}else{
			return invocation.invoke();
		}
	}

}
