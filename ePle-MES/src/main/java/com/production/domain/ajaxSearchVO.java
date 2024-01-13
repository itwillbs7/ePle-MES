package com.production.domain;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.itwillbs.domain.PageVO;

import lombok.Data;

@Data
public class ajaxSearchVO {
	private String[] product;
	private String[] line_code;
	private String[] request;
	private String[] dateRange;
	private proPageVO pageVO;
	
	public void setDateRange(String dateRange) {
		String[] dateArr = null;
		if (dateRange != "" && dateRange != null) {
			dateArr = dateRange.split(" - ");
		}else {
			LocalDate today = LocalDate.now();
	        
	        // 이번 주의 첫날과 마지막 날 구하기
	        LocalDate firstDayOfWeek = today.with(DayOfWeek.MONDAY);
	        LocalDate lastDayOfWeek = today.with(DayOfWeek.SUNDAY);

	        // 출력 포맷 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // 결과 출력
	        String firstDayStr = firstDayOfWeek.format(formatter);
	        String lastDayStr = lastDayOfWeek.format(formatter);
	        dateArr = new String[]{firstDayStr,lastDayStr};
		}
		this.dateRange = dateArr;
	}
	public String[] getDateRange() {
		return this.dateRange;
	}
	
}
