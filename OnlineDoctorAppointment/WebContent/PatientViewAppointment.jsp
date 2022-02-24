<%@page import="com.oda.bean.AppointmentBean"%>
<%@page import="com.oda.Dao.AppointmentDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Appointment</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

<style>
center {
	height: 500px;
	width: 100%;
	background-color: #fff;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	border: 1px solid #ddd;
}

th {
	width: 140px;
	height: 25px;
	font-size: 20px;
	background-color: #2874A6;
	color: white;
}

td {
	width: 140px;
	height: 25px;
	font-size: 20px;
	border: 1px solid #ddd;
	text-align: center;
}
</style>

</head>
<body>

	<header>
	<div class="container">
		<div id="branding">
			<h1>
				<span class="highlight">Stay</span> Healthy
			</h1>
		</div>
		<nav>
		<ul>
			<li><a href="PatientHomepage.jsp">Home</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
		</nav>
	</div>
	</header>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
		response.setHeader("Expires", "0"); //	Proxies
	%>

	<%
		if (session.getAttribute("name") == null) {
			response.sendRedirect("appointmentReg");
		} else {
			String name = (String) session.getAttribute("name");
			out.println("<div style='height:40px;width:100%;margin-bottom:10px;'>");
			out.println("<h1><center>Hello,  " + name + "</center></h1>");
			out.println("</div>");

		}
	%>
	<center>
		<h1>Your appointment</h1>
		<table>
			<tr>
				<th>Apt-id</th>
				<th>Patient Name</th>
				<th>gender</th>
				<th>email</th>
				<th>Category</th>
				<th>mobile</th>
				<th>Date</th>
				<th>Age</th>
				<th>Doctor name</th>
				<th>Cancel</th>
			</tr>
			<%
				String email = (String) session.getAttribute("email");
				ArrayList<AppointmentBean> list = AppointmentDao.getAppointmentDetail(email);
			%>

			<%
				for (AppointmentBean app : list) {
			%>
			<tr>
				<td><%=app.getApid()%>
				<td><%=app.getName()%></td>
				<td><%=app.getGender()%></td>
				<td><%=app.getEmail()%></td>
				<td><%=app.getCategory()%></td>
				<td><%=app.getMobile()%></td>
				<td><%=app.getDate()%></td>
				<td><%=app.getAge()%></td>
				<td><%=app.getDocName()%></td>

				<td><a href="patientCancelAppointment?id=<%=app.getApid()%>">Cancel</a>
					<%
						}
					%>
			</tr>

		</table>
	</center>

	<footer>
	<p>
		<a href="contact.html">Contact</a> |
		 <a href="#" class="fab fa-facebook"></a>
		 <a	href="#" class="fab fa-twitter"></a>
	</p>
	<p>Stay Healthy Hospital, Copyright&copy; 2010</p>
	</footer>


</body>
</html>