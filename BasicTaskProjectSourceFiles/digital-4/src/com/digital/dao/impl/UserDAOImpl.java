package com.digital.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.digital.dao.BaseDAO;
import com.digital.dao.UserDAO;
import com.digital.entity.User;

public class UserDAOImpl extends BaseDAO implements UserDAO{

	Connection connection=null;
	PreparedStatement preparedStatement=null;
	ResultSet resultSet=null;
	
	public int addUser(User user) {
		int result=0;
		String sql="INSERT INTO user_info(userName,password,realName,address,email) values (?,?,?,?,?)";
		try{
			connection=this.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getRealName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getRealName());
			preparedStatement.setString(4, user.getAddress());
			preparedStatement.setString(5, user.getEmail());
			result=preparedStatement.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(connection,preparedStatement,resultSet);
		}
		return result;
	}  
}
