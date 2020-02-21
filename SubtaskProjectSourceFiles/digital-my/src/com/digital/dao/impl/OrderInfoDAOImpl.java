package com.digital.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.digital.dao.OrderInfoDAO;
import com.digital.entity.OrderInfo;

public class OrderInfoDAOImpl implements OrderInfoDAO {

	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    //根据用户id得到其订单列表
	@Override
	public List getOrderInfoByUserInfoId(int userInfoId) {
		Session session=sessionFactory.getCurrentSession();
		Criteria criteria=session.createCriteria(OrderInfo.class);
		criteria.add(Restrictions.eq("userInfo.id", userInfoId));
		return criteria.list();
	}
    //根据订单编号得到订单信息
	@Override
	public OrderInfo getInfoById(int id) {
		Session session=sessionFactory.getCurrentSession();
		OrderInfo orderInfo=(OrderInfo)session.get(OrderInfo.class,id);
		return orderInfo;
	}
    //删除订单信息
	@Override
	public void deleteOrderInfo(OrderInfo orderInfo) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(orderInfo);
	}

}
