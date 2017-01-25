package com.versus.command;

import java.util.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class MakeMatchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		String match_place = "";
		match_place += request.getParameter("region1");
		match_place += request.getParameter("region2");
		match_place += request.getParameter("match_place");
		
		Timestamp match_date = null;
		try {
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String hour = request.getParameter("hour");
			String date1 = "2017-" + month + "-" + day + " " + hour + ":00:00.0";
			DateFormat formatter;
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = (Date)formatter.parse(date1);
			match_date = new Timestamp(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String nickName;
		if(request.getParameter("nickName") == null){
			nickName = request.getParameter("id");
		}else{
			nickName = request.getParameter("nickName");
		}
		String match_phone = request.getParameter("match_place");
		String match_uniform = request.getParameter("match_place");
		
		int shower,parking,neon,whistle;
		
		if(request.getParameter("shower") == null){
			shower = 0;
		}else{
			shower = 1;
		}
		
		if(request.getParameter("parking") == null){
			parking = 0;
		}else{
			parking = 1;
		}
		
		if(request.getParameter("neon") == null){
			neon = 0;
		}else{
			neon = 1;
		}
		
		if(request.getParameter("whistle") == null){
			whistle = 0;
		}else{
			whistle = 1;
		}

		
		String match_more = request.getParameter("match_more");
		
		Dao dao = new Dao();
		
		dao.makeMatch(teamCode, match_place, match_date, nickName, match_phone, match_uniform, shower, parking, neon, whistle, match_more);
	}

}
