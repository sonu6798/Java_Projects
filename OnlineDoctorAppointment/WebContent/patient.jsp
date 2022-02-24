<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient</title>
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/fontawesome.min.css">
<link rel="stylesheet" href="css/loginstyle.css">
</head>
<body>
	<form action="patientLog" method="post" class="login-form">
		<a href="index.html"><i class="fas fa-home"></i> home</a>
		<h1>Patient Sign In</h1>

		<div class="textb">
			<input type="text" name="name" required>
			<div class="placeholder">Username</div>
		</div>

		<div class="textb">
			<input type="text" name="email" required>
			<div class="placeholder">Enter Email</div>
		</div>

		<div class="textb">
			<input type="password" name="password" required>
			<div class="placeholder">Password</div>
			<div class="show-password fas fa-eye-slash"></div>
		</div>

		<input type="submit" value="submit" disabled class="btn" /> <a
			href="patientRegistration.jsp">Can't Sign in?<br>Create
			Account
		</a>

	</form>

	<script>
		var fields = document.querySelectorAll(".textb input");
		var btn = document.querySelector(".btn");
		function check() {
			if (fields[1].value != "" && fields[2].value != "")
				btn.disabled = false;
			else
				btn.disabled = true;
		}

		fields[1].addEventListener("keyup", check);
		fields[2].addEventListener("keyup", check);

		document.querySelector(".show-password").addEventListener("click",
				function() {
					if (this.classList[2] == "fa-eye-slash") {
						this.classList.remove("fa-eye-slash");
						this.classList.add("fa-eye");
						fields[2].type = "text";
					} else {
						this.classList.remove("fa-eye");
						this.classList.add("fa-eye-slash");
						fields[2].type = "password";
					}
				});
	</script>
</body>
</html>