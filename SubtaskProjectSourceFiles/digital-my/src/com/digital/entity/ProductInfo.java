package com.digital.entity;

import java.util.HashSet;
import java.util.Set;

public class ProductInfo {
/*	id
	code
	name
	tid
	brand
	picture
	img2 img3 img4
	inventory
	price
	introduce
	status
	credit
	shop
	location
*/

	private Integer id;//���
	private String code;//��Ʒ����
	private String name;//��Ʒ��
	private Type type;//��Ʒ����
	private String brand;//Ʒ��
	private String picture;//��Ʒ��ͼ
	private String img2;//��һ��Сͼ
	private String img3;//�ڶ���Сͼ
	private String img4;//������Сͼ
	private Integer inventory;//���
	private Double price;//����
	private String introduce;//���
	private Integer status;//����״̬
	private Integer credit;//��Ʒ����
	private String shop;//���۵���
	private String location;//���۵ص� 
	private Set orderDetail=new HashSet(0);//������ϸ
	//һ����Ʒ�����Ƕ��������ϸ��������ݣ�һ�Զࣩ
	//�����ü�������ʾ
	
	public Set getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(Set orderDetail) {
		this.orderDetail = orderDetail;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	public String getShop() {
		return shop;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public ProductInfo() {
		super();
	}
	
	
}