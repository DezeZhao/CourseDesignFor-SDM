package com.digital.entity;

import java.util.HashSet;
import java.util.Set;

public class OrderInfo {
	private Integer id;//�������
	private UserInfo userInfo;//�û���Ϣ��ƥ���û�id��
	private String status;//����״̬
	private String ordertime;//�µ�ʱ��
	private Double orderprice;//�����ܼ�
	private Set orderDetail=new HashSet(0);//������ϸ
    //һ��������Ϣ����ܺ��ж��������ÿ�������и��Ե���ϸ��
	//�����ü�������ʾ������ϸ��һ�Զࣩ
	
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
