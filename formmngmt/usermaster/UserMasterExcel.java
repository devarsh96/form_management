package com.efive.formmngmt.usermaster;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class UserMasterExcel {
	
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private String[] arrayofheader;
	private List<Map<String, Object>> excelfinaldata;

	public UserMasterExcel(String[] arrayofheader, List<Map<String, Object>> excelfinaldata) {

		workbook = new XSSFWorkbook();
		this.arrayofheader = arrayofheader;
		this.excelfinaldata = excelfinaldata;

	}

	private void writeHeaderLine() {
		sheet = workbook.createSheet("answers");

		Row row = sheet.createRow(0);

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(13);
		style.setFont(font);
		
		for (int i = 0; i < arrayofheader.length; i++) {
			
			createCell(row, i, arrayofheader[i], style);
		}

	}

	private void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.autoSizeColumn(columnCount);
		Cell cell = row.createCell(columnCount);
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		}
		 else if (value instanceof BigInteger) {
			 	String str = value.toString();
				cell.setCellValue((String) str);
			}
		else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}

	private void writeDataLines() {
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);

		int rowcount = 1;

		for (Map<String, Object> hashmap_data : excelfinaldata) {

			Row rows = sheet.createRow(rowcount);

			int columnCount = 0;
			for (String headercontent : arrayofheader) {
				
				createCell(rows, columnCount++, hashmap_data.get(headercontent), style);
			}
			rowcount++;
		}
	}

	public void export(HttpServletResponse response) throws IOException {

		try {
			writeHeaderLine();
			writeDataLines();
			ServletOutputStream outputStream = response.getOutputStream();
			workbook.write(outputStream);
			workbook.close();

			outputStream.close();
			System.err.println("doing good");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
