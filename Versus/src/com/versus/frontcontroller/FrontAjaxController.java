package com.versus.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.command.ApplyMatch;
import com.versus.command.Command;
import com.versus.command.SignUpCheck;

@WebServlet("*.ajax")
public class FrontAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FrontAjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = null;
		
		String uri = request.getRequestURI();
		System.out.println("URI: " + uri);
		
		String[] arrURI = uri.split("/");
		String comm = arrURI[arrURI.length-1];
		
		for(int i=0; i<arrURI.length; i++ ){
			System.out.format("arrURI[%d] = %s\n", i, arrURI[i]);
		}
		
		System.out.println("command: " + comm);
		System.out.println(request.getParameter("nickName"));
		
		if(comm.equals("signUpCheck.ajax")){
			command = new SignUpCheck();
			command.execute(request, response);
		}if(comm.equals("matchApply.ajax")){
			command = new ApplyMatch();
			command.execute(request, response);
		}
		
	}
}
