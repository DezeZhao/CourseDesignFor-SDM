package com.digital.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.digital.entity.CartItemBean;
import com.digital.entity.ProductInfo;
import com.digital.service.ProductInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport implements SessionAware,RequestAware {
	private Integer productInfoId;
	private int quantity;
	public Integer getProductInfoId() {
		return productInfoId;
	}
	public void setProductInfoId(Integer productInfoId) {
		this.productInfoId = productInfoId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	//������Ʒ��Ϣ��ҵ���߼���
	ProductInfoService productInfoService;
	public void setProductInfoService(ProductInfoService productInfoService) {
		this.productInfoService = productInfoService;
	}
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	public String addToShopCart(){
		//��session��ȡ�����ﳵ������map�����cart��
		Map cart=(Map)session.get("cart");
		//��ȡ��ǰҪ��������ﳵ����Ʒ
		ProductInfo productInfo=(ProductInfo)productInfoService.getProductInfoByPiId(productInfoId);
		//������ﳵ�����ڣ��򴴽���������뵽session��
		if(cart==null){
			cart=new HashMap();
			session.put("cart", cart);	
		}
		//������ڹ��ﳵ���ж�Ҫ��ӵ���Ʒ�Ƿ����ڹ��ﳵ
		CartItemBean cartItem=(CartItemBean)cart.get(productInfo.getId());
		if(cartItem!=null){
			//�����Ʒ�ڹ��ﳵ�У����������������
			cartItem.setQuantity(cartItem.getQuantity()+1);
		}else{
			//���򴴽�һ����Ʒ��Ŀ�����ﳵ��
			cart.put(productInfo.getId(), new CartItemBean(productInfo,1));
		}
		//ҳ����ת��cart.jsp
		return "shopcart";
	}
	//�����޸ĺ����Ʒ����
	public String updateProductQuantity(){
	    Map cart=(Map)session.get("cart");
	    CartItemBean cartItem=(CartItemBean)cart.get(productInfoId);
	    cartItem.setQuantity(quantity);
		return "shopcart";
	}
	//ɾ��ѡ�еĹ��ﳵ��Ʒ��
	public String deleteSelectedItem(){
	    Map cart=(Map)session.get("cart");
	    cart.remove(productInfoId);
		return "shopcart";
	}
	//��չ��ﳵ
	public String clearCart(){
	    Map cart=(Map)session.get("cart");
	    cart.clear();
		return "shopcart";
	}
	
	Map<String, Object>request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
		
	}
	//�ڹ��ﳵ�е����Ʒ��ͼƬ����鿴��Ʒ����
	public String showDetailInCart(){
		ProductInfo detailProductInfo=productInfoService.getProductInfoByPiId(productInfoId);
		request.put("detailProductInfo", detailProductInfo);
		return "display";
	}
	

}
