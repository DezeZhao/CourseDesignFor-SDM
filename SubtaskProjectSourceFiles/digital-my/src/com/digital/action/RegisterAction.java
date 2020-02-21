package com.digital.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.digital.entity.UserInfo;
import com.digital.service.UserInfoService;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class RegisterAction extends ActionSupport{
	private UserInfo user;
	private String repassword;
	
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}
	UserInfoService userInfoService;

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	public String register()throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		user.setRegDate(sdf.format(new Date()));
		UserInfo userInfo=new UserInfo(
				user.getUserName(),
				user.getPassword(),
				user.getRealName(), 
				user.getAddress(), 
				user.getEmail(),
				user.getRegDate());
		int result=userInfoService.register(userInfo);
		if(result==0){
			return "input";
		}
		else{
			return "success";
		}
	}
    

}
