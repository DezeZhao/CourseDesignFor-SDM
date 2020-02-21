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
	//调用商品信息的业务逻辑层
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
		//从session中取出购物车，放入map对象的cart中
		Map cart=(Map)session.get("cart");
		//获取当前要添加至购物车的商品
		ProductInfo productInfo=(ProductInfo)productInfoService.getProductInfoByPiId(productInfoId);
		//如果购物车不存在，则创建购物，并存入到session中
		if(cart==null){
			cart=new HashMap();
			session.put("cart", cart);	
		}
		//如果存在购物车则判断要添加的商品是否已在购物车
		CartItemBean cartItem=(CartItemBean)cart.get(productInfo.getId());
		if(cartItem!=null){
			//如果商品在购物车中，则更新其数量即可
			cartItem.setQuantity(cartItem.getQuantity()+1);
		}else{
			//否则创建一个商品条目至购物车中
			cart.put(productInfo.getId(), new CartItemBean(productInfo,1));
		}
		//页面跳转到cart.jsp
		return "shopcart";
	}
	//更新修改后的商品数量
	public String updateProductQuantity(){
	    Map cart=(Map)session.get("cart");
	    CartItemBean cartItem=(CartItemBean)cart.get(productInfoId);
	    cartItem.setQuantity(quantity);
		return "shopcart";
	}
	//删除选中的购物车商品项
	public String deleteSelectedItem(){
	    Map cart=(Map)session.get("cart");
	    cart.remove(productInfoId);
		return "shopcart";
	}
	//清空购物车
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
	//在购物车中点击商品的图片或简介查看商品详情
	public String showDetailInCart(){
		ProductInfo detailProductInfo=productInfoService.getProductInfoByPiId(productInfoId);
		request.put("detailProductInfo", detailProductInfo);
		return "display";
	}
	

}
