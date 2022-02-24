package com.oda.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.oda.bean.DocBean;
import com.oda.dba.ConnectionProvider;

public class DoctorDao {

	
	public static boolean validate(String email, String password) {
		boolean status = false;
		String sql = "select * from doctor where email=? and password=?";
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	
	public static int save(DocBean db) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into doctor values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, db.getSno());
			ps.setString(2, db.getName());
			ps.setString(3, db.getPassword());
			ps.setString(4, db.getLocation());
			ps.setString(5, db.getGender());
			ps.setString(6, db.getEmail());
			ps.setString(7, db.getCategory());
			ps.setString(8, db.getTiming());
			ps.setString(9, db.getMobile());
			ps.setString(10, db.getExperience());
			ps.setString(11, db.getDegree());

			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error " + e);
		}
		return status;
	}

	
	public static List<DocBean> getAllDoctors() {
		List<DocBean> list = new ArrayList<DocBean>();

		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from doctor");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DocBean db = new DocBean();
				db.setSno(rs.getInt(1));
				db.setName(rs.getString(2));
				db.setLocation(rs.getString(4));
				db.setGender(rs.getString(5));
				db.setEmail(rs.getString(6));
				db.setCategory(rs.getString(7));
				db.setTiming(rs.getString(8));
				db.setMobile(rs.getString(9));
				db.setExperience(rs.getString(10));
				db.setDegree(rs.getString(11));
				list.add(db);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	public static int update(DocBean dc) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update doctor set name=?,password=?,mobile=?,location=?,category=?,timing=?,experience=?,degree=? where email=?");
			ps.setString(1, dc.getName());
			ps.setString(2, dc.getPassword());
			ps.setString(3, dc.getMobile());
			ps.setString(4, dc.getLocation());
			ps.setString(5, dc.getCategory());
			ps.setString(6, dc.getTiming());
			ps.setString(7, dc.getExperience());
			ps.setString(8, dc.getDegree());
			ps.setString(9, dc.getEmail());
			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
