<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.versus.dto.InputMemberInfoDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="make_match" class="mfp-hide w3ls_small_dialog">
	
	<% System.out.println("������������: " + session.getAttribute("memberInfo"));
		if (session.getAttribute("memberInfo") == null) {%>
			<h2>���� �α����ؾ� �մϴ�.</h2>
			<a href="#small-dialog" class="play-icon popup-with-zoom-anim">�α����Ϸ� ����</a>
	<%} else if ((Integer)session.getAttribute("teamCode") == 0) {%>
			<h2>�Ҽӵ� ���� �����ϴ�.</h2>
			<a href="#make-team" class="play-icon popup-with-zoom-anim">�� ���鷯 ����</a>
	<%} else { %>
	<h2>��� �����</h2>
	<div class="modal-body agileits_modal_body team">
		<form action="makeMatch.do" method="post" class="form-inline">

			<input type="hidden" name="teamCode" value="<%=(Integer)session.getAttribute("teamCode")%>">
			<input type="hidden" name="nickName" value="<%=(String)session.getAttribute("nickName")%>">
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>">
			<label for="region1">���</label>
			<select id="choice_region1" class="frm-field required choice_region1 make_input" name="region1">
				<option value="">����</option>
				<option value="����">����</option>
				<option value="���">���</option>
				<option value="��õ">��õ</option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="���">���</option>
				<option value="�泲">�泲</option>
				<option value="�뱸">�뱸</option>
				<option value="����">����</option>
				<option value="���">���</option>
				<option value="�泲">�泲</option>
				<option value="���">���</option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="����">����</option>
			</select>
			<select id="choice_region2" class="frm-field required choice_region2 make_input" name="region2">
				<option value="">����</option>
			</select><br>
			<label for="match_place">�������</label>
			<input type="text" id="match_place" name="match_place" class="make_input" autofocus required><br>
			
			<label for="month">�Ͻ�</label>
			<select name="month" id="month" class="selOpt1">
				<option value="">��</option>
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
				<option value="">��</option>
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
				<option value="">��</option>
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
			<label for="match_phone">����ó</label><input type="text" name="match_phone" class="make_input" required><br> 
			<label for="match_uniform">����������</label><input type="text" name="match_uniform" class="make_input"><br>
			
			<div class="teamdata_con">
				<input type="checkbox" name="shower" value="1">������ 
				<input type="checkbox" name="parking" value="1">������ 
				<input type="checkbox" name="neon" value="1">������ 
				<input type="checkbox" name="whistle" value="1">ȣ����
			</div>
			
			<span>- ������ -</span>
			<textarea name="match_more" class="make_input" style="resize: none; width: 100%;"></textarea><br>
			
			<div class="teamdata_con">
				<div id="teamdata_map"></div>
			</div>
			
			<input type="submit" value="�����">
		</form>
	</div>
	<%}%>
</div>