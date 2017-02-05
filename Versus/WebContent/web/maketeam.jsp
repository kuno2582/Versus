<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.versus.dto.InputMemberInfoDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="make-team" class="mfp-hide w3ls_small_dialog">

	<%!int teamCode; 
		InputMemberInfoDto dto;%>
	<%
	if(session.getAttribute("memberInfo") != null){
		
		dto = (InputMemberInfoDto)session.getAttribute("memberInfo") ;
		teamCode = dto.getTeamCode();
	}

	if(session.getAttribute("memberInfo") == null){%>
		<h2>먼저 로그인해야 합니다.</h2>
		<a href="#small-dialog" class="play-icon popup-with-zoom-anim">로그인하러 가기</a>		
	<%}else if(teamCode != 0){%>
		<h2>이미 소속된 팀이 있습니다.</h2>
		<a href="info.do?teamCode="<%=session.getAttribute("teamCode")%>>탈퇴하러 가기</a>	
	<%}else{%>
	<h2>팀 만들기</h2>
	<div class="modal-body agileits_modal_body">
		<form action="makeTeam.do" method="post">
			<input type="hidden" name="teamId" value="${memberInfo.id}">
			<label for="team_name">팀이름: </label><input id="team_name" class="make_input" type="text" name="team_name"><br>
			<label for="teamPhone">팀 대표 전화번호: </label><input id="teamPhone" class="make_input" type="text" name="teamPhone"><br>
			<label for="teamRegion">주요 경기 지역: </label><input id="teamRegion" class="make_input" type="text" name="teamRegion"><br>
			<input type="submit" value="팀 만들기">
		</form>
	</div>
	<%} %>
</div>
<div id="joinTeam" class="mfp-hide w3ls_small_dialog">
	<%if(session.getAttribute("memberInfo") == null){%>
		<h2>먼저 로그인해야 합니다.</h2>
		<a href="#small-dialog" class="play-icon popup-with-zoom-anim">로그인하러 가기</a>		
	<%}else if(teamCode != 0){%>
		<h2>이미 소속된 팀이 있습니다.</h2>
		<a href="info.do?teamCode="<%=session.getAttribute("teamCode")%>>탈퇴하러 가기</a>	
	<%}else{%>
	<h2>팀 목록</h2>
	<form>
		<input type="hidden" name="teamJoinId" value="<%=session.getAttribute("id")%>">
		<table id="joinTeamTable" class="table table-condensed">
			<tr>
				<td>팀이름</td>
				<td>주장</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<%} %>
</div>