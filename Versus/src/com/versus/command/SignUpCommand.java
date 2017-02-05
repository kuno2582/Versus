package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;

public class SignUpCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String ID = request.getParameter("ID"); 
		String Password = request.getParameter("Password"); 
		String Region = request.getParameter("region1") + " ";
		Region += request.getParameter("region2");
		String Email = request.getParameter("Email");
		int team_code = 0;
		if(request.getParameter("team_code") != ""){
			team_code = Integer.parseInt(request.getParameter("team_code"));
		}
		
		Dao dao = new Dao();
		dao.signUp(ID,Password,Region,Email,team_code);
		
	}

}
