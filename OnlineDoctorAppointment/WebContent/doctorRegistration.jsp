<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Doctor Register</title>

<link rel="stylesheet" href="./css/style.css">

<link rel="stylesheet" href="css/login-register.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="icon" type="type/jpg" href="./images/icon1.jpg"
	style="border-radius:50%; height: 15px;width: 15px;">

<!-- javascript for registeration form validation-->
<script>
	function validate() {
		var first_name = /^[a-z A-Z]+$/;  
		var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
		var password_valid = /^[A-Z a-z 0-9 @$%&*]{6,12}$/;  

		var fname = document.getElementById("fname"); 
		var email = document.getElementById("email"); 
		var password = document.getElementById("password"); 
		var password2 = document.getElementById("password2"); 
		var location = document.getElementById("location"); 
		var gender = document.getElementById("gender"); 
		var category = document.getElementById("category"); 
		var timing = document.getElementById("timing"); 
		var experience = document.getElementById("experience"); 
		var mobile = document.getElementById("mobile"); 
		var degree = document.getElementById("degree"); 

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
		if (!password_valid.test(password.value) || password.value == '') {
			alert("Password Must Be 6 to 12 and allowed @$%&* character");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}
		if (!password_valid.test(password2.value) || password2.value == '') {
			alert("Password Must Be 6 to 12 and allowed @#$%&* character");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (password.value != password2.value) {
			alert('Passwords does not match');
			return false;
		}

		if (location.value == '') {
			alert("Enter Location");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (gender.value == '') {
			alert("Enter Gender");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (category.value == '') {
			alert("Enter Category");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (timing.value == '') {
			alert("Enter Timing");
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

		if (experience.value == '') {
			alert("Enter Experience");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}

		if (degree.value == '') {
			alert("Enter degree");
			password.focus();
			password.style.background = '#f08080';
			return false;
		}
	}

	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	function myFunction1() {
		var x = document.getElementById("password2");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
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
					<li class="current"><a href="index.html">Home</a></li>
					<li><a href="department.html">Specialists</a></li>
					<li><a href="about.html">About</a></li>
				</ul>
			</nav>
		</div>
	</header>


	<div class="main-content">

		<form class="form-register" method="post"
			onsubmit="return validate();" action="docRegister">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Registration</h1>
					</div>


					<div class="form-row">
						<label> <span>Doctor Name</span> <input type="text"
							name="docName" id="fname" placeholder="enter name">
						</label>
					</div>
					<div class="form-row">
						<label> <span>Email</span> <input type="text" name="email"
							id="email" placeholder="enter email">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Password</span> <input type="password"
							name="password" class="active" id="password"
							placeholder="enter email"> <input type="checkbox"
							id="pass" onclick="myFunction()">Show
						</label>
					</div>


					<div class="form-row">
						<label> <span>Password Check</span> <input type="password"
							name="txt_password" id="password2" placeholder="enter password">
						</label> <input type="checkbox" id="pass" onclick="myFunction1()">Show
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
						<label> <span>Gender</span> <input type="radio"
							name="gender" id="gender" value="male">Male <input
							type="radio" name="gender" id="gender" value="female">Female
						</label>
					</div>

					<div class="form-row">
						<label> <span>Specialists</span> 
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
						<label> <span>Timing</span> <input type="text" name="time"
							id="timing" placeholder="enter timing">
						</label>
					</div>


					<div class="form-row">
						<label> <span>Contact No.</span> <input type="text"
							name="mobile" id="mobile" placeholder="enter contact no.">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Experience</span> <input type="text"
							name="experience" id="experience" placeholder="enter experience">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Degree</span> <input type="text"
							name="degree" id="degree" placeholder="enter degree">
						</label>
					</div>



					<input type="submit" name="btn_register" value="Register">

				</div>

				<a href="doctor.jsp" class="form-log-in-with-existing">Already
					have an account? <b> Login here </b>
				</a>

			</div>

		</form>

	</div>
	<footer>
		<p>
			<a href="contact.html">Contact</a> |<a href="feedback.jsp">Feedback</a>|

			<a href="#" class="fab fa-facebook"></a> <a href="#"
				class="fab fa-twitter"></a>
		</p>
		<p>Stay Healthy Hospital, Copyright&copy; 2010</p>
	</footer>

</body>

</html>
