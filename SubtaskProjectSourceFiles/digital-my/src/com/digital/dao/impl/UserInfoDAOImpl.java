package com.digital.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.digital.dao.UserInfoDAO;
import com.digital.entity.UserInfo;


public class UserInfoDAOImpl implements UserInfoDAO {

    SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<UserInfo> search(UserInfo user) {
		List<UserInfo> uiList=null;
		Session session=sessionFactory.getCurrentSession();
		Criteria criteria=session.createCriteria(UserInfo.class);
		Example example=Example.create(user);
		criteria.add(example);
		uiList=criteria.list();
		return uiList;
	}

	@Override
	public int addUser(UserInfo user) {
		Session session=null;
		try{
			session =  sessionFactory.openSession(); 
			Transaction transaction=session.beginTransaction();
			session.save(user);
			transaction.commit();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("提交数据出错了");
			return 0;
		}finally {
			session.close();	
		}
		return 1;
	}
}
