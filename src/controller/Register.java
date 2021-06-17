package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.sDAO;
import bean.User;
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String email=request.getParameter("email");	
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
    String address=request.getParameter("address");
    String mobile=request.getParameter("mobile");
    String gender=request.getParameter("gender");
    String status="Active";
    //String etype=request.getParameter("etype");
    //String course=request.getParameter("course");
    String height=request.getParameter("height");
    String weight=request.getParameter("weight");
    
	User ub=new User(email, name, pass,mobile, address, gender,height, weight,status);
	sDAO sd=new sDAO();
	sd.getsession(ub);
	
    response.setContentType("text/html");
    PrintWriter out =response.getWriter();
    out.println("<center><script>alert('your data inserted successfully')</script></center>");
    request.getRequestDispatcher("login.jsp").include(request, response);
	
	
	}

}
