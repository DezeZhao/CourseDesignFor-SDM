package com.digital.service;

import java.util.List;

import com.digital.entity.OrderDetail;

public interface OrderDetailService {
	   //查看订单明细
		public void lookOrderDetail(OrderDetail orderDetail);
		//根据订单信息表的编号得到订单的详细信息
		public List getOrderDetailById(int id);
}
