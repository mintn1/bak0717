<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
    String path = request.getContextPath(); 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 

    if(session.getAttribute("user") == null)  
    {  
    	 String s1="<script>alert('请先登陆');window.location.href='"+path+"/pages/login/login.jsp'</script>";

        out.println(s1);  
		return ;
    }  else {
    	 if(session.getAttribute("user") != "nai")  
    	    {  
    		 	String obj1 = "true";
    	    	session.setAttribute("isadmin",obj1);

    	    }  else {
    		 	String obj1 = "false";
    	    	session.setAttribute("isadmin", obj1);    	
    	    }
    }

  %>  
