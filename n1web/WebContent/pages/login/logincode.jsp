<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奶老师的教学站</title>
<% 
    String path = request.getContextPath(); 
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
   <base href="<%=basePath%>"> 
   
<link rel="stylesheet" href="<%=path %>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="<%=path %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
   
</head>
<body>


<%@ page import="com.n1web.ops.*" %>  
<%   

   op_login in = new op_login();  
   String name = request.getParameter("user");  
   String pass = request.getParameter("password");  
   boolean isLoginSucc = in.Login(name, pass);  
   if(isLoginSucc)  
   {  
	   String s1="<script>alert('登陆成功！');window.location.href='"+path+"/pages/login/loginok.jsp'</script>";

       out.println(s1);  
       session.setAttribute("user", name);  
       session.setMaxInactiveInterval(600);   //10mins.
   }  
   else  
   {  
	   String s2="<script>alert('登陆失败！');window.location.href='"+path+"/default.jsp'</script>";

       out.println(s2);  
   }  
%>  


</body>
</html>