<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: lightblue;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 20%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<center>
		<table>
			<tr>
				<td><h2>Login Form</h2></td>
			</tr>

			<form action="login" method="post">
				<tr>
					<td>
						<div class="imgcontainer">
							<img src="images/login photo.png" alt="Avatar" class="avatar">
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="uname"><b>Username</b></label></td>
					<div class="container">
				</tr>
				<tr>
					<td><input type="text" placeholder="nav@gmail.com" name="name"
						pattern=".+@gmail.com" size="30" required></td>
				</tr>

				<tr>
					<td><label for="psw"><b>Password</b></label></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="Enter Password"
						name="pass" required></td>
				</tr>

				<tr>
					<td><button type="submit">Login</button></td>
				</tr>
				
				</div>

				<div class="container" style="background-color: #f1f1f1">
					<tr>
						<td><button type="reset" class="cancelbtn">Cancel</button></td>
					</tr>
					<tr>
						<td><span class="psw"><a href="reg.jsp">new user</a></span></td>
					</tr>
					<tr>
						<td><span class="psw"><a href="change.jsp">change password</a></span></td>
					</tr>
					<tr>
						<td><span class="psw">forget<a href="forget.jsp">password</a></span></td>
					</tr>
				</div>
			</form>
		</table>
	</center>
</body>
</html>