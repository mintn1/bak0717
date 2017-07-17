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

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">登录</h3>
    </div>
    <div class="panel-body">
       

			<div style="padding: 100px 100px 10px;">
			    <form class="bs-example bs-example-form" role="form" action="pages/login/logincode.jsp" method="post">
			        <div class="input-group">
			            <span class="input-group-addon">姓名：</span>
			            <input type="text" class="form-control" name="user" placeholder="请输入用户名" >
			        </div>
			        <br>
			        <div class="input-group">
			            <span class="input-group-addon">密码：</span>
			            <input type="text" class="form-control" name="password" placeholder="请输入密码">
			        </div>
			        <br>
					<input type="submit" value="提交"/>  
			
			
			
			    </form>
			</div>

    </div>
</div>
  



</body>
</html>