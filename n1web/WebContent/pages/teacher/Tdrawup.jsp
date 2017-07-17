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


<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">上传 XLSX</h3>
	</div>
	<div class="panel-body">
			 <form name="form1" action="upload" method="post" enctype="multipart/form-data">
			 <input type="file" name="file" />
			 <input type="submit" name="button" value="Submit" />
			 </form>      
	</div>
</div>

  

</body>
</html>