package com.digital.entity;

import java.util.Date;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.text.SimpleDateFormat;

public class User {
	private String userName;
	private String password;
	private String realName;
	private String sex;
	private String address;
	private String question;
	private String answer;
	private String email;
	private String favorate;
	private int score;
	private String regDate;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFavorate() {
		return favorate;
	}
	public void setFavorate(String favorate) {
		this.favorate = favorate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String  getRegDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	regDate= sdf.format(new Date());
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
