<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: lightblue;
}

* {
	box-sizing: border-box
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

textarea {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 20%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: none;
	width: 20%;
	
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
</style>
<body>

	<form action="Register" method="post" style="border: 1px solid #ccc">
		<div class="container">
			<center>
				<h1>Sign Up</h1>
				<p>Please fill in this form to create an account.</p>

				<table>
					<tr>
						<td>Enter email id</td>
						<td><input type="text" placeholder="eg nav@gmail.com"
							pattern=".+@gmail.com" size="30" name="email" required></td>
					</tr>

					<tr>
						<td>Enter Name:</td>
						<td><input type="text" name="name" placeholder="Enter name"
							required></td>
					</tr>
					<tr>
						<td>Enter password:</td>
						<td><input type="password" name="pass"
							placeholder="Enter the password"></td>
					</tr>

					<tr>
						<td>Enter Phone number:</td>
						<td><input type="text" name="mobile" placeholder="1234567890"
							pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required></td>
					</tr>


					<tr>
						<td>Enter Address:</td>
						<td><input type="text" name="address" size='40'></td>

					</tr>
					<tr>

						<td>Choose Gender:</td>
						<td><input type="radio" name="gender" value="male" checked>Male
							<input type="radio" name="gender" value="female">Female</td>
					</tr>
					<tr>
						<td>Enter Height:</td>
						<td><input type="text" name="height"
							placeholder="Enter height in cm" required></td>
					</tr>
					<tr>
						<td>Enter Weight:</td>
						<td><input type="text" name="weight"
							placeholder="Enter Weight in kg" required></td>
					</tr>


				</table>
			</center>




			<div class="clearfix">
				
			<center>	 
					
						<button type="reset" class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn">Sign Up</button>
					</center>
				
			
			</div>
		</div>
	</form>

</body>
</html>