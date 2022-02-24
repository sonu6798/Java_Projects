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
		var x = document.getElementById("myPassword");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>

<style type="text/css">
.reg table {
	width: 500px;
	height: 425px;
	border-style: 50px;
	background-color: floralwhite;
}

.reg input[type="tel"], input[type="number"], input[type="text"], input[type="password"],
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
			<li><a href="DoctorHomepage.jsp">Home</a></li>
			<li><a href="appointmentRequest.jsp">My Appointment</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
		</nav>
	</div>
	</header>



	<%@page import="java.sql.*"%>
	<br>
	<div class="container">

		<ul>
			<li class="welcome"><marquee>
					<%
						response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
						response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
						response.setHeader("Expires", "0"); //	Proxies 	

						if (session.getAttribute("email") == null) {
							response.sendRedirect("DoctorLogin.jsp");
						} else if (session != null) {
							String name = (String) session.getAttribute("name");
							String email = (String) session.getAttribute("email");
							out.println("Hello ,  " + name);
						}
					%>
				</marquee></li>
		</ul>
		<center>
			<h1>Update Profile</h1>
		</center>

		<hr>
		<center>
			<form action="docRegister" method="get">
				<div class="reg">
					<%
						try {
							Connection conn = ConnectionProvider.getConnection();
							Statement stat = conn.createStatement();
							String e = (String) session.getAttribute("email");
							ResultSet rs = stat.executeQuery("select * from doctor where email='" + e + "'");
							while (rs.next()) {
					%>
					<table>

						<tr>
							<td>Doctor Name:</td>
							<td><input type="text" value="<%=rs.getString("name")%>"
								name="docname" placeholder="Full Name" required="required"></td>
						</tr>
						<tr>
							<td>Password :</td>
							<td><input type="password"
								value="<%=rs.getString("password")%>" name="password"
								id="myPassword" placeholder="****" required="required"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" onclick="myFunction()">Show
								Password</td>
						</tr>
						<tr>
							<td>Location :</td>
							<td><input type="text" name="location" value="<%=rs.getString("location")%>"></td>
						</tr>
						<tr>
							<td>Email ID:</td>
							<td><input type="text" value="<%=rs.getString("email")%>" name="email"
								placeholder="xyz@gmail.com" required="required"></td>
						</tr>
						<tr>
							<td>Category :</td>
							<td><input type="text" value="<%=rs.getString("category")%>"
								name="category"></td>
						</tr>
						<tr>
							<td>Timing :</td>
							<td><input type="text" value="<%=rs.getString("timing")%>"
								name="timing"></td>
						</tr>
						<tr>
							<td>Mobile :</td>
							<td><input type="text" value="<%=rs.getString("mobile")%>"
								name="mobile"></td>
						</tr>
						<tr>
							<td>Experience :</td>
							<td><input type="text"
								value="<%=rs.getString("experience")%>" name="experience"></td>
						</tr>
						<tr>
							<td>Degree :</td>
							<td><input type="text" value="<%=rs.getString("degree")%>"
								name="degree"></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="submit" name="submit" value="Update"></td>
						</tr>
					</table>
				</div>
			</form>
		</center>
		<br>
	</div>
	<%
		}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


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