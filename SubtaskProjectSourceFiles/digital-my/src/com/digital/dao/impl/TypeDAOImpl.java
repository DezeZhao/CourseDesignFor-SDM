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
		//ͨ��sessionfactory��ȡsession
        Session session=sessionFactory.getCurrentSession();
        //����Criteria����
        Criteria criteria=session.createCriteria(Type.class);
        //ִ�в�ѯ����ȡ����
        typeList=criteria.list();
		return typeList;
	}

}
