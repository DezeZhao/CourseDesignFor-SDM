package com.digital.dao;

import java.util.List;

import com.digital.entity.ProductInfo;

public interface ProductInfoDAO {
	//�õ�������Ʒ�б�
	public List<ProductInfo>getAll();
	//������ƷID��ѯ��Ʒ��Ϣ
	public ProductInfo getProductInfoByPiId(int piId);
    //������Ʒid��ѯ��Ʒ�б�
    public List<ProductInfo> getByPids(String pids);
}
