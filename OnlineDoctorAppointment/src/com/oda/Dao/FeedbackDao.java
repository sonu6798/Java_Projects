package com.oda.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.oda.bean.FeedbackBean;
import com.oda.dba.ConnectionProvider;

public class FeedbackDao {

	
	public static int save(FeedbackBean fb) {
		int status = 0;
		try {
			String sql = "insert into feedback values(?,?,?,?,?)";
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, fb.getSno());
			ps.setString(2, fb.getName());
			ps.setString(3, fb.getEmail());
			ps.setString(4, fb.getContact());
			ps.setString(5, fb.getSuggestion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception se) {
			se.printStackTrace();
		}
		return status;
	}

	
	public static List<FeedbackBean> getAllFeedback() {
		List<FeedbackBean> list = new ArrayList<FeedbackBean>();

		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from feedback ORDER BY name");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FeedbackBean fb = new FeedbackBean();
				fb.setSno(rs.getInt(1));
				fb.setName(rs.getString(2));
				fb.setEmail(rs.getString(3));
				fb.setContact(rs.getString(4));
				fb.setSuggestion(rs.getString(5));
				list.add(fb);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
