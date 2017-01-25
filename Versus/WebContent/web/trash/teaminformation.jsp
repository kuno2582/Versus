<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="team_information" class="mfp-hide w3ls_small_dialog">
	<h2>경기 정보</h2>
	<div class="modal-body agileits_modal_body team">
	<form action="#">
		<span class="teamdata" id="teamdata_name">팀이름 : </span><span class="teamdata" id="teamdata_name1">NCS 하이브리드</span><br>
		<span class="teamdata" id="teamdata_place">장소 : </span><span class="teamdata" id="teamdata_place1">경기 중원구청 제2 종합운동장</span><br>
		<span class="teamdata" id="teamdata_date">일시 : </span><span class="teamdata" id="teamdata_date1">16/12/06 19:00~21:00</span><br>
		<span class="teamdata" id="teamdata_level">팀정보 : </span><span class="teamdata" id="teamdata_level1">Lv 2, 9승 2패</span><br>
		<span class="teamdata" id="teamdata_phone">연락처 : </span><span class="teamdata" id="teamdata_phone1">010-7777-7777</span><br>
		<span class="teamdata" id="teamdata_uniform">유니폼색상 : </span><span class="teamdata" id="teamdata_uniform1">핫핑크</span><br>
		<div class="teamdata_con">
			<input type="checkbox" disabled value="shower" checked>샤워실
			<input type="checkbox" disabled value="parking" checked>주차장
			<input type="checkbox" disabled value="neon" checked>전광판
			<input type="checkbox" disabled value="whistle" checked>호루라기
		</div>
		<span>- 상세정보 -</span>
		<span id="teamdata_more">대관료 90,000</span>
		<div class="teamdata_con">
			<div id="teamdata_map">
			</div>
		</div>
		<input type="submit" value="신청하기">
		<table id="commentTable" class="table table-condensed"></table>
		<table class="table table-condensed">
			<tr>
			</tr>
		</table>
	</form>
	</div>
</div>