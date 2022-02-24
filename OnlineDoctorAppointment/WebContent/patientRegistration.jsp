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
		var mobile = document.getElementById("mobile"); 

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
			alert("Password Must Be 6 to 12 and allowed @$%&* character");
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

		if (mobile.value == '') {
			alert("Enter mobile");
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
			onsubmit="return validate();" action="patientRegister">

			<div class="form-register-with-email">

				<div class="form-white-background">

					<div class="form-title-row">
						<h1>Registration</h1>
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
						<label> <span>Password</span> <input type="password"
							name="password" class="active" id="password"
							placeholder="enter password"> <input type="checkbox"
							id="pass" onclick="myFunction()">Show
						</label>
					</div>


					<div class="form-row">
						<label> <span>Password Check</span> <input type="password"
							name="txt_password" id="password2"
							placeholder="re-enter password">
						</label> <input type="checkbox" id="pass" onclick="myFunction1()">Show
					</div>

					<div class="form-row">
						<label> <span>Address</span> <input type="text"
							name="address" id="location" placeholder="enter address">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Gender</span> <input type="radio"
							name="gender" id="gender" value="male">Male <input
							type="radio" name="gender" id="gender" value="female">Female
						</label>
					</div>

					<div class="form-row">
						<label> <span>Date-of-Birth</span> <input type="date"
							name="dob" id="dob" placeholder="enter date of birth">
						</label>
					</div>

					<div class="form-row">
						<label> <span>Mobile Number</span> <input type="text"
							name="mobile" id="mobile" placeholder="enter mobileno">
						</label>
					</div>


					<input type="submit" name="btn_register" value="Register">

				</div>

				<a href="patient.jsp" class="form-log-in-with-existing">Already
					have an account? <b> Login here </b>
				</a>

			</div>

		</form>

	</div>
	<footer>
		<p>
			<a href="contact.html">Contact</a> |<a href="feedback.jsp">Feedback</a>|

			<a href="#" class="fab fa-facebook"></a> 
			<a href="#"	class="fab fa-twitter"></a>
		</p>
		<p>Stay Healthy Hospital, Copyright&copy; 2010</p>
	</footer>

</body>

</html>
