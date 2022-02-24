package com.oda.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oda.bean.PatientBean;
import com.oda.Dao.PatientDao;

public class PatientReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("patientName");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String contact = request.getParameter("mobile");
		String address = request.getParameter("address");

		PatientBean pb = new PatientBean();
		pb.setPatientName(name);
		pb.setPassword(password);
		pb.setGender(gender);
		pb.setDob(dob);
		pb.setEmail(email);
		pb.setAddress(address);
		pb.setMobile(contact);

		int status = PatientDao.save(pb);
		if (status > 0) {
			out.println("<h3>Registered successfully!</h3>");
			out.print("<br>");
			request.getRequestDispatcher("patient.jsp").include(request, response);
		} else {
			out.println("Sorry unable to save record");
			request.getRequestDispatcher("patientRegistration.jsp").include(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");

		PatientBean up = new PatientBean();
		up.setPatientName(name);
		up.setAddress(address);
		up.setMobile(contact);
		up.setEmail(email);
		up.setPassword(password);

		int status = PatientDao.update(up);
		if (status > 0) {
			out.println("<center><h3>update successfully!</h3></center>");
			request.getRequestDispatcher("PatientHomepage.jsp").include(request, response);
		} else {

			out.println("Sorry! unable to update record");
		}

		out.close();

		out.print("<br></body>");
		out.print("</html>");

	}

}
