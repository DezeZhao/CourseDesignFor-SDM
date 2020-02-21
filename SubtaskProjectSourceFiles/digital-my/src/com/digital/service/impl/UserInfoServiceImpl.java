package com.digital.service.impl;

import java.util.List;

import com.digital.dao.UserInfoDAO;
import com.digital.entity.UserInfo;
import com.digital.service.UserInfoService;

public class UserInfoServiceImpl implements UserInfoService {

	UserInfoDAO userInfoDAO;
	
	public void setUserInfoDAO(UserInfoDAO userInfoDAO) {
		this.userInfoDAO = userInfoDAO;
	}

	@Override
	public List<UserInfo>login(UserInfo user) {
		return userInfoDAO.search(user);
	}

	@Override
	public int register(UserInfo user) {
		return userInfoDAO.addUser(user);
	}
	
	

}
