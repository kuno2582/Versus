package com.versus.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.versus.dao.Dao;

public class SignUpCheck implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String checkId = request.getParameter("id");
		
		try {
			JSONObject jsonResult = new JSONObject();
			Dao dao = new Dao();
			String result1 = dao.signUpCheckId(checkId);
			jsonResult.put("result",result1);
			response.setContentType("application/x-json;charset=utf-8");
			response.getWriter().print(jsonResult);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
