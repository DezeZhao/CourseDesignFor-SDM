package com.digital.dao;

import java.util.List;

import com.digital.entity.UserInfo;

public interface UserInfoDAO {
	//Ѱ�ҵ�¼ʱ�û��Ƿ����
	public List<UserInfo> search(UserInfo user);
	//ע���û�ʱ�����ݿ�����û�
	public int  addUser(UserInfo user);
}
