package com.digital.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.digital.dao.BaseDAO;
import com.digital.dao.TypeDAO;
import com.digital.entity.Type;

public class TypeDAOImpl extends BaseDAO implements TypeDAO {
	Connection connection=null;
	PreparedStatement preparedStatement=null;
	ResultSet resultSet=null;
	@Override
	public List<Type> getAll() {
		List<Type> typelist=null;
		typelist=new ArrayList<Type>();
		String sql="select * from type";
		try{
			connection=this.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery(sql);
			Type type=null;
			while(resultSet.next()){
				type=new Type();
				type.setId(resultSet.getInt("id"));
				type.setName(resultSet.getString(2));
				typelist.add(type);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(connection,preparedStatement,resultSet);
		}
		return typelist;
	}

}
