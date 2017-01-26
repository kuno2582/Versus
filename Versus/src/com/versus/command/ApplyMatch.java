package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class ApplyMatch implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int matchCode = Integer.parseInt(request.getParameter("match_code"));
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		String nickName = request.getParameter("nickName");
		
		Dao dao = new Dao();
		dao.applyMatch(matchCode,teamCode,nickName);
		
	}

}
