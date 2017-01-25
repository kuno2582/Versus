package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.InputMemberInfoDto;


public class LoginCheck implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Dao dao = new Dao();
		int loginResult = dao.loginCheck(id,pw);
		
		if(loginResult == 2){
			InputMemberInfoDto dto = dao.inputMemberInfo(id);
			request.setAttribute("memberInfo", dto);
		}
		
		request.setAttribute("loginResult",loginResult);
		
	}

}
