package com.digital.dao;

import java.util.List;

import com.digital.entity.OrderDetail;

public interface OrderDetailDAO {
	//�ɶ�����Ϣ���id�õ���������ϸ��Ϣ
	public List getOrderDetailById(int id);
    //�鿴������ϸ
	public void lookOrderDetail(OrderDetail orderDetail);
	
}
