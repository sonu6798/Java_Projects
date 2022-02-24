package com.oda.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oda.Dao.DoctorDao;

public class DoctorLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");

		if (DoctorDao.validate(email, password)) {
			out.println("welcome " + email);
			HttpSession session = request.getSession(true);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			response.sendRedirect("DoctorHomepage.jsp");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("doctor.jsp");
			out.println("<h1>invalid email or password. Please try again</h1>");
			
			rd.include(request, response);
		}

	}
}
