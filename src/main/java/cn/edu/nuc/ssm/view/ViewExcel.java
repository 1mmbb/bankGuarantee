package cn.edu.nuc.ssm.view;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import cn.edu.nuc.ssm.entity.MbDemand;




public class ViewExcel extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		

		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("list");    
        sheet.setDefaultColumnWidth((short) 12);  
        HSSFRow hssfRow = sheet.createRow(0);
        HSSFCell hssfCell1 = hssfRow.createCell(0);
        hssfCell1.setCellValue("需求处理部门");
        HSSFCell hssfCell2 = hssfRow.createCell(1);
        hssfCell2.setCellValue("需求申报点");
        HSSFCell hssfCell3 = hssfRow.createCell(2);
        hssfCell3.setCellValue("需求申报人姓名");
        HSSFCell hssfCell4 = hssfRow.createCell(3);
        hssfCell4.setCellValue("需求申报人电话");
        HSSFCell hssfCell5 = hssfRow.createCell(4);
        hssfCell5.setCellValue("超时时间");
        HSSFCell hssfCell6 = hssfRow.createCell(5);
        hssfCell6.setCellValue("催办次数");
        HSSFCell hssfCell7 = hssfRow.createCell(6);
        hssfCell7.setCellValue("上报时间");
        HSSFCell hssfCell8 = hssfRow.createCell(7);
        hssfCell8.setCellValue("需求事项描述");
        
        HSSFCellStyle dateStyle = wb.createCellStyle();    
        dateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));    
           
        List<MbDemand> mbDemands = (List<MbDemand>)model.get("delist");
        
        for (int i = 0; i < mbDemands.size(); i++) {
        	HSSFRow sheetRow = sheet.createRow(i+1); 
        	MbDemand de = mbDemands.get(i);
			sheetRow.createCell(0).setCellValue( de.getHandleDepart() );
        	sheetRow.createCell(1).setCellValue( de.getDedeclare() );
        	sheetRow.createCell(2).setCellValue( de.getDeclareName() );
        	sheetRow.createCell(3).setCellValue( de.getDeclareTel() );
        	sheetRow.createCell(4).setCellValue( de.getOverTime() );
        	sheetRow.createCell(5).setCellValue( de.getReminders() );
        	sheetRow.createCell(6).setCellValue( de.getReportTime() );
        	sheetRow.createCell(7).setCellValue( de.getDedescription() );
		}
        String filename = new String(model.get("fileName").toString().getBytes("utf-8"),"iso-8859-1");//设置下载时客户端Excel的名称     
        response.setContentType("application/vnd.ms-excel");     
        response.setHeader("Content-disposition", "attachment;filename=" + filename);     
        OutputStream ouputStream = response.getOutputStream();     
        wb.write(ouputStream);     
        ouputStream.flush();     
        ouputStream.close();     
		
	}

	

	

}
