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
				<td><h2>Who are You....</h2></td>
			</tr>

			<form>
				<tr>
					<td>
						<div class="imgcontainer">
							<img src="images/login photo.png" alt="Avatar" class="avatar">
						</div>
					</td>
				</tr>
				
				<tr>
					<td><button type="submit" formaction="Admin.jsp">Admin</button></td>
				</tr>
              
              <tr>
					<td><button type="submit" formaction="login.jsp">User</button></td>
			  </tr>
              
			</form>
		</table>
	</center>
</body>
</html>