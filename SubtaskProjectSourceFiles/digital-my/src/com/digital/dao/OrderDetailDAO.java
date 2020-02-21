package com.digital.dao;

import java.util.List;

import com.digital.entity.OrderDetail;

public interface OrderDetailDAO {
	//由订单信息表的id得到订单的详细信息
	public List getOrderDetailById(int id);
    //查看订单明细
	public void lookOrderDetail(OrderDetail orderDetail);
	
}
