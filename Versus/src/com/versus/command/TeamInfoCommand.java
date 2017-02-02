package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.TeamDto;

public class TeamInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		Dao dao = new Dao();
		TeamDto dto = dao.teamInfo(teamCode);
		request.setAttribute("teamInfo", dto);
		
	}

}
