package com.sms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection con;
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sonu","root","root");
		}catch(Exception se){
			se.printStackTrace();
		}
		
		return con;
	}
}
