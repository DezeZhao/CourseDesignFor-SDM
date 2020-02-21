package com.digital.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.digital.entity.UserInfo;
import com.digital.service.UserInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class UserInfoAction extends ActionSupport implements SessionAware{
	UserInfo ui;// ���ڷ�װ��¼������

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
				setMessage("���Ѿ�����������"+usedTime+"���ӣ������һ���ϣ�");
			}else if(usedTime==0){
				setMessage("���Ѿ���ʼ������������ף����죡");
				
			}else{
				setMessage("���Ѿ�����������"+usedTime+"���ӣ�");
			}
			return "index";
			
		} else {
			// ��½ʧ�ܣ��ض���login.jsp
			setMessage("��¼ʧ�ܣ������û����������Ƿ���ȷ��");
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
