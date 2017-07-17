package com.n1web.ops;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;
import java.sql.SQLException;

public class op_login {
	 public boolean Login(String name , String password)  
	    {  
		 	boolean r1 = false;
		 	
		   Connection conn = null;  
		   DataSource ds = null;  
		   ResultSet rs  =null;  
		   Statement stmt = null;	
		   
	  	 try{ 
	  		Context initCtx = new InitialContext(); 
		  	ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/TestDB"); 
		  	 
		  		 conn = ds.getConnection(); 
		  	 
 		   
		  		 stmt = conn.createStatement(); 
		  		 
		  		 String sql = "select username,gradeclass,contacts from Tuser where username='"+name+"' and password='"+password+"'"; 
		  		 System.out.println(sql);
		  		 
		  		 rs = stmt.executeQuery(sql); 
		  		   
		  		 if (rs.next() ) {
		  			r1 = true;
		  		 } else {
		  			r1 = false;
		  		 }
		  	      rs.close();  
				  conn.close();

		   
	  	   }catch(Exception ex){  
		  	     ex.printStackTrace();  
	  	   }
	  	
	  	 return r1;
	  	   
	    }  
}
