package com.versus.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.dao.Dao;
import com.versus.dto.FaqDto;

public class FaqCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Dao dao = new Dao();
		
		ArrayList<FaqDto> dtos = dao.faqGet();
		
		request.setAttribute("FAQList", dtos);
		
	}

}
