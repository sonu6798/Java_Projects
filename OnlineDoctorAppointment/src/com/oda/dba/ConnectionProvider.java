package com.oda.dba;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinedoctorappointment", "root", "root");

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return con;
	}
}
