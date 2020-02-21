package com.digital.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.digital.entity.UserInfo;
import com.digital.service.UserInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class UserInfoAction extends ActionSupport implements SessionAware{
	UserInfo ui;// 用于封装登录表单参数

	public UserInfo getUi() {
		return ui;
	}

	public void setUi(UserInfo ui) {
		this.ui = ui;
	}
    private String message;
    
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	UserInfoService userInfoService;

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	
	Map<String, Object>session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public String login() throws Exception {
		List<UserInfo> uiList = userInfoService.login(ui);
		if (uiList.size() > 0) {
			session.put("CURRENT_USER", uiList.get(0));
			long currentTime=System.currentTimeMillis();
			Long startTime=(Long)session.get("startTime");
			if(startTime==null){
				 startTime=currentTime;
				 session.put("stratTime",startTime);
			}
			long usedTime=(currentTime-startTime)/1000/60;
			if(usedTime>=60){
				setMessage("您已经访问喵购网"+usedTime+"分钟，起来活动一下呦！");
			}else if(usedTime==0){
				setMessage("您已经开始访问喵购网，祝您愉快！");
				
			}else{
				setMessage("您已经访问喵购网"+usedTime+"分钟！");
			}
			return "index";
			
		} else {
			// 登陆失败，重定向到login.jsp
			setMessage("登录失败，请检查用户名和密码是否正确！");
			return "login";
		}
	}
	
	public String logOut(){
		UserInfo userInfo=(UserInfo)session.get("CURRENT_USER");
		if(userInfo!=null){
			session.remove("CURRENT_USER");
		}
		return "index";
	}

	
}
