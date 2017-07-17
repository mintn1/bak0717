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

 

<div class="progress progress-striped active">
	<div class="progress-bar progress-bar-success" role="progressbar"
		 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
		 style="width: 40%;">
		<span class="sr-only">读取 xlsx </span>
	</div>
</div>




<%@page import="java.io.FileInputStream " %>
<%@page import="java.io.FileOutputStream" %> 
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
  
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
  
<%@page import="java.io.IOException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.TimeZone" %>
  
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>

<%@page import="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook " %> 
<%@page import="org.apache.poi.ss.usermodel.DateUtil"  %>

<%
DecimalFormat df = new DecimalFormat("0.########"); 

String strPath = "D:\\private\\testpoi\\sheet211.xlsx";
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SS");
TimeZone t = sdf.getTimeZone();
t.setRawOffset(0);
sdf.setTimeZone(t);
Long startTime = System.currentTimeMillis();  
// 检测代码
try
{
 //ReadExcel er = new ReadExcel();
 // 读取excel2007
 //er.testPoiExcel2007(strPath);
	   try
	  {
	   // 构造 XSSFWorkbook 对象，strPath 传入文件路径
	   XSSFWorkbook workbook = new XSSFWorkbook(strPath);
	   // 读取第一章表格内容
/*	   XSSFSheet sheet = xwb.getSheetAt(0);
	   // 定义 row、cell
	   XSSFRow row;
	   String cell;
	   // 循环输出表格中的内容
	  
 	  for (int i = sheet.getFirstRowNum(); i < sheet.getPhysicalNumberOfRows(); i++)
	   {
	    row = sheet.getRow(i);
	    for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++)
	    {
	     // 通过 row.getCell(j).toString() 获取单元格内容，
	     cell = row.getCell(j).toString();
	     if(j == 2 | j==3)
	      out.print(cell + "\t");
	    }
	    	out.println("");
	   } */
	   
	   for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) { 
	         
	       if (null != workbook.getSheetAt(numSheets)) { 
	      
	         XSSFSheet aSheet = workbook.getSheetAt(numSheets);//获得一个sheet 
	          
	         for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) { 
	               
	             out.println("行"+(rowNumOfSheet+1));//其它格式的数据
	              if (null != aSheet.getRow(rowNumOfSheet)) { 
	                    
	                   XSSFRow aRow = aSheet.getRow(rowNumOfSheet); 
	                   ArrayList recode=new ArrayList();
	                     
	                     
	                   for (short cellNumOfRow = 0; cellNumOfRow <= aRow.getLastCellNum(); cellNumOfRow++) { 
	                         
	                        if (null != aRow.getCell(cellNumOfRow)) { 
	                              
	                            XSSFCell aCell = aRow.getCell(cellNumOfRow); 
	                              
	                            int cellType = aCell.getCellType(); 
	                          				
	                            //CELL_TYPE_NUMERIC 数值型 0
	                            //CELL_TYPE_STRING 字符串型 1
	                            //CELL_TYPE_FORMULA 公式型 2
	                            //CELL_TYPE_BLANK 空值 3
	                            //CELL_TYPE_BOOLEAN 布尔型 4
	                            //CELL_TYPE_ERROR 错误 5
	                            
	                            
	                            
	                                 switch (cellType) { 
	                                         case 0://Numeric 
	                                        	 String strCell="";
	                                        	    if (DateUtil.isCellDateFormatted(aCell)) {
	                                               	 double d = aCell.getNumericCellValue();
	                                               		Date date = DateUtil.getJavaDate(d);
	                                                    out.println(date.toLocaleString());
	                                                    recode.add(date.toLocaleString());
	                                        	    }
	                                        	    else    {
	                                        	    
	                                                   strCell = df.format(aCell .getNumericCellValue()); 
	                                                   out.println(strCell);
	                                                   recode.add(strCell);
	                                        	    }
	                                                   break; 
	                                         case 1://String 
	                                                  strCell = aCell.getStringCellValue(); 
	                                                  out.println(strCell); 
	                                                  recode.add(strCell);
	                                                  break; 
	                                         case 2: 
	                                        	 out.print("格式公式型");//其它格式的数据
	                                        	 String strCell2 = df.format(aCell .getNumericCellValue()); 
	                                             out.println(strCell2); 
	                                             recode.add(strCell2);
	                                        	 break;
	                                        	 
	                                         case 3:
	                                        	 out.println("格式空值");//其它格式的数据
	                                        	 break;
	                                        	 
	                                         case 4:
	                                        	 out.println("格式布尔型");//其它格式的数据
	                                        	 break;
	                                        	 
	                                         case 5:
	                                        	 out.println("格式错误");//其它格式的数据
	                                        	 break;
	                                        	 
	                                         default: 
	                                                  out.println("格式不对不读");//其它格式的数据 
	                                                   
	                                 } 
	                               
	                                  
	                        } 
	                  } //end  of  遍历所有数据项结束
	                     
	                  out.println("<br>");    
	                    
	              } //end  of  if (null != aSheet.getRow(rowNumOfSheet))
	              out.println("<hr>");
	                

	                
	         } //end  of  for 遍历所有行结束
	       } 
	   }  //end  of  for  遍历所有sheet结束
	  }
	  catch (IOException e)
	  {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
 
 
 
}
catch (Exception ex)
{
 ex.printStackTrace();
}
Long endTime = System.currentTimeMillis();
System.out.println("用时：" + sdf.format(new Date(endTime - startTime)));


%>




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
       session.setMaxInactiveInterval(5400);   //1.5hours
   }  
   else  
   {  
	   String s2="<script>alert('登陆失败！');window.location.href='"+path+"/default.jsp'</script>";

       out.println(s2);  
   }  
%>  


</body>
</html>