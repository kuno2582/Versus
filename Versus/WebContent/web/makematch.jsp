<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.versus.dto.InputMemberInfoDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="make_match" class="mfp-hide w3ls_small_dialog">
	
	<% System.out.println("세션정보유무: " + session.getAttribute("memberInfo"));
		if (session.getAttribute("memberInfo") == null) {%>
			<h2>먼저 로그인해야 합니다.</h2>
			<a href="#small-dialog" class="play-icon popup-with-zoom-anim">로그인하러 가기</a>
	<%} else if ((Integer)session.getAttribute("teamCode") == 0) {%>
			<h2>소속된 팀이 없습니다.</h2>
			<a href="#make-team" class="play-icon popup-with-zoom-anim">팀 만들러 가기</a><br>
			<a href="#joinTeam" class="play-icon popup-with-zoom-anim joinTeamA">팀 가입하러 가기</a>
	<%} else { %>
	<h2>경기 만들기</h2>
	<div class="modal-body agileits_modal_body team">
		<form action="makeMatch.do" method="post" class="form-inline">

			<input type="hidden" name="teamCode" value="<%=(Integer)session.getAttribute("teamCode")%>">
			<input type="hidden" name="nickName" value="<%=(String)session.getAttribute("nickName")%>">
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>">
			<label for="region1">장소</label>
			<select id="choice_region1" class="frm-field required choice_region1 make_input" name="region1">
				<option value="">선택</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="강원">강원</option>
				<option value="광주">광주</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="대구">대구</option>
				<option value="대전">대전</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="울산">울산</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
				<option value="제주">제주</option>
			</select>
			<select id="choice_region2" class="frm-field required choice_region2 make_input" name="region2">
				<option value="">선택</option>
			</select><br>
			<label for="match_place">세부장소</label>
			<input type="text" id="match_place" name="match_place" class="make_input" autofocus required><br>
			
			<label for="month">일시</label>
			<select name="month" id="month" class="selOpt1">
				<option value="">월</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="day" class="selOpt1">
				<option value="">일</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select>
			<select name="hour" class="selOpt1">
				<option value="">시</option>
				<option value="00">00</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
			</select>
			<br>
			<label for="match_phone">연락처</label><input type="text" name="match_phone" class="make_input" required><br> 
			<label for="match_uniform">유니폼색상</label><input type="text" name="match_uniform" class="make_input"><br>
			
			<div class="teamdata_con">
				<input type="checkbox" name="shower" value="1">샤워실 
				<input type="checkbox" name="parking" value="1">주차장 
				<input type="checkbox" name="neon" value="1">전광판 
				<input type="checkbox" name="whistle" value="1">호루라기
			</div>
			
			<span>- 상세정보 -</span>
			<textarea name="match_more" class="make_input" style="resize: none; width: 100%;"></textarea><br>
			
			<div class="teamdata_con">
				<div id="teamdata_map"></div>
			</div>
			
			<input type="submit" value="만들기">
		</form>
	</div>
	<%}%>
</div>