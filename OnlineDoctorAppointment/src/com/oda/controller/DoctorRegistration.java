package com.oda.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oda.Dao.DoctorDao;
import com.oda.bean.DocBean;

public class DoctorRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = null, password = null, location = null, gender = null, email = null, category = null;
		String timing = null, mobile = null, experience = null, degree = null;

		// check register button click event not null
		if (request.getParameter("btn_register") != null) {
			name = request.getParameter("docName");
			password = request.getParameter("password");
			location = request.getParameter("location");
			gender = request.getParameter("gender");
			email = request.getParameter("email");
			category = request.getParameter("category");
			timing = request.getParameter("time");
			mobile = request.getParameter("mobile");
			experience = request.getParameter("experience");
			degree = request.getParameter("degree");
		}

		DocBean db = new DocBean();
		db.setName(name);
		db.setPassword(password);
		db.setLocation(location);
		db.setGender(gender);
		db.setEmail(email);
		db.setCategory(category);
		db.setTiming(timing);
		db.setMobile(mobile);
		db.setExperience(experience);
		db.setDegree(degree);

		int status = DoctorDao.save(db);
		if (status > 0) {

			out.println("Saved successfully!<br><br>");
			request.getRequestDispatcher("doctor.jsp").include(request, response);

		} else {
			out.println("Sorry! unable to save record");
			request.getRequestDispatcher("doctorRegistration.jsp").include(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>DoctorReg</title>");
		out.println("</head>");
		out.print("<body>");

		String docname = request.getParameter("docname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("mobile");
		String location=request.getParameter("location");
		String category=request.getParameter("category");
		String timing=request.getParameter("timing");
		String experience=request.getParameter("experience");
		String degree=request.getParameter("degree");
		
		DocBean doc = new DocBean();
		doc.setName(docname);
		doc.setEmail(email);
		doc.setPassword(password);
		doc.setMobile(contact);
		doc.setLocation(location);
		doc.setCategory(category);
		doc.setTiming(timing);
		doc.setExperience(experience);
		doc.setDegree(degree);

		int status = DoctorDao.update(doc);
		if (status > 0) {

			out.println("<h3><center>Updated successfully!</center></h3>");
			request.getRequestDispatcher("updateProfile.jsp").include(request, response);
		} else {
			out.println("Sorry! unable to save record");
		}

		out.close();

		out.print("</body>");
		out.print("</html>");

	}

}
