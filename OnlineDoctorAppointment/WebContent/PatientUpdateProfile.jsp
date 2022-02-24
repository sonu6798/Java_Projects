<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oda.dba.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

<script>
	function myFunction() {
		var x = document.getElementById("mypassword");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
<style>
.reg table {
	width: 500px;
	height: 425px;
	border-style: 50px;
	background-color: floralwhite;
}

.reg input[type="number"], input[type="text"], input[type="password"],
	input[type="date"] {
	width: 300px;
	height: 35px;
}

.reg input[readonly="readonly"] {
	width: 300px;
	height: 35px;
	background-color: #f1f1f1;
}

.reg input[type="submit"] {
	width: 300px;
	height: 35px;
	border-radius: 30px;
	border-bottom: 2px solid black;
}

.roundbox {
	display: inline-block;
	height: 40px;
	background-color: #9C9E9E;
	width: 180px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.09);
	text-align: center;
	line-height: 40px;
	border-radius: 30px;
	cursor: pointer;
	color: yellow;
	text-decoration: none;
}

.welcome {
	display: inline-block;
	float: right;
	width: 50%;
	line-height: 40px;
	border-radius: 30px;
	cursor: pointer;
}

h1 {
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
			<li><a href="bookAppointment.jsp">Book An Appointment</a></li>
			<li><a href="PatientViewAppointment.jsp">View Appointment</a></li>
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

	<center>
		<h1>Update Profile</h1>
		<hr>


		<%
			try {
				Connection conn = ConnectionProvider.getConnection();
				Statement stat = conn.createStatement();
				String e = (String) session.getAttribute("email");
				ResultSet prs = stat.executeQuery("select * from Patient where email='" + e + "'");
				while (prs.next()) {
		%>

		<form action="patientRegister" method="get">
			<center>
				<div class="reg">

					<table>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>Name</td>
							<td><input type="text" value="<%=prs.getString("name")%>"
								name="name" placeholder="Full Name" required="required"></td>
						</tr>
						<tr>
							<td>Password :</td>
							<td><input type="password"
								value="<%=prs.getString("password")%>" name="password"
								placeholder="****" required="required" id="mypassword"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" onclick="myFunction()">Show
								Password</td>
						</tr>

						<tr>
							<td>Gender:</td>
							<td><input readonly="readonly"
								value="<%=prs.getString("gender")%>" required="required">
						<tr>
							<td>D.O.B:</td>
							<td><input readonly="readonly"
								value="<%=prs.getString("dob")%>" name="dob" required="required"></td>
						</tr>
						<tr>
							<td>Email Id:</td>
							<td><input readonly="readonly"
								value="<%=prs.getString("email")%>" name="email"
								placeholder="xyz@gmail.com"></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><textarea rows="4" cols="40" name="address"
									placeholder="Enter your full address ............"
									required="required"><%=prs.getString("address")%></textarea></td>
						</tr>
						<tr>
							<td>Contact No:</td>
							<td><input type="text" value="<%=prs.getString("mobile")%>"
								pattern="^\d{10}$" name="contact" placeholder="xxxxxxxxx"
								required="required"></td>
						</tr>

						<tr>
							<td>
							<td><input type="submit" name="submit" value="Update">
						</tr>

					</table>
				</div>
			</center>
		</form>

	</center>
	<%
		}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<br>
	</div>

	<br>



	<footer>
	<p>
		<a href="contact.html">Contact</a> | 
		<a href="#" class="fab fa-facebook"></a> 
		<a href="#" class="fab fa-twitter"></a>
	</p>
	<p>Stay Healthy Hospital, Copyright&copy; 2010</p>
	</footer>


</body>
</html>