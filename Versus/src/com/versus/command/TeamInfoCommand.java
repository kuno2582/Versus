package com.versus.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.MemberDto;
import com.versus.dto.TeamDto;

public class TeamInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		 
		Dao dao = new Dao();
		if(request.getParameter("teamCode")!=null){
			int teamCode = Integer.parseInt(request.getParameter("teamCode"));
			TeamDto dto = dao.teamInfo(teamCode);
			request.setAttribute("teamInfo", dto);
			ArrayList<MemberDto> member_dtos = dao.teamInfoMember(teamCode);
			request.setAttribute("teamInfoMember", member_dtos);
		}else if(request.getParameter("teamCode")==null){
			ArrayList<TeamDto> dtos = dao.teamInfo();
			request.setAttribute("teamInfo", dtos);
		}
		
	}

}
