package com.digital.dao;

import java.util.List;

import com.digital.entity.UserInfo;

public interface UserInfoDAO {
	//寻找登录时用户是否存在
	public List<UserInfo> search(UserInfo user);
	//注册用户时向数据库添加用户
	public int  addUser(UserInfo user);
}
