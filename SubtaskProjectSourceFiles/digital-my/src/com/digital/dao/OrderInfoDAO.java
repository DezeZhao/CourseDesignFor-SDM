package com.digital.dao;

import java.util.List;

import com.digital.entity.OrderInfo;
import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

public interface OrderInfoDAO {
	//��ȡָ���û��Ķ���
	public List getOrderInfoByUserInfoId(int userInfoId);
	//���ݶ�����ż��ض���
	public OrderInfo getInfoById(int id);
	//ɾ������
	public void deleteOrderInfo(OrderInfo orderInfo);
}
