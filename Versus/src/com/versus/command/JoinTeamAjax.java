package com.versus.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.versus.dao.Dao;

public class JoinTeamAjax implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Dao dao = new Dao();
		/*response.setContentType("json;charset=UTF-8");*/
		try {
			JSONArray jsonArray = dao.joinTeamAjax();
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
