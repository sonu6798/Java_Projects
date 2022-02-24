<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

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
			<li><a href="doctorView.jsp">Doctors</a></li>
			<li><a href="patientView.jsp">Patients</a></li>
			<li><a href="feedbackview.jsp">Feedback</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
		</nav>
	</div>
	</header>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
		response.setHeader("Expires", "0"); //	Proxies 	

		if (session.getAttribute("name") == null) {
			response.sendRedirect("admin.jsp");
		} else if (session != null) {
			String name = (String) session.getAttribute("name");
			out.println("<div style='height:40px;width:100%;margin-bottom:10px;'>");
			out.println("<h1><center>Hello,  " + name + "</center></h1>");
			out.println("</div>");
		}
	%>

	<section id="showcase">
	<div class="container">	<h1>
				Your Health <strong>is always <br>in the first place
				</strong>
			</h1>
			<h2>Empowering People to Improve Their Lives</h2>
	</div>
	</section>


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