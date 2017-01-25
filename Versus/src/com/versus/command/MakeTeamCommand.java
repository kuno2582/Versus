package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class MakeTeamCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String team_name = request.getParameter("team_name");
		String leader_id = request.getParameter("teamId"); 
		String team_phone = request.getParameter("teamPhone");
		String team_region = request.getParameter("teamRegion");
		
		Dao dao = new Dao();
		dao.makeTeam(team_name, leader_id, team_phone, team_region);
		
	}

}
