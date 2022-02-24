package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.sms.db.ConnectionProvider;
import com.sms.entity.Student;

public class StudentDao {

	public static Connection con=null;
	public static int insert(Student student) throws SQLException  {
		 con=ConnectionProvider.getConnection();
		String sql="insert into Student values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, student.getId());
		ps.setString(2, student.getName());
		ps.setString(3, student.getCity());
		int i=ps.executeUpdate();
		return i;
	}
	
	public static List<Student> getAllStudents() throws SQLException {
		  List<Student> list=new ArrayList<Student>();
		con=ConnectionProvider.getConnection();
		String sql="select * from Student";
		Statement stmt=con.createStatement(); 
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()) {
			Student student=new Student();
			student.setId(rs.getInt(1));
			student.setName(rs.getString(2));
			student.setCity(rs.getString(3));
			list.add(student);
		}
					return list; 
		}
	
	public static Student getStudentById(int id) throws SQLException{
		Student student=new Student();
		con=ConnectionProvider.getConnection();
		String sql="select * from Student where id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			student.setId(rs.getInt(1));
			student.setName(rs.getString(2));
			student.setCity(rs.getString(3));
		}
		return student;
	}
	
	public static int updateStudent(Student student) throws SQLException {
		int status=0;
		con=ConnectionProvider.getConnection();
		PreparedStatement ps=con.prepareStatement(  
                "update student set name=?,city=? where id=?");
		   ps.setString(1,student.getName());  
		   ps.setString(2,student.getCity());  
		   ps.setInt(3, student.getId());  
		   status=ps.executeUpdate();  
		
		return status;
	}

	public static void deleteStudent(int userId) throws SQLException{
		con=ConnectionProvider.getConnection();
		PreparedStatement ps=con.prepareStatement(  
                "delete from student where id=?");
		   ps.setInt(1,userId);  
		   ps.executeUpdate();
		   System.out.println("Data deleted");
	}
}
