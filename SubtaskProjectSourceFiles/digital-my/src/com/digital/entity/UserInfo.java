package com.digital.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserInfo {

    private int id;//用户编号
	private String userName;//用户名
	private String password;//用户密码
	private String realName;//真实姓名
	private String address;//家庭住址
	private String email;//电子邮件
	private String regDate;//注册日期
	private String sex;//性别
	private String question;
	private String answer;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public UserInfo(String userName, String password, String realName, String address, String email, String regDate) {
		super();
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.address = address;
		this.email = email;
		this.regDate = regDate;
	}

	public UserInfo() {
		super();
	}
    



	
}
