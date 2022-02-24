package com.oda.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oda.bean.AppointmentBean;
import com.oda.dba.ConnectionProvider;

public class AppointmentDao {
	
	
	public static int save(AppointmentBean ab) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			String sql = "insert into appointment value(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ab.getApid());
			ps.setString(2, ab.getName());
			ps.setString(3, ab.getGender());
			ps.setString(4, ab.getEmail());
			ps.setString(5, ab.getCategory());
			ps.setString(6, ab.getMobile());
			ps.setDate(7, ab.getDate());
			ps.setInt(8, ab.getAge());
			ps.setString(9, ab.getDocName());
			status = ps.executeUpdate();
		} catch (SQLException se) {
			System.out.println("Error " + se);
		}
		return status;
	}
	
	
	public static ArrayList<AppointmentBean> getAppointmentDetail(String email) {
		ArrayList<AppointmentBean> list = new ArrayList<>();
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from appointment where email=?");
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				AppointmentBean app = new AppointmentBean();
				app.setApid(rs.getInt(1));
				app.setName(rs.getString(2));
				app.setGender(rs.getString(3));
				app.setEmail(rs.getString(4));
				app.setCategory(rs.getString(5));
				app.setMobile(rs.getString(6));
				app.setDate(rs.getDate(7));
				app.setAge(rs.getInt(8));
				app.setDocName(rs.getString(9));

				list.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static int cancel(int apid) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from appointment where apid=?");
			ps.setInt(1, apid);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	
	public static ArrayList<AppointmentBean> getAppointmentbyName(String name) {
		ArrayList<AppointmentBean> list = new ArrayList<>();
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from appointment where docName=?");
			ps.setString(1, name);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				AppointmentBean app = new AppointmentBean();
				app.setApid(rs.getInt(1));
				app.setName(rs.getString(2));
				app.setGender(rs.getString(3));
				app.setEmail(rs.getString(4));
				app.setCategory(rs.getString(5));
				app.setMobile(rs.getString(6));
				app.setDate(rs.getDate(7));
				app.setAge(rs.getInt(8));

				list.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
