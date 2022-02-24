package com.oda.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oda.Dao.FeedbackDao;
import com.oda.bean.FeedbackBean;

public class FeedbackDb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String suggestion = request.getParameter("suggestion");

		FeedbackBean fb = new FeedbackBean();
		fb.setName(name);
		fb.setEmail(email);
		fb.setContact(contact);
		fb.setSuggestion(suggestion);

		int status = FeedbackDao.save(fb);
		if (status > 0) {
			out.println("<h1 style='color:red;'>Feedback Posted Successfully.</h1>");
			request.getRequestDispatcher("feedback.jsp").include(request, response);
		} else {
			out.println("<h3>Please Try Again.</h3>");
		}
	}

}
