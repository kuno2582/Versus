package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class MatchResult implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int match_num = Integer.parseInt(request.getParameter("match_num"));
		String match_result = request.getParameter("match_result");
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		
		Dao dao = new Dao();
		dao.matchResult(match_num,match_result,teamCode);
		
		
		
	}

}
