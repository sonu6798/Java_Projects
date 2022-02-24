package com.oda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oda.Dao.AppointmentDao;

public class PatientCancelAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int apid = Integer.parseInt(request.getParameter("id"));
		int status = AppointmentDao.cancel(apid);
		if (status > 0) {
			response.sendRedirect("PatientViewAppointment.jsp");
		} else {
			response.getWriter().println("Sorry! we can't cancel this appointment.");
		}
	}

}
