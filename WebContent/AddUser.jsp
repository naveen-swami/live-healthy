<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="org.hibernate.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.*"%>
<%@ page import ="org.hibernate.SessionFactory"%>
<%@ page import ="org.hibernate.cfg.Configuration" %>
<%@ page import="bean.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
 #div1
 {
    height:100px;
    background-color:grey;
 }
 
 #div2
 { 
    float:left;
     width: 60%;
    height:600px;
    background:linear-gradient(#66ccff 0%,#999966 100%);
 }
 
 #div3
 {
    height:600px;
    background:linear-gradient(#66ccff 0%,#999966 100%);
 }
 
 #table1,#th1,#td1
 {
    border:2px solid black;
   
 }
 
ul
{
  list-style-type:none;
  padding:0;
  overflow:hidden;
  background-color:#333333;
}

li
{
  float:left;
}

li a
{
  padding:15px;
  display:block;
  color:white;
  text-decoration:none;
  text-align:center;
}

#t1
{
  border-radius:15px;
  height:40px;
}
 

</style>
<%
   if(request.getParameter("bdelete")!=null)
   {
	   
	   if(!request.getParameter("delete").equals(""))
	   {
		   RequestDispatcher dp=request.getRequestDispatcher("Adduser");
		   dp.forward(request,response);
		      
	    }
	   
	   else
	   {
		   out.print("<script>alert('Email Is Empty')</script>"); 
		  
	   }
	   
	   
  }
%>
<body>
<form>

<div id="div1">
  <center><font size="10" style="color:white;">Live Healthy</font></center>
  <div style="background-color:grey;">
     <p align="right"><font size="5" >Contact:9587403995 &nbspemail:Naveen96swami@gmail.com</font></p>
  </div>
</div>
 <ul>
  <li><a href="AddExercise.jsp">Add Exercise</a></li>
  <li><a href="index.jsp">Logout</a>
 </ul> 
<div style="width:100%;">
<div id="div2" >
 
       <table id="table1" width="800">
         <tr>
           <th id="th1"><h2>Name</h2></th>
           <th id="th1"><h2>Email</h2></th>
           
           <th id="th1"><h2>mobile</h2></th>
           <th id="th1"><h2>Address</h2></th>
           <th id="th1"><h2>Gender</h2></th>
           
           <th id="th1"><h2>Status</h2></th>
           
          </tr> 
           
          <% 
             
              Configuration conn=new Configuration().configure().addAnnotatedClass(User.class);
              SessionFactory sf=conn.buildSessionFactory();
  		      Session sess=sf.openSession();
  		      Transaction ts=sess.beginTransaction();
  		      Query q=sess.createQuery("from User");
  		      List<User> rs=q.list();
  		      
  		      ts.commit();
  		      for(User stud:rs)
  		      {  %>
  		    	 <tr>
  		    	   <td id="td1"><font color="white"><%= stud.getName() %></font></td>
  		    	   <td id="td1"><font color="white"><%= stud.getEmail() %></font></td>
  		    	   
  		    	   <td id="td1"><font color="white"><%= stud.getMobile() %></font></td>
  		    	   <td id="td1"><font color="white"><%= stud.getAddress() %></font></td>
  		    	   <td id="td1"><font color="white"><%= stud.getGender() %></font></td>
  		    	   
  		    	   <td id="td1"><font color="white"><%= stud.getStatus() %></font></td> 
  		    	  
  		    	</tr>
  		    <% 
  		        } 
            %>  
        </table>
   </div>
   <div id="div3" style="flote:right;">
   <center>
     <h3>Change User Status</h3>
     <table>
       <tr>
         <td>Enter Email:</td>
         <td><input type="text" id="t1" name="delete"></td>
       </tr>
       <tr>
          <td></td>
          <td><input type="submit" id="t1" name="bdelete" value="Change"></td>
       </tr>
     </table>
   </center>  
   </div>
</div>
</div>
</form>
</body>
</html>