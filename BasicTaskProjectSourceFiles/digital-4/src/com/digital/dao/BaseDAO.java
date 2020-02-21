package com.digital.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class BaseDAO {
	public Connection getConnection(){
		Connection conn=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/digital?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT","root","zdz199804103033");
		}catch(Exception e){
	        e.printStackTrace();
		}
		return conn;
	}
	
	public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs){
		if(rs!=null)
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		if(pstmt!=null)
			try{
				pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		if(conn!=null){
			try{
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
