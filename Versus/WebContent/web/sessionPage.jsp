<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.versus.dto.InputMemberInfoDto"%>
<%@ page import="com.versus.dto.MatchDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session Page</title>
</head>
<body>
<%!
	InputMemberInfoDto dto;
	MatchDto match_dtos;
	String id;
	String nickName;
	int teamCode;
	Boolean isLeader,isSecondLeader;
	String teamName;
	String sendPage = "main.jsp";
	
%>
<%
	//�α��� ����
	if(request.getAttribute("memberInfo")!= null){
		session.setAttribute("memberInfo",request.getAttribute("memberInfo"));
		dto = (InputMemberInfoDto)request.getAttribute("memberInfo") ;
		teamCode = dto.getTeamCode();
		session.setAttribute("teamCode",teamCode);
		teamName = dto.getTeamName();
		session.setAttribute("teamName",teamName);
		nickName = dto.getNickName();
		session.setAttribute("nickName",nickName);
		id = dto.getId();
		session.setAttribute("id",id);
		isLeader = dto.isLeader();
		session.setAttribute("isLeader", isLeader);
		isSecondLeader = dto.isSecond_leader();
		session.setAttribute("isSecondLeader", isSecondLeader);
		System.out.println("sessionPage.jsp : �α��� �� ���ǿ� ���� ����!");
	}

	//�α׾ƿ� �� ���ǻ���
	if(request.getAttribute("logout") != null){
		if((String)request.getAttribute("logout") == "logout"){
			session.invalidate();
			System.out.println("sessionPage.jsp : �α׾ƿ� �� ������ ���� ����");
		}
	}

	response.sendRedirect(sendPage);
%>
</body>
</html>