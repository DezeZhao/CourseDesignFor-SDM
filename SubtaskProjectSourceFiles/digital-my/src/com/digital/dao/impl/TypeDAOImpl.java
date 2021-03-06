package com.digital.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.digital.dao.TypeDAO;
import com.digital.entity.Type;

public class TypeDAOImpl implements TypeDAO {

	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Type> getAll() {
		List<Type> typeList=null;
		//通过sessionfactory获取session
        Session session=sessionFactory.getCurrentSession();
        //创建Criteria对象
        Criteria criteria=session.createCriteria(Type.class);
        //执行查询，获取对象
        typeList=criteria.list();
		return typeList;
	}

}
