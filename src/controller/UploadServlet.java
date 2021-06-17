package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import bean.Image;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		   PrintWriter out=response.getWriter();
		   response.setContentType("text/html");
		   String address="";
		  
		   Configuration conn=new Configuration().configure().addAnnotatedClass(Image.class);
		   SessionFactory sf=conn.buildSessionFactory();
		   Session sess=sf.openSession();
		   Transaction ts=sess.beginTransaction();
		   
		   HttpSession sess1=request.getSession(false);
		   Image obj=new Image();
		   obj.setDescrption((String)sess1.getAttribute("desc"));
		   obj.setName((String)sess1.getAttribute("name"));
		   obj.setType((String)sess1.getAttribute("type"));
		   obj.setCourse((String)sess1.getAttribute("course"));
		   obj.setPath("C:\\Users\\NAVEEN SWAMI\\eclipse-workspace\\live healthy\\WebContent\\file\\");
		   
		try
		{
		ServletFileUpload sf1=new ServletFileUpload(new DiskFileItemFactory());
	
		List<FileItem> multi=sf1.parseRequest(request);
	    
		for(FileItem item:multi)
		{
			item.write(new File("C:\\Users\\NAVEEN SWAMI\\eclipse-workspace\\live healthy\\WebContent\\file\\"+item.getName()));
			if(!(item.getName().equals("null")))
				address=address+item.getName()+"#";
			
		}
		}catch(Exception ex)
		{
			System.out.println("exception");
			
		}
		   System.out.println(address);
		   obj.setImage(address);
		   sess.save(obj);
		   ts.commit();
		   sess.close();
	    response.sendRedirect("success.jsp");
	    
		 }

}
