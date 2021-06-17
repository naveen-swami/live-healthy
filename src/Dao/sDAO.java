package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Util.sUtil;
import bean.User;
public class sDAO 
{
   Session se=null;
   Transaction tran=null;
   
   sUtil su=new sUtil();
   SessionFactory sf=su.getsf();
   
   public void getsession(User sb)
   {
	   se=sf.openSession();
	   tran=se.beginTransaction();
	   se.saveOrUpdate(sb);
	   tran.commit();
   }
   
   	
	
}
