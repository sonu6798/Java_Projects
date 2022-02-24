package com.oda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oda.Dao.AppointmentDao;
import com.oda.bean.AppointmentBean;

public class AppointmentReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = null, gender = null, email = null, category = null, mobile = null, date = null;
		int age = 0;

		// check register button click event not null
		if (request.getParameter("btn_register") != null) {

			name = request.getParameter("patientName");
			gender = request.getParameter("gender");
			email = request.getParameter("email");
			category = request.getParameter("category");
			mobile = request.getParameter("mobile");
			date = request.getParameter("date");
			age = Integer.parseInt(request.getParameter("age"));
		}
		java.sql.Date d1 = java.sql.Date.valueOf(date);

		HttpSession session = request.getSession();
		String docName = (String) session.getAttribute("name");

		AppointmentBean ab = new AppointmentBean();
		ab.setName(name);
		ab.setGender(gender);
		ab.setEmail(email);
		ab.setCategory(category);
		ab.setMobile(mobile);
		ab.setDate(d1);
		ab.setAge(age);
		ab.setDocName(docName);
		int status = AppointmentDao.save(ab);
		if (status > 0) {
			request.getRequestDispatcher("PatientHomepage.jsp").include(request, response);
			response.getWriter().println("<h1>Your appointment is book.</h1>	");
		} else {
			response.getWriter().println("Sorry! unable to save record ");
		}
	}
}
