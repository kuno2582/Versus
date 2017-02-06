package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.InputMemberInfoDto;

public class MemberFix implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int act = Integer.parseInt(request.getParameter("act"));
		Dao dao = new Dao();
		if(act == 0){
			String leaderID = request.getParameter("leaderID");
			String secondLeaderID = request.getParameter("secondLeaderID");
			int teamCode = Integer.parseInt(request.getParameter("teamCode"));
			dao.memberFix(teamCode,leaderID,secondLeaderID);
		}else if(act==1 || act==2 ){
			String targetID = request.getParameter("targetID");
			int teamCode = Integer.parseInt(request.getParameter("teamCode"));
			dao.memberFix(teamCode,act,targetID);
		}else if(act==3 || act==5){
			String targetID = request.getParameter("targetID");
			dao.memberFix(act,targetID);
		}else if(act==4){
			String targetID = request.getParameter("targetID");
			int teamCode = Integer.parseInt(request.getParameter("teamCode"));
			dao.memberFix(targetID, teamCode);
		}else if(act==6){
			System.out.println("act¡§∫∏: " + act);
			int teamCode = Integer.parseInt(request.getParameter("teamCode"));
			String teamJoinId = request.getParameter("id");
			dao.teamJoinApply(teamJoinId,teamCode);
		}
		String id = request.getParameter("id");
		InputMemberInfoDto dto = dao.inputMemberInfo(id);
		request.setAttribute("memberInfo", dto);
	}

}
