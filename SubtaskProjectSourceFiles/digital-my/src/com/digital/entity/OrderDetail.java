package com.digital.entity;

public class OrderDetail {
    private Integer id;//订单明细编号
    private ProductInfo productInfo;//商品信息(匹配商品id)
    private OrderInfo orderInfo;//订单信息（匹配订单信息id）
    private Integer num;//商品数量
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public ProductInfo getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(ProductInfo productInfo) {
		this.productInfo = productInfo;
	}
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public OrderDetail() {
		super();
	}
	public OrderDetail(Integer id, ProductInfo productInfo, OrderInfo orderInfo, Integer num) {
		super();
		this.id = id;
		this.productInfo = productInfo;
		this.orderInfo = orderInfo;
		this.num = num;
	}
        
    
}
