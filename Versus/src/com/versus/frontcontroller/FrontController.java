package com.versus.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.versus.command.AcceptMatch;
import com.versus.command.Command;
import com.versus.command.FaqCommand;
import com.versus.command.LoginCheck;
import com.versus.command.MakeMatchCommand;
import com.versus.command.MakeTeamCommand;
import com.versus.command.SearchCommand;
import com.versus.command.SendReportCommand;
import com.versus.command.SignUpCommand;
import com.versus.command.TeamInfoCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*HttpSession session = request.getSession(true);
		String nowPage = (session.getAttribute("nowPage")).toString();
		System.out.println(nowPage);*/
		System.out.println("actionDo");
		
		request.setCharacterEncoding("EUC-KR");
		
		String viewPage = null;
		Command command = null;
		Command command2 = null;
		
		String uri = request.getRequestURI();
		System.out.println("URI: " + uri);
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath: " + contextPath);
		
		String[] arrURI = uri.split("/");
		String comm = arrURI[arrURI.length-1];
		
		for(int i=0; i<arrURI.length; i++ ){
			System.out.format("arrURI[%d] = %s\n", i, arrURI[i]);
		}
		
		System.out.println("command: " + comm);
		
		if(comm.equals("loginCheck.do")){
			command = new LoginCheck();
			command.execute(request,response);
			command2 = new SearchCommand();
			command2.execute(request, response);
			viewPage = "sessionPage.jsp";
		}else if(comm.equals("logout.do")){
			request.setAttribute("logout", "logout");
			viewPage = "sessionPage.jsp";
		}else if(comm.equals("signUp.do")){
			command = new SignUpCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
		}else if(comm.equals("makeTeam.do")){
			command = new MakeTeamCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
		}else if(comm.equals("makeMatch.do")){
			command = new MakeMatchCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
		}else if(comm.equals("searchMatch.do")){
			command = new SearchCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
		}else if(comm.equals("matchStatus.do")){
			command = new SearchCommand();
			command.execute(request, response);
			request.setAttribute("teamCode",request.getParameter("teamCode"));
			viewPage = "matchstatus.jsp";
		}else if(comm.equals("faq.do")){
			command = new FaqCommand();
			command.execute(request, response);
			viewPage = "faq.jsp";
		}else if(comm.equals("info.do")){
			command = new TeamInfoCommand();
			command.execute(request, response);
			viewPage = "info.jsp";
		}else if(comm.equals("acceptMatch.do")){
			command = new AcceptMatch();
			command.execute(request, response);
			command = new SearchCommand();
			command.execute(request, response);
			viewPage = "matchstatus.jsp";
		}else if(comm.equals("report.do")){
			command = new SendReportCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}
