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


<!--  
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">面板标题</h3>
    </div>
    <div class="panel-body">
        这是一个基本的面板
    </div>
</div>

-->


<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">面板标题</h3>
        
        
        <!-- 导航bar -->  
		<nav class="navbar navbar-default" role="navigation">
		  <div class="container-fluid">
		    <div class="navbar-header">
		 
			<ul class="nav nav-pills nav-justified">
				<li class="navbar-brand active"><a href="#">1088</a></li>
				<li><a href="<%=path %>/pages/student/Sbasic.jsp" >学生信息</a></li>
				<li><a href="#">成绩查询</a></li>	
				<li><a href="<%=path %>/pages/teacher/Tupload.jsp">题库上传</a></li>
				<li><a href="<%=path %>/pages/teacher/Tquery2.jsp">题库查询</a></li>				
				
				<li><a href="<%=path %>/pages/other/about.jsp">About </a></li>
		
		      <!-- 
		      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
		       -->
		      <li><a href="<%=path %>/pages/login/login.jsp"><span class="glyphicon glyphicon-user"></span> 登录</a></li>
		    </ul>
		    
		    </div>
		    </div>
		</nav>
		
		
    </div>
    <div class="panel-body">
        <!-- 缩略图 -->

		<div class="row">
		    <div class="col-sm-6 col-md-3">
		        <a href="#" class="thumbnail">
		            <img src="<%=path %>/img/sunflower.jpg" class="img-rounded"
		                 alt="通用的占位符缩略图">
		        </a>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <a href="#" class="thumbnail">
		            <img src="<%=path %>/img/river.jpg" class="img-thumbnail"
		                 alt="通用的占位符缩略图">
		        </a>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <a href="#" class="thumbnail">
		            <img src="<%=path %>/img/mountain.jpg" class="img-circle"
		                 alt="通用的占位符缩略图">
		        </a>
		    </div>
		
		</div>


    </div>
</div>








<!-- 内容排版 -->


<ul class="media-list">
	<li class="media">
		<a class="media-left" href="#">
			<img class="media-object" src="<%=path %>/img/sunflower.jpg"
				 alt="通用的占位符图像">
		</a>
		<div class="media-body">
			<h4 class="media-heading">媒体标题</h4>
			<p>这是一些示例文本。这是一些示例文本。
				这是一些示例文本。这是一些示例文本。
				这是一些示例文本。这是一些示例文本。
				这是一些示例文本。这是一些示例文本。
				这是一些示例文本。这是一些示例文本。</p>
			<!-- 嵌套的媒体对象 -->
			<div class="media">
				<a class="media-left" href="#">
					<img class="media-object" src="<%=path %>/img/river.jpg"
						 alt="通用的占位符图像">
				</a>
				<div class="media-body">
					<h4 class="media-heading">嵌套的媒体标题</h4>
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					<!-- 嵌套的媒体对象 -->
					<div class="media">
						<a class="media-left" href="#">
							<img class="media-object" src="<%=path %>/img/mountain.jpg"
								 alt="通用的占位符图像">
						</a>
						<div class="media-body">
							<h4 class="media-heading">嵌套的媒体标题</h4>
							这是一些示例文本。这是一些示例文本。
							这是一些示例文本。这是一些示例文本。
							这是一些示例文本。这是一些示例文本。
							这是一些示例文本。这是一些示例文本。
							这是一些示例文本。这是一些示例文本。
						</div>
					</div>
				</div>
			</div>
			<!-- 嵌套的媒体对象 -->
			<div class="media">
				<a class="media-left" href="#">
					<img class="media-object" src="<%=path %>/img/river.jpg"
						 alt="通用的占位符图像">
				</a>
				<div class="media-body">
					<h4 class="media-heading">嵌套的媒体标题</h4>
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
					这是一些示例文本。这是一些示例文本。
				</div>
			</div>
		</div>
	</li>
	<li class="media">
		<a class="pull-right" href="#">
			<img class="media-object" src="<%=path %>/img/mountain.jpg"
				 alt="通用的占位符图像">
		</a>
		<div class="media-body">
			<h4 class="media-heading">媒体标题</h4>
			这是一些示例文本。这是一些示例文本。
			这是一些示例文本。这是一些示例文本。
			这是一些示例文本。这是一些示例文本。
			这是一些示例文本。这是一些示例文本。
			这是一些示例文本。这是一些示例文本。
		</div>
	</li>
</ul>

</body>
</html>