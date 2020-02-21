package com.digital.entity;

public class CartItemBean {
	ProductInfo pi;
	private int quantity;
	public ProductInfo getPi() {
		return pi;
	}
	public void setPi(ProductInfo pi) {
		this.pi = pi;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public CartItemBean(ProductInfo pi, int quantity) {
		super();
		this.pi = pi;
		this.quantity = quantity;
	}
}
