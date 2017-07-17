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
		<h3 class="panel-title">上传结果</h3>
	</div>
	<div class="panel-body">

		<div id="myAlert" class="alert alert-success">
		    <a href="#" class="close" data-dismiss="alert">&times;</a>
		    
			        <div class="input-group">
			            <span class="input-group-addon">${message }</span>
			            <input type="text" class="form-control"  disabled="disabled" placeholder=${tempfile } >
			        </div>				    	    
		    
		</div>
		<!--  
			<script>
			$(function(){
			    $("#myAlert").bind('closed.bs.alert', function () {
			        alert("消息框被关闭。");
			    });
			});
			</script>
		--> 
	</div>
</div>





<%@ page import="com.n1web.ops.op_savedb" %>  
<%   

   System.out.println("Ready to readxlsx....");
   op_savedb op_rx1 = new op_savedb();  
   String tf1 =  tf1 =(String) request.getAttribute("tempfile");

   
   System.out.println(tf1);  
   System.out.println(tf1.length());
   
   if(tf1.length()>4)  
   {  
		op_rx1.read(tf1);
   }  
	
   op_rx1=null;
   
%>  



</body>
</html>