package com.digital.entity;

import java.util.HashSet;
import java.util.Set;

public class OrderInfo {
	private Integer id;//订单编号
	private UserInfo userInfo;//用户信息（匹配用户id）
	private String status;//订单状态
	private String ordertime;//下单时间
	private Double orderprice;//订单总价
	private Set orderDetail=new HashSet(0);//订单明细
    //一个订单信息表可能含有多个订单，每个订单有各自的明细，
	//所以用集合来表示订单明细（一对多）
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public Double getOrderprice() {
		return orderprice;
	}

	public void setOrderprice(Double orderprice) {
		this.orderprice = orderprice;
	}

	public Set getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set orderDetail) {
		this.orderDetail = orderDetail;
	}

   	public OrderInfo(Integer id, UserInfo userInfo, String status, String ordertime, Double orderprice,
			Set orderDetail) {
		super();
		this.id = id;
		this.userInfo = userInfo;
		this.status = status;
		this.ordertime = ordertime;
		this.orderprice = orderprice;
		this.orderDetail = orderDetail;
	}

	public OrderInfo() {
		super();
	}
	

	
	
}
