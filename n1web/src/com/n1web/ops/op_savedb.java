package com.n1web.ops;

import java.io.FileInputStream;  
import java.io.IOException;  
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;  
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFCell;  
 import org.apache.poi.hssf.usermodel.HSSFRow;  
 import org.apache.poi.hssf.usermodel.HSSFSheet;  
 import org.apache.poi.hssf.usermodel.HSSFWorkbook;  
 
	import java.io.File; 
	import java.io.FileInputStream; 
	import java.io.FileNotFoundException; 
	import java.io.IOException; 
	import java.io.InputStream; 
	import org.apache.poi.openxml4j.exceptions.InvalidFormatException; 
	import org.apache.poi.ss.usermodel.Cell; 
	import org.apache.poi.ss.usermodel.DateUtil; 
	import org.apache.poi.ss.usermodel.Row; 
	import org.apache.poi.ss.usermodel.Sheet; 
	import org.apache.poi.ss.usermodel.Workbook; 
	import org.apache.poi.ss.usermodel.WorkbookFactory; 
	import org.apache.poi.ss.util.CellRangeAddress;

	import java.text.Format;
	import java.text.SimpleDateFormat;
	import java.util.Date;
	
	/** 

	* 需要如下jar包. 
	* poi-3.7-20101029.jar, poi-ooxml-3.7-20101029.jar, 
	* xmlbeans-2.3.0.jar, poi-ooxml-schemas-3.7-20101029.jar, dom4j-1.6.1.jar 
	* 
	* 需要将xbean-2.2.0.jar更新到xbean-2.3.0.jar，否则读取2007时会出现jar包冲突异常 
	*/ 
	
public class op_savedb {
	
public		String titlename = "";
public		String sheetname = "";
public		String questionid = "";
public		String questiondesc = "";
public		String answer = "";
public		String uploaddate = "";
public 		String tags = "";

public 		String sqlvalue = "";

	    /** 
	     * 读取excel，支持excel 97~03 / excel 07 
	     * @param fileName : 文件名 
	     */ 
	    public void read(String fileName) { 
	    	
	    System.out.println("Op_readxlx.read(): "+fileName);
	    titlename = getFileName(fileName);
	    
	       Workbook wb = null; 
	       File f = new File(fileName); 
	       FileInputStream is; 
	       try { 
	           is = new FileInputStream(f); 
	           wb = WorkbookFactory.create(is); 
	           readWB(wb); 
	           is.close(); 
	       } catch (FileNotFoundException e) { 
	           e.printStackTrace(); 
	       } catch (IOException e) { 
	       e.printStackTrace(); 
	       } catch (InvalidFormatException e) { 
	       e.printStackTrace(); 
	       }      
	    } 
	    
	    /**   
	     * 读取Workbook   
	     * @param wb   
	     * @throws Exception   
	     */   
	    private void readWB(Workbook wb){    
	        try {    
	        // 读取sheet0 
	            for (int k = 0; k < wb.getNumberOfSheets()-1; k++) {       
	                //sheet    
	                Sheet sheet = wb.getSheetAt(k);   
	             //Sheet sheet = wb.getSheetAt(0); 
		         
	                sheetname=sheet.getSheetName();
	               // sheetname = new String(sheetname.getBytes("GB2312"),"utf-8");
	                
	             System.out.println(sheetname);   

	             
	             //int totalRow = sheet.getPhysicalNumberOfRows(); 
	             //System.out.println("---------------totalRow=" + totalRow); 
	             
	             readDatas(sheet); // 按行读取 
	             //-- test 
	             /*
	             System.out.println("---------------PhysicalNumberOfRows:"+sheet.getPhysicalNumberOfRows()); 
	             System.out.println("---------------FirstRowNum:"+sheet.getFirstRowNum()); 
	             System.out.println("---------------LastRowNum:"+sheet.getLastRowNum()); 
            	*/
	            }    
	        } catch (Exception e) {       
	        e.printStackTrace(); 
	        }    
	    } 

	    /** 
	     * 读取excel数据 
	     * @param sheet 
	     */ 
	    @SuppressWarnings("deprecation")
		private void readDatas(Sheet sheet) { 
	    	
	    	Cell cell0 = sheet.getRow(0).getCell(0,Row.CREATE_NULL_AS_BLANK);
	    	String val0 = cell0.getRichStringCellValue().getString();
	    	//System.out.println(val0);
	    	
	    	if (val0.length()>10) {
	    		//标记需要导入
    	    	Format format = new SimpleDateFormat("yyyy-MM-dd");
    	  
	    		sqlvalue = "";
	    		
	    		 // 定义 row、cell
	    		   Row row;

	    		   // 循环输出表格中的内容
	    		   for (int i = sheet.getFirstRowNum()+2; i < sheet.getPhysicalNumberOfRows(); i++)
	    		   {
	    			   System.out.println(i);
	    			   
	    		    row = sheet.getRow(i);
	    		    
	    	    	questionid = (i-1)+"";
	    	    	questiondesc = row.getCell(1).getRichStringCellValue().getString();
	    	    	answer = row.getCell(2).getRichStringCellValue().getString();

	    			sqlvalue= "('" + titlename+"','"+sheetname+"','"+questionid+"','"+questiondesc+"','" 
	    					+answer +"','"+format.format(new Date())+"','')";

	    			//System.out.println(sqlvalue); 
	    			
	    			insertdb(sqlvalue);

	    			
	    		    
	    		   }
	    	    	
	    	    	

	    			

	    	    
/*	    		
	    	    for (Row row : sheet) { 
	    			for (Cell cell : row) { 
	    			//		 System.out.println("列索引："+cell.getColumnIndex()); 
	    			
	    				switch (cell.getCellType()) { 
	    					case Cell.CELL_TYPE_STRING: 
	    					System.out.print(cell.getRichStringCellValue().getString()); 
	    					
	    					break; 
	    					case Cell.CELL_TYPE_NUMERIC: 
	    					if (DateUtil.isCellDateFormatted(cell)) { 
	    					System.out.print(cell.getDateCellValue()); 
	    					} else { 
	    					System.out.print(cell.getNumericCellValue()); 
	    					} 
	    					break; 
	    					case Cell.CELL_TYPE_BOOLEAN: 
	    					System.out.print(cell.getBooleanCellValue()); 
	    					break; 
	    					case Cell.CELL_TYPE_FORMULA: 
	    					System.out.print(cell.getCellFormula()); //取得公式 
	    					System.out.println("公式值："+cell.getNumericCellValue()); //取得公式值 
	    					break; 
	    					default: 
	    					System.out.println(""); 
	    					} 
	    			} 
	    			System.out.println("\n"); 
	    			} 
	    	    	    */	    
	    	    
	    	}
	    	else {
	    		//无需导入
	    		return ;
	    	}

	    }    
	
		 
		        

	    

public boolean insertdb(String sqlvalue)  
{  
 	boolean r1 = false;
 	
   Connection conn = null;  
   DataSource ds = null;  
   ResultSet rs  =null;  
   Statement stmt = null;	
   
	 try{ 
		Context initCtx = new InitialContext(); 
		ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/TestDB"); 
  	 
  		 conn = ds.getConnection(); 
  	 
	   
  		 stmt = conn.createStatement(); 
  		 
  		 String sql = "insert into Tquestions values "+sqlvalue ;

  		 System.out.println(sql);
  		 

         int  result1 = stmt.executeUpdate(sql);
  
         //处理结果
         if(result1>0){
             System.out.println("操作成功");
         }else{
             System.out.println("操作失败");
         }


		  conn.close();

   
	   }catch(Exception ex){  
  	     ex.printStackTrace();  
	   }
	
	 return true;
	   
}  


		//操作字符串取得绝对路径中的文件名及文件夹名
		public String getFileName(String pathandname) { 
			/**
			 * 仅保留文件名不保留后缀
			 */
			int start = pathandname.lastIndexOf("/");
			int end = pathandname.lastIndexOf(".");
			if (start != -1 && end != -1) {
				return pathandname.substring(start + 1, end);
			} else {  
				return "null";	
			}
		}

		/**
		 * 保留文件名及后缀
		 */
		public String getFileNameWithSuffix(String pathandname) {
			int start = pathandname.lastIndexOf("/");
			if (start != -1) {
				return pathandname.substring(start + 1);
			} else {
				return null;
			}
		}
		
		
	}






