<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="bean.User"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
User ub=new User();

Configuration conn=new Configuration().configure().addAnnotatedClass(User.class);
   SessionFactory sf=conn.buildSessionFactory();
   Session sess=sf.openSession();
   Transaction ts=sess.beginTransaction();
  
String email=request.getParameter("name");
String opass=request.getParameter("opass");
String pass=request.getParameter("pass");
String cpass=request.getParameter("cpass");
ub=(User) sess.get(User.class,email);
try{
	if(opass.equals(ub.getPass()))
	{
	if(pass.equals(cpass))

{
	
	
	ub.setPass(pass);
	ts.commit();
	sess.close();
	
	response.setContentType("text/html");
	//PrintWriter out1=response.getWriter();
	out.println("<script>alert('data entered successfully')</script>");
	request.getRequestDispatcher("login.jsp").include(request, response);
}

else
{
	response.setContentType("text/html");
	//PrintWriter out1=response.getWriter();
	out.println("<script>alert('password and confirm password not match')</script>");
	request.getRequestDispatcher("forget.jsp").include(request, response);
}
	}
	else
	{
		response.setContentType("text/html");
		//PrintWriter out1=response.getWriter();
		out.println("<script>alert('your old password not match')</script>");
		request.getRequestDispatcher("change.jsp").include(request, response);
	}
	
}catch(Exception ex)
{
response.setContentType("text/html");
//PrintWriter out1=response.getWriter();
out.println("<script>alert('enter valid email')</script>");
request.getRequestDispatcher("forget.jsp").include(request, response);
}

%>
</body>
</html>