<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<%@ page import="org.hibernate.*"%>
<%@page import="java.util.List"%>
<%@ page import="bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function populate(s1, s2) {
		var s1 = document.getElementById(s1);
		var s2 = document.getElementById(s2);
		s2.innerHTML = "";
		if (s1.value == "Gym") {
			var optionArray = [ "|", "chest|Chest", "biceps|Biceps", "leg|Leg",
					"shoulder|Shoulder", "back|Back", "triceps|Triceps" ];
		} else if (s1.value == "Yoga") {
			var optionArray = [ "|", "movement|Movement",
					"restorative|Restratvie", "alignment|Alignment",
					"heated|Heated" ];
		}
		for ( var option in optionArray) {
			var pair = optionArray[option].split("|");
			var newOption = document.createElement("option");
			newOption.value = pair[0];
			newOption.innerHTML = pair[1];
			s2.options.add(newOption);
		}
	}
</script>

</head>
<style>
#div2 {
	background: linear-gradient(#66ccff 0%, #999966 100%);
	height: 460px;
}

#t1 {
	width: 400px;
	height: 40px;
	border-radius: 5px;
}

#t2 {
	width: 700px;
	height: 100px;
	border-radius: 5px;
}

ul {
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	background-color: #333333;
}

li {
	float: left;
}

li a {
	padding: 15px;
	display: block;
	color: white;
	text-decoration: none;
	text-align: center;
}

#div1 {
	height: 100px;
	background-color: grey;
}

#b1 {
	background-color: grey;
	width: 100px;
	height: 40px;
	border-radius: 10px;
}
</style>

<%
	if (request.getParameter("done") != null) {
		HttpSession sess1 = request.getSession();
		sess1.setAttribute("name", request.getParameter("uname"));
		sess1.setAttribute("type", request.getParameter("utype"));
		sess1.setAttribute("desc", request.getParameter("desc"));
		sess1.setAttribute("course", request.getParameter("course"));

		response.sendRedirect("fileupload.jsp");
	}
%>
<body>
	<form>

		<div id="div1">
			<center>
				<font size="10" style="color: white;">Live Healthy</font>
			</center>
			<div style="background-color: grey;">
				<p align="right">
					<font size="5">Contact:9587403995
						&nbspemail:Naveen96swami@gmail.com</font>
				</p>
			</div>
		</div>

		<ul>
			<li>
			<li><a href="AddUser.jsp">View Users</a></li>
			<li><a href="index.jsp">Logout</a>
		</ul>

		<div id="div2">

			<table>
				<tr>
					<td><font size="5">Enter name:</font></td>
					<td><input id="t1" type="text" name="uname" id="t1"></td>
				</tr>

				<tr>
					<td><font size="5">Choose Course:</font></td>


					<td><select id="slct1" id="t1" name="course"
						onchange="populate(this.id,'slct2')">
							<option value="">Choose Course</option>
							<option value="Gym">Gym</option>
							<option value="Yoga">Yoga</option>

					</select></td>
				</tr>
				<tr>
					<td><font size="5">Choose Exercise Type</font></td>



					<td><select id="slct2" name="utype" id="t1"></select></td>

				</tr>
				<tr>
					<td><font size="5">Description:</font></td>
					<td><textarea id="t2" name="desc" row="100" col="100"></textarea>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" name="done" id="b1" value="DONE"></td>
				</tr>
			</table>

		</div>
	</form>


</body>
</html>