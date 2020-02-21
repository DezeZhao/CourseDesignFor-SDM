package com.digital.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.digital.dao.OrderDetailDAO;
import com.digital.entity.OrderDetail;

public class OrderDetailDAOImpl implements OrderDetailDAO {

	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    //查看订单明细
	@Override
	public void lookOrderDetail(OrderDetail orderDetail) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(orderDetail);
	}
    //根据订单的id得到订单明细
	@Override
	public List getOrderDetailById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Criteria criteria=session.createCriteria(OrderDetail.class);
		criteria.add(Restrictions.eq("orderInfo.id", id));
		return criteria.list();
	}

}
