<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奶老师的教学站 - 学生信息 </title>


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
        <h3 class="panel-title">学生信息</h3>
    </div>
    <div class="panel-body">


		<div class="row">
		    <div class="col-md-6 col-md-3">	
				<table class="table table-bordered"  >
					<caption></caption>
					<thead>
						<tr>			
							<th>学生名称</th>
							<th>班级</th>
							<th>联系方式</th>
						</tr>
					</thead>
					<tbody>
		
		
		
		
						
		<%@page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.sql.SQLException "%> 
		 <%
		   Connection conn = null;  
		   DataSource ds = null;  
		   ResultSet rs  =null;  
		   Statement stmt = null;	
		   
		    Context initCtx = new InitialContext(); 
		  	ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/TestDB"); 
		  	if(ds!=null){  
		  		 conn = ds.getConnection(); 
		  	 
		  		 try{  		   
		  		 stmt = conn.createStatement(); 
		  		 
		  		 String sql = "select username,gradeclass,contacts from Tuser where tag<>'admin'"; 
		  		 rs = stmt.executeQuery(sql); 
		  		   
		  		 while(rs.next()) { 
		  		  out.print("<tr class='success' >");
		  			
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("username") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("gradeclass") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("contacts") + "</td>"); 
		  		  
		  		  out.print("</tr>"); 
		  		 } 
		  		
		  	   }catch(Exception ex){  
		  	     ex.printStackTrace();  
		  	   }finally{ 
		  	      rs.close();  
				  conn.close();
		
		  		}
		  	}
		  	
		  %> 
		
					</tbody>
				</table>
		
		
		    </div>
		
		</div>
		        
    </div>
</div>


</body>
</html>