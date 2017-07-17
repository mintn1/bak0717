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

<jsp:include page="/pages/login/islogin.jsp" />


<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">登录成功</h3>
    </div>
    <div class="panel-body">
    
		  <form action="#" method="post">  
		  <!-- 
		    <button type="submit" formaction="<%=path %>/pages/login/logout.jsp">注销</button>  
		  -->
		  </form>  
		  
    </div>
</div>

<jsp:forward page="/default.jsp"/>

</body>
</html>