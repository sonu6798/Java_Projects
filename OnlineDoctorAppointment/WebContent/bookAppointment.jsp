<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Registration</title>

<link rel="stylesheet" href="css/login-register.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

<!-- javascript for registeration form validation-->
<script>
	function validate() {
		var first_name = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
		var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation

		var fname = document.getElementById("fname"); //textbox id fname
		var email = document.getElementById("email"); //textbox id email
		var gender = document.getElementById("gender"); //textbox id lname
		var mobile = document.getElementById("mobile"); //textbox id lname

		if (!first_name.test(fname.value) || fname.value == '') {
			alert("Enter Firstname Alphabet Only....!");
			fname.focus();
			fname.style.background = '#f08080';
			return false;
		}
		if (!email_valid.test(email.value) || email.value == '') {
			alert("Enter Valid Email....!");
			email.focus();
			email.style.background = '#f08080';
			return false;
		}

		if (gender.value == '') {
			alert("Enter Gender");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (mobile.value == '') {
			alert("Enter mobile");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

	}
</script>


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
	<div class="main-content">

		<form class="form-register" method="post"
			onsubmit="return validate();" action="appointmentReg">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Schedule Your appointment here</h1>
					</div>


					<div class="form-row">
						<label> <span>Name</span> <input type="text"
							name="patientName" id="fname" placeholder="enter name">
						</label>
					</div>
					<div class="form-row">
						<label> <span>Email</span> <input type="text" name="email"
							id="email" placeholder="enter email">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Gender</span> <input type="radio"
							name="gender" id="gender" value="male">Male <input
							type="radio" name="gender" id="gender" value="female">Female
						</label>
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
						<label> <span>Date</span> <input type="date" name="date"
							id="dob" placeholder="enter date">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Age</span> <input type="number" name="age"
							id="age" placeholder="enter age">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Mobile Number</span> <input type="text"
							name="mobile" id="mobile" placeholder="enter mobileno">
						</label>
					</div>


					<input type="submit" name="btn_register" value="Book">

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