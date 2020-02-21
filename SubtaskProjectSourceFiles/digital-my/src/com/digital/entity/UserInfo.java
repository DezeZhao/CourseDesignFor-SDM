package com.digital.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserInfo {

    private int id;//�û����
	private String userName;//�û���
	private String password;//�û�����
	private String realName;//��ʵ����
	private String address;//��ͥסַ
	private String email;//�����ʼ�
	private String regDate;//ע������
	private String sex;//�Ա�
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
