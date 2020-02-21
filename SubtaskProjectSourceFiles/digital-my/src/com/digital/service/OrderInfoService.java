package com.digital.service;

import java.util.List;

public interface OrderInfoService {
	//根据用户id获得用户的订单信息表
	public List getOrderInfoByUserInfoId(int userInfoId);
    //删除指定订单编号的订单
	public void deleteOrderInfoById(int id);
}
