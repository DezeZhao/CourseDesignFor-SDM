package com.digital.service;

import com.digital.entity.ProductInfo;

import java.util.List;

public interface ProductInfoService {
    //得到所有商品信息
	public List<ProductInfo> getAllProductInfo();
    //根据商品id得到商品的信息
    public ProductInfo getProductInfoByPiId(int piId);
    //根据商品ids的字符串查询已经浏览过的商品列表
    public List<ProductInfo> getBrowsingProductInfo(String ids);
}
