package controller;

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
import org.hibernate.cfg.Configuration;

import bean.Image;
import bean.User;

/**
 * Servlet implementation class forget
 */
@WebServlet("/change")
public class change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
			PrintWriter out=response.getWriter();
			out.println("<script>alert('data entered successfully')</script>");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
		
		else
		{
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('password and confirm password not match')</script>");
			request.getRequestDispatcher("forget.jsp").include(request, response);
		}
			}
			else
			{
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<script>alert('your old password not match')</script>");
				request.getRequestDispatcher("change.jsp").include(request, response);
			}
			
	}catch(Exception ex)
		{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('enter valid email')</script>");
		request.getRequestDispatcher("forget.jsp").include(request, response);
		}
	
	}
		

}
