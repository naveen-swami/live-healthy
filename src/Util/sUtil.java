package Util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import bean.User;

public class sUtil {

	private static SessionFactory sf=null;
    
	static
    {
		sf=new Configuration().configure().addAnnotatedClass(User.class).buildSessionFactory();
    }
	
	public static SessionFactory getsf() 
	{
		return sf;
	}
	
	
}
