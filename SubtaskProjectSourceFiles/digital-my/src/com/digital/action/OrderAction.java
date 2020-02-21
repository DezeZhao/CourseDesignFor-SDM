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
	
	//��Ӷ���
	public String addOrderInfo()throws Exception{
		OrderInfo orderInfo=new OrderInfo();
		//��װorderInfo��ʵ�����
		orderInfo.setStatus("δ����");
		//ȡ�õ�ǰϵͳʱ��
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orderInfo.setOrdertime(simpleDateFormat.format(new Date()));
		//ȡ�õ�ǰ��¼�û�
		UserInfo userInfo=(UserInfo)session.get("CURRENT_USER");
		orderInfo.setUserInfo(userInfo);
		//ȡ�ô����session�е�sumPrice�ܽ��
		orderInfo.setOrderprice((Double)session.get("sumPrice"));
		//ȡ�ù��ﳵ����
		Map cart=(HashMap)session.get("cart");
		Iterator  it=cart.keySet().iterator();
		try{
			while(it.hasNext()){
				Object key=it.next();
				CartItemBean cartItem=(CartItemBean)cart.get(key);
				//���ö�����ϸ
				OrderDetail orderDetail=new OrderDetail();
				orderDetail.setProductInfo(cartItem.getPi());
				orderDetail.setNum(cartItem.getQuantity());
				orderDetail.setOrderInfo(orderInfo);
				//�鿴������ϸ
				orderDetailService.lookOrderDetail(orderDetail); 
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//�Ѿ����ɶ���������ɾ�����ﳵ
		session.remove("cart");
		return "index";

	}
	/////////////////////////////////////////////////////////////////////
	OrderInfoService orderInfoService;
	
	public void setOrderInfoService(OrderInfoService orderInfoService) {
		this.orderInfoService = orderInfoService;//set����ע��ֵ
	}
	
	//��ȡָ���û��Ķ����б�
	public String toMyOrderInfo(){
		//��ȡָ���û�
		UserInfo userInfo=(UserInfo)session.get("CURRENT_USER");
		//��ȡָ���û��Ķ����б�
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

	//���ݶ�����Ϣ��ı�ŵõ���������ϸ��Ϣ
	public String toOrderDetail(){
		List orderDetailList=orderDetailService.getOrderDetailById(id);
		request.put("orderDetailList", orderDetailList);
		return "toOrderDetail";
	}
	//ɾ��ָ����ŵĶ���
	public String deleteSelectedOrderInfo(){
		orderInfoService.deleteOrderInfoById(id);
		return "myOrderInfo";
	}

}
