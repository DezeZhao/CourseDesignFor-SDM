package com.digital.service;

import java.util.List;

import com.digital.entity.UserInfo;

public interface UserInfoService {
	
	//µÇÂ¼
	public List<UserInfo> login(UserInfo user);
	
	//×¢²á
	public int register(UserInfo user);
}
