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
		<h2>���� �α����ؾ� �մϴ�.</h2>
		<a href="#small-dialog" class="play-icon popup-with-zoom-anim">�α����Ϸ� ����</a>		
	<%}else if(teamCode != 0){%>
		<h2>�̹� �Ҽӵ� ���� �ֽ��ϴ�.</h2>
		<a href="info.do?teamCode="<%=session.getAttribute("teamCode")%>>Ż���Ϸ� ����</a>	
	<%}else{%>
	<h2>�� �����</h2>
	<div class="modal-body agileits_modal_body">
		<form action="makeTeam.do" method="post">
			<input type="hidden" name="teamId" value="${memberInfo.id}">
			<label for="team_name">���̸�: </label><input id="team_name" class="make_input" type="text" name="team_name"><br>
			<label for="teamPhone">�� ��ǥ ��ȭ��ȣ: </label><input id="teamPhone" class="make_input" type="text" name="teamPhone"><br>
			<label for="teamRegion">�ֿ� ��� ����: </label><input id="teamRegion" class="make_input" type="text" name="teamRegion"><br>
			<input type="submit" value="�� �����">
		</form>
	</div>
	<%} %>
</div>
<div id="joinTeam" class="mfp-hide w3ls_small_dialog">
	<%if(session.getAttribute("memberInfo") == null){%>
		<h2>���� �α����ؾ� �մϴ�.</h2>
		<a href="#small-dialog" class="play-icon popup-with-zoom-anim">�α����Ϸ� ����</a>		
	<%}else if(teamCode != 0){%>
		<h2>�̹� �Ҽӵ� ���� �ֽ��ϴ�.</h2>
		<a href="info.do?teamCode="<%=session.getAttribute("teamCode")%>>Ż���Ϸ� ����</a>	
	<%}else{%>
	<h2>�� ���</h2>
	<form>
		<input type="hidden" name="teamJoinId" value="<%=session.getAttribute("id")%>">
		<table id="joinTeamTable" class="table table-condensed">
			<tr>
				<td>���̸�</td>
				<td>����</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<%} %>
</div>