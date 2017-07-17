<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奶老师的教学站 - 题库管理 </title>


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

<jsp:include page="/pages/login/islogin.jsp" />

<% 
    if(session.getAttribute("isadmin") == "false")  
    {  
    	 String s1="<script>alert('请奶老师先登陆');window.location.href='"+path+"/pages/login/login.jsp'</script>";
         out.println(s1);  
         
		return ;
    }  else {

    }

  %>  
  
  
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">选择XLSX </h3>
	</div>
	<div class="panel-body">
			 <form name="form1" action="upload" method="post" enctype="multipart/form-data">
			 <input type="file" name="file" />
			 	<div class="panel-body">
  					<h6>  </h6>
				</div>
			 <input type="submit" name="button" value="开始上传" />
			 </form>      
	</div>
</div>

  

</body>
</html>