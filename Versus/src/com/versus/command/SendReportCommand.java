package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class SendReportCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String report_id = request.getParameter("report_id");
		String reportee_teamName = request.getParameter("reportee_teamName");
		String content = request.getParameter("content");
		
		Dao dao = new Dao();
		dao.sendReport(report_id,reportee_teamName,content);
		
	}

}
