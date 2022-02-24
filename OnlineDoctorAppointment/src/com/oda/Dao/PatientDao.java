package com.oda.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.oda.bean.PatientBean;

import com.oda.dba.ConnectionProvider;

public class PatientDao {
	
	public static int save(PatientBean pb) {
		int status = 0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into Patient values(?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, pb.getSno());
			ps.setString(2, pb.getPatientName());
			ps.setString(3, pb.getPassword());
			ps.setString(4, pb.getGender());
			ps.setString(5, pb.getDob());
			ps.setString(6, pb.getEmail());
			ps.setString(7, pb.getAddress());
			ps.setString(8, pb.getMobile());

			status = ps.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	
	public static boolean validate(String email, String password) {
		boolean status = false;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from Patient where email=? and password=?");
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

	
	public static List<PatientBean> getAllPatients() {
		List<PatientBean> list = new ArrayList<PatientBean>();

		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Patient");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				PatientBean pb = new PatientBean();
				pb.setSno(rs.getInt(1));
				pb.setPatientName(rs.getString(2));
				pb.setGender(rs.getString(4));
				pb.setDob(rs.getString(5));
				pb.setEmail(rs.getString(6));
				pb.setAddress(rs.getString(7));
				pb.setMobile(rs.getString(8));
				list.add(pb);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	public static int update(PatientBean up) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ups = con
					.prepareStatement("update Patient set name=?,address=?,mobile=?,password=? where email=?");
			ups.setString(1, up.getPatientName());
			ups.setString(2, up.getAddress());
			ups.setString(3, up.getMobile());
			ups.setString(4, up.getPassword());
			ups.setString(5, up.getEmail());

			status = ups.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

}
