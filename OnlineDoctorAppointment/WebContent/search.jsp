<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/login-register.css">
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

			<li><a href="PatientHomepage.jsp">Home</a></li>
			<li><a href="PatientViewAppointment.jsp">View-Appointment</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
		</nav>
	</div>
	</header>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
		response.setHeader("Expires", "0");
	%>

	<div class="main-content">

		<form class="form-register" action="searchDetail.jsp">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Search</h1>
					</div>


					<div class="form-row">
						<label> <span>Category</span> 
						<select name="category"	id="category">
								<option value="Allergist">Allergist</option>
								<option value="Anesthesiologist">Anesthesiologist</option>
								<option value="Cardiologist">Cardiologist</option>
								<option value="Dermatologist">Dermatologist</option>
								<option value="Hematologist">Hematologist</option>
								<option value="Infectious Disease Specialist">Infectious
									Disease Specialist</option>
								<option value="Nephrologist">Nephrologist</option>
								<option value="Neurologist">Neurologist</option>
								<option value="Obstetrician and Gynecologist">Obstetrician
									and Gynecologist</option>
								<option value="Oncologist">Oncologist</option>
								<option value="Ophthalmologist">Ophthalmologist</option>
								<option value="Pathologist">Pathologist</option>
								<option value="Pediatrician">Pediatrician</option>
								<option value="Physiatrist">Physiatrist</option>
								<option value="Plastic Surgeon">Plastic Surgeon</option>
								<option value="Psychiatrist">Psychiatrist</option>
								<option value="Pulmonologist">Pulmonologist</option>
								<option value="Radiologist">Radiologist</option>
								<option value="General Surgeon">General Surgeon</option>

						</select>

						</label>
					</div>
					<div class="form-row">
						<label> <span>Location</span> <select name="location"
							id="location">
								<option value="Delhi">Delhi</option>
								<option value="Chennai">Chennai</option>
								<option value="Kolkata">Kolkata</option>
								<option value="Mumbai">Mumbai</option>
						</select>
						</label>
					</div>

					<div class="form-row">
						<label> <span>Reason</span> <input type="text"
							name="reason" placeholder="enter reason">
						</label>
					</div>


					<input type="submit" value="Search">

				</div>

			</div>

		</form>

	</div>


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