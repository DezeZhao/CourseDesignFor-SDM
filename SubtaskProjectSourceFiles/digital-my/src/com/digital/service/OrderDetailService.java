package com.digital.service;

import java.util.List;

import com.digital.entity.OrderDetail;

public interface OrderDetailService {
	   //�鿴������ϸ
		public void lookOrderDetail(OrderDetail orderDetail);
		//���ݶ�����Ϣ��ı�ŵõ���������ϸ��Ϣ
		public List getOrderDetailById(int id);
}
