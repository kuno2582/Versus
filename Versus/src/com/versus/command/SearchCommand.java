package com.versus.command;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.CommentDto;
import com.versus.dto.MatchDto;

public class SearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String region1="";
		String region2="";
		if(request.getAttribute("region1")!=null){
			region1 = request.getParameter("region1");
			region2 = request.getParameter("region2");
		}
		String search_month_start = "1";
		String search_month_end = "12";
		if((request.getParameter("search_month") != "") && (request.getParameter("search_month")!=null)){
			search_month_start = request.getParameter("search_month");
			search_month_end = request.getParameter("search_month");
		}
		String search_day_start = "1";
		String search_day_end = "31";
		if((request.getParameter("search_day")!="") && (request.getParameter("search_day")!=null)){
			search_day_start = request.getParameter("search_day");
			search_day_end = request.getParameter("search_day");
		}
		
		String time1="0";
		String time2="23";
		if(request.getParameter("time1")!=null){
			time1 = request.getParameter("time1");if(time1 == "")time1="0";
		}
		if(request.getParameter("time2")!=null){
			time2 = request.getParameter("time2");if(time2 == "")time2="23";
		}
		Timestamp match_date1 = null;
		Timestamp match_date2 = null;
		try {
			String str_date1 = "2017-" + search_month_start + "-" + search_day_start + " " + time1 + ":00:00.0";
			String str_date2 = "2017-" + search_month_end + "-" + search_day_end + " " + time2 + ":00:00.0";
			DateFormat formatter;
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date1 = (Date)formatter.parse(str_date1);
			Date date2 = (Date)formatter.parse(str_date2);
			match_date1 = new Timestamp(date1.getTime());
			match_date2 = new Timestamp(date2.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Dao dao = new Dao();
		
		ArrayList<MatchDto> dtos = dao.searchMatch(region1, region2, match_date1, match_date2);
		ArrayList<CommentDto> comment_dtos = dao.matchComment();
		
		request.setAttribute("list", dtos);
		request.setAttribute("matchComment", comment_dtos);
	}

}
