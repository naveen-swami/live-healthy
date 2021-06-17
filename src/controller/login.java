package controller;

import Util.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.hibernate.*;
import bean.User;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("name");
		String pass  = request.getParameter("pass");
		String email1 = null, pass1 = null,status1=null;

		Session se = null;
		Transaction tran = null;
        
		
		
		SessionFactory sf =null;
		sf=new Configuration().configure().addAnnotatedClass(User.class).buildSessionFactory();
		se = sf.openSession();
		tran = se.beginTransaction();
		Query qr = se.createQuery("from User");
		List<User> li = qr.list();

		tran.commit();
		 for (User st : li) {
			email1 = st.getEmail();
			pass1 = st.getPass();
			status1=st.getStatus();
			if (email.equals(email1) && pass.equals(pass1) && status1.equals("Active")) {
				request.getRequestDispatcher("main.jsp").forward(request, response);
		 
		 }

			if (email.equals(email1) && pass.equals(pass1) && status1.equals("Block")) {
				out.println("<script>alert('You are Blocked Please contect Admin')</script>");
				request.getRequestDispatcher("login.jsp").include(request, response);
		 
		 }

			
		 }

		   
		 if (!email.equals(email1) || !pass.equals(pass1)) {
			out.println("<script>alert('invalid email or password')</script>");
			request.getRequestDispatcher("login.jsp").include(request, response);
		 }
		 }
		 

}
