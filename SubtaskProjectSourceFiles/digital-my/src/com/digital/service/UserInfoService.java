package com.digital.service;

import java.util.List;

import com.digital.entity.UserInfo;

public interface UserInfoService {
	
	//��¼
	public List<UserInfo> login(UserInfo user);
	
	//ע��
	public int register(UserInfo user);
}
