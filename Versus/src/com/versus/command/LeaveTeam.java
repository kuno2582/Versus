package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.InputMemberInfoDto;

public class LeaveTeam implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String targetID = request.getParameter("targetID");
		
		Dao dao = new Dao();
		
		dao.leaveTeam(targetID);
		
		InputMemberInfoDto dto = dao.inputMemberInfo(targetID);
		request.setAttribute("memberInfo", dto);
		
	}

}
