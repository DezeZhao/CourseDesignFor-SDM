package com.digital.service;

import java.util.List;

public interface OrderInfoService {
	//�����û�id����û��Ķ�����Ϣ��
	public List getOrderInfoByUserInfoId(int userInfoId);
    //ɾ��ָ��������ŵĶ���
	public void deleteOrderInfoById(int id);
}
