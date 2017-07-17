<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奶老师的教学站 - 题库查询 </title>


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
        <h3 class="panel-title">题库查询</h3>
    </div>
    <div class="panel-body">


		<div class="row">
		    <div class="col-md-6 col-md-3">	
				<table class="table table-bordered"  >
					<caption></caption>
					<thead>
						<tr>			
							<th>题库名称</th>
							<th>题型</th>
							<th>上传日期</th>
							<th>标签</th>								
							<th>题目数量</th>
	
							<th>查看</th>													
						</tr>
					</thead>
					<tbody>
		
		
		
		
						
		<%@page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.sql.SQLException "%> 
		 <%
		   Connection conn = null;  
		   DataSource ds = null;  
		   ResultSet rs  =null;  
		   Statement stmt = null;	
		   String jsp1 = "";
		   
		    Context initCtx = new InitialContext(); 
		  	ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/TestDB"); 
		  	if(ds!=null){  
		  		 conn = ds.getConnection(); 
		  	 
		  		 try{  		   
		  		 stmt = conn.createStatement(); 
		  		 
		  		 String sql = "select titlename,sheetname,uploaddate,tags,count(*) as cnt from Tquestions " +
		  		 			" group by titlename,sheetname,uploaddate,tags " +
		  		 			" order by titlename,sheetname,uploaddate,tags" ; 
		  		 rs = stmt.executeQuery(sql); 
		  		   
		  		 while(rs.next()) { 
		  		  out.print("<tr class='success' >");
		  			
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("titlename") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("sheetname") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("uploaddate") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("tags") + "</td>"); 
		  			  out.print("<td>"); 
		  			  out.print(rs.getString("cnt") + "</td>"); 
		  			  out.print("<td>"); 		  			  
		  			  
		  			  jsp1 = "<a href='pages/teacher/Tquery2_1.jsp?titlename=" + rs.getString("titlename") + 
		  			  		"&sheetname=" + rs.getString("sheetname") +
		  			  		"&uploaddate=" + rs.getString("uploaddate") +"'>明细题目</a> ";
 						
	  			  
		  			  out.print(jsp1 + "</td>"); 


		  		  	out.print("</tr>"); 
		  		 } 
		  	      rs.close();  
				  conn.close();
				  
		  	   }catch(Exception ex){  
		  	     ex.printStackTrace();  
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