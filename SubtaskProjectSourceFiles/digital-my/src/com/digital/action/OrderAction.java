package com.digital.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.digital.entity.CartItemBean;
import com.digital.entity.OrderDetail;
import com.digital.entity.OrderInfo;
import com.digital.entity.UserInfo;
import com.digital.service.OrderDetailService;
import com.digital.service.OrderInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport implements RequestAware, SessionAware {

	OrderDetailService orderDetailService;
	
	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}
    Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
	      this.session=session;
	}
    Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
	
	//添加订单
	public String addOrderInfo()throws Exception{
		OrderInfo orderInfo=new OrderInfo();
		//封装orderInfo的实体对象
		orderInfo.setStatus("未处理");
		//取得当前系统时间
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orderInfo.setOrdertime(simpleDateFormat.format(new Date()));
		//取得当前登录用户
		UserInfo userInfo=(UserInfo)session.get("CURRENT_USER");
		orderInfo.setUserInfo(userInfo);
		//取得存放在session中的sumPrice总金额
		orderInfo.setOrderprice((Double)session.get("sumPrice"));
		//取得购物车对象
		Map cart=(HashMap)session.get("cart");
		Iterator  it=cart.keySet().iterator();
		try{
			while(it.hasNext()){
				Object key=it.next();
				CartItemBean cartItem=(CartItemBean)cart.get(key);
				//设置订单明细
				OrderDetail orderDetail=new OrderDetail();
				orderDetail.setProductInfo(cartItem.getPi());
				orderDetail.setNum(cartItem.getQuantity());
				orderDetail.setOrderInfo(orderInfo);
				//查看订单明细
				orderDetailService.lookOrderDetail(orderDetail); 
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//已经生成订单，所以删除购物车
		session.remove("cart");
		return "index";

	}
	/////////////////////////////////////////////////////////////////////
	OrderInfoService orderInfoService;
	
	public void setOrderInfoService(OrderInfoService orderInfoService) {
		this.orderInfoService = orderInfoService;//set方法注入值
	}
	
	//获取指定用户的订单列表
	public String toMyOrderInfo(){
		//获取指定用户
		UserInfo userInfo=(UserInfo)session.get("CURRENT_USER");
		//获取指定用户的订单列表
		List myOrderInfoList=orderInfoService.getOrderInfoByUserInfoId(userInfo.getId());
		request.put("myOrderInfoList", myOrderInfoList);
		return "myOrderInfo";
	}
	int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	//根据订单信息表的编号得到订单的详细信息
	public String toOrderDetail(){
		List orderDetailList=orderDetailService.getOrderDetailById(id);
		request.put("orderDetailList", orderDetailList);
		return "toOrderDetail";
	}
	//删除指定编号的订单
	public String deleteSelectedOrderInfo(){
		orderInfoService.deleteOrderInfoById(id);
		return "myOrderInfo";
	}

}
