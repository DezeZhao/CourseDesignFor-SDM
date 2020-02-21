package com.digital.service.impl;

import java.util.List;

import com.digital.dao.OrderDetailDAO;
import com.digital.entity.OrderDetail;
import com.digital.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {

	OrderDetailDAO orderDetailDAO;
	
	public void setOrderDetailDAO(OrderDetailDAO orderDetailDAO) {
		this.orderDetailDAO = orderDetailDAO;
	}
    //�鿴������ϸ
	@Override
	public void lookOrderDetail(OrderDetail orderDetail) {
        orderDetailDAO.lookOrderDetail(orderDetail);
	}
    //���ݶ���id(oid)�õ�������ϸ
	@Override
	public List getOrderDetailById(int id) {
		return orderDetailDAO.getOrderDetailById(id);
	}

}
