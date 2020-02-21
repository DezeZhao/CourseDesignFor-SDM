package com.digital.dao;

import java.util.List;

import com.digital.entity.OrderInfo;
import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

public interface OrderInfoDAO {
	//获取指定用户的订单
	public List getOrderInfoByUserInfoId(int userInfoId);
	//根据订单编号加载订单
	public OrderInfo getInfoById(int id);
	//删除订单
	public void deleteOrderInfo(OrderInfo orderInfo);
}
