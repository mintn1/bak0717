package com.n1web.ops;

import java.io.FileInputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.util.ArrayList;  
import java.util.List;  
   
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
	
	/** 

	* 需要如下jar包. 
	* poi-3.7-20101029.jar, poi-ooxml-3.7-20101029.jar, 
	* xmlbeans-2.3.0.jar, poi-ooxml-schemas-3.7-20101029.jar, dom4j-1.6.1.jar 
	* 
	* 需要将xbean-2.2.0.jar更新到xbean-2.3.0.jar，否则读取2007时会出现jar包冲突异常 
	*/ 
	
public class op_readxlsx {


	    /** 
	     * 读取excel，支持excel 97~03 / excel 07 
	     * @param fileName : 文件名 
	     */ 
	    public void read(String fileName) { 
	    	
	    System.out.println("Op_readxlx.read(): "+fileName);
	    
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
	            //for (int k = 0; k < wb.getNumberOfSheets(); k++) {       
	                //sheet    
	                //Sheet sheet = wb.getSheetAt(k);   
	             Sheet sheet = wb.getSheetAt(0); 
	             int totalRow = sheet.getPhysicalNumberOfRows(); 
	             System.out.println("totalRow=" + totalRow); 
	             
	             readDatas(sheet); // 按行读取 
	             //-- test 
	             /* 
	             System.out.println("PhysicalNumberOfRows:"+sheet.getPhysicalNumberOfRows()); 
	             System.out.println("FirstRowNum:"+sheet.getFirstRowNum()); 
	             System.out.println("LastRowNum:"+sheet.getLastRowNum()); 
	             */            
	            //}    
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
	    }    
	   
	/** 
	* 获取合并单元格的值 
	* @param sheet 
	* @param row 
	* @param column 
	* @return 
	*/ 
	public String getMergedRegionValue(Sheet sheet, int row, int column) { 
	int sheetMergeCount = sheet.getNumMergedRegions(); 

	for (int i = 0; i < sheetMergeCount; i++) { 
		CellRangeAddress ca = sheet.getMergedRegion(i); 
		int firstColumn = ca.getFirstColumn(); 
		int lastColumn = ca.getLastColumn(); 
		int firstRow = ca.getFirstRow(); 
		int lastRow = ca.getLastRow(); 
	
		if (row >= firstRow && row <= lastRow) { 
			if (column >= firstColumn && column <= lastColumn) { 
				Row fRow = sheet.getRow(firstRow); 
				Cell fCell = fRow.getCell(firstColumn); 
			
				//return getCellValue(fCell);
				return fCell.getStringCellValue();
			} 
		} 
	} 

	return null; 
	} 
	    

		 
		        
	} 
	

