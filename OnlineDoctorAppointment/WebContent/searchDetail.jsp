<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.oda.Dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.oda.dba.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

<style>
center {
	height: 500px;
	width: 100%;
	background-color: #fff;
}

table {
	margin-top: 10px;
	padding-top: 10px;
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

<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/login-register.css">


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
			<li><a href="PatientViewAppointment.jsp">View-Appointment</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
		</nav>
	</div>
	</header>

	<center>
		<table>
			<tr>
				<th>Doctor name</th>
				<th>category</th>
				<th>Mobile no</th>
				<th>fees</th>
				<th>timing</th>
				<th>email</th>
				<th>location</th>
				<th>book</th>
			</tr>
			<%
				String category = request.getParameter("category");
				String location = request.getParameter("location");
				try {
					Connection con = ConnectionProvider.getConnection();
					Statement statement = con.createStatement();
					String sql = "select * from doctor where category='" + category + "' and location='" + location + "' ";
					ResultSet resultSet = statement.executeQuery(sql);
					if (resultSet.next()) {
			%>
			<tr>
				<td><%=resultSet.getString(1)%></td>
				<td><%=resultSet.getString(6)%></td>
				<td><%=resultSet.getString(9)%></td>
				<td><%=resultSet.getString(8)%></td>
				<td><%=resultSet.getString(7)%></td>
				<td><%=resultSet.getString(5)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><a
					href="bookAppointment.jsp?name=<%=resultSet.getString(1)%>">book</a></td>
			</tr>
			<%
				} else {
						out.println("<h1>record not found</h1>");
					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
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