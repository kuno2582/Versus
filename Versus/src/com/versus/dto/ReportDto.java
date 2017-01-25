package com.versus.dto;

public class ReportDto {
	String report_id;
	int reportee_team_code;
	String content;
	
	public ReportDto(){
		
	}
	
	public ReportDto(String report_id, int reportee_team_code, String content){
		this.report_id = report_id;
		this.reportee_team_code = reportee_team_code;
		this.content = content;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public int getReportee_team_code() {
		return reportee_team_code;
	}

	public void setReportee_team_code(int reportee_team_code) {
		this.reportee_team_code = reportee_team_code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
