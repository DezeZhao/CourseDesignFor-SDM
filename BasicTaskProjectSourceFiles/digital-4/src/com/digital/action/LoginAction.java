package com.digital.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {

	private String userName;
	private String password;
	
		
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

	private String message;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public String login() throws Exception {
		Connection conn=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		String back=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/digital?"
					+ "useUnicode=true&characterEncoding=utf8&serverTimezone=GMT",
					"root","zdz199804103033");
			String sql="select * from user_info where userName='"+userName+"'"
					+ " and password='"+password+"'";
    		preparedStatement=conn.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery(sql);
			if (resultSet.next()) {
				Map<String, Object> session=null;
				ActionContext ac=ActionContext.getContext();
				session=ac.getSession();
				session.put("CURRENT_USER", userName);
				
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
				back="success";
			}else{
				setMessage("��¼ʧ�ܣ������û����������Ƿ���ȷ��");
				back="input";
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (null!=resultSet) {
					resultSet.close();
				}
				if (null!=preparedStatement) {
					preparedStatement.close();
				}
				if (null!=conn) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		return back;
	}
}
