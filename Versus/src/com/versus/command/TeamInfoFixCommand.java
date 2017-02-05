package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class TeamInfoFixCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		String team_phone = request.getParameter("team-phone");
		String team_region = request.getParameter("team-region");
		String team_uniform = request.getParameter("team-uniform");
		
		Dao dao = new Dao();
		
		dao.teamInfoFix(teamCode, team_phone, team_region, team_uniform);
		
	}

}
