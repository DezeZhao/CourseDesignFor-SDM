package com.digital.service;

import com.digital.entity.ProductInfo;

import java.util.List;

public interface ProductInfoService {
    //�õ�������Ʒ��Ϣ
	public List<ProductInfo> getAllProductInfo();
    //������Ʒid�õ���Ʒ����Ϣ
    public ProductInfo getProductInfoByPiId(int piId);
    //������Ʒids���ַ�����ѯ�Ѿ����������Ʒ�б�
    public List<ProductInfo> getBrowsingProductInfo(String ids);
}
