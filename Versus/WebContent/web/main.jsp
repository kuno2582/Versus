<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Matchmaking a Mobile App Flat Bootstrap Responsive
	Website Template | Main :: W3layouts</title>
<!-- For-Mobile-Apps-and-Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Matchmaking Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, SmartPhone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- //For-Mobile-Apps-and-Meta-Tags -->
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="style.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' id='fluid_dg-css' href='css/fluid_dg.css'
	type='text/css' media='all'>
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //font-awesome icons -->
<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
<!-- js -->
<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
<!-- 다음지도 api -->
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9978627f24a383749e985ea4d7323101"></script> -->
<!-- //js -->
<!-- web-fonts -->
<link href='//fonts.googleapis.com/css?family=Courgette'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- //web-fonts -->

</head>

<body class="bg">
<%!
String ft_nav2="matchstatus.jsp";
String ft_nav3="info.jsp";
String anim_class="";
Boolean firstLoad = false;
%>
<%if(request.getAttribute("list")!=null)firstLoad=true; %>
	<jsp:include page="login.jsp" flush="true"/>
	<jsp:include page="maketeam.jsp" flush="true"/>
	<jsp:include page="makematch.jsp" flush="true"/>
	<jsp:include page="hasNoTeam.jsp" flush="true"/>
	<div class="nav-container hidden hideNav w3_nav">
		<ul class="nav-list">
			<%if(session.getAttribute("memberInfo")==null){
				ft_nav2="#make-team";
				ft_nav3="#make-team";
				anim_class="popup-with-zoom-anim";
			}else if(session.getAttribute("memberInfo")!=null){
				ft_nav2="matchStatus.do?teamCode="+session.getAttribute("teamCode");
				ft_nav3="info.do?teamCode="+session.getAttribute("teamCode");
				anim_class="";
				if((Integer)session.getAttribute("teamCode")==0){
					ft_nav3="#hasNoTeam";
					anim_class="popup-with-zoom-anim";
				}
			}%>
			<li class="list-item active"><a href="searchMatch.do"><i
					class="glyphicon glyphicon-home"></i></a></li>
			<li class="list-item"><a href="<%=ft_nav2%>" class="<%=anim_class%>">
				<span>매치정보</span></a></li>
			<li class="list-item"><a href="<%=ft_nav3%>" class="<%=anim_class%>">
				<span>팀정보</span></a></li>
			<li class="list-item"><a href="faq.do">
				<span>FAQ</span></a></li>
			<li class="list-item"><a href="#make-team" class="popup-with-zoom-anim">
				<span>팀만들기</span></a></li>
			<li class="list-item"><a href="#joinTeam" class="popup-with-zoom-anim joinTeamA">
				<span>팀가입</span></a></li>
		</ul>
	</div>
	<div id="ban" class="agileinfo_menu w3l_menu">
		<button class="btn-nav w3layouts_btn">
			<img src="images/nav-icon.png" width="30px" height="25px">
		</button>
		<div class="agileinfo_menu_center">
			<h1>
				<a href="main.jsp"><span id="mainV">V</span>ersus<span>For Exciting <i>Matches</i></span></a>
			</h1>
		</div>
		<div class="agileinfo_menu_right">
			<ul>
				<%
				if( session.getAttribute("memberInfo") == null){%>
					<li>
						<a href="#small-dialog"
						class="play-icon popup-with-zoom-anim"><img
							src="images/login.png" width="35px" height="35px"></a>
					</li>
				<% }else{%> 
				
					<li>	
						<div class="info_id"><a href="logout.do">${memberInfo.id}</a></div>
						<!-- <img src="images/close.png" width="30px" height="30px"> -->
					</li>
				<%}%>
			</ul>
		</div>
		<div class="clearfix"></div>
		<div class="banner-bottom-login">
			<div class="w3agile_banner_btom_login">
				<form action="searchMatch.do" name="searchMatchForm" method="post" class="searchClass">
					<div class="w3agile__text w3agile_banner_btom_login_left city">
						<h4>지역</h4>
						<select class="frm-field required country choice_region1" name="region1">
							<option value="" selected>선택</option><option value="서울">서울</option><option value="경기">경기</option>
							<option value="인천">인천</option><option value="강원">강원</option><option value="광주">광주</option>
							<option value="충북">충북</option><option value="충남">충남</option><option value="대구">대구</option>
							<option value="대전">대전</option><option value="경북">경북</option><option value="경남">경남</option>
							<option value="울산">울산</option><option value="전북">전북</option><option value="전남">전남</option>
							<option value="제주">제주</option>
						</select>
					</div>
					<div class="w3agile__text w3agile_banner_btom_login_left city city2">
						<h4>지역2</h4>
						<select class="frm-field required country choice_region2" name="region2">
							<option value="">선택</option>
						</select>
					</div>
					<div class="w3agile__text w3agile_banner_btom_login_left2">
						<h4>날짜</h4>
						<select name="search_month" class="selOpt">
							<option value="" selected>월</option><option value="1">1</option><option value="2">2</option>
							<option value="3">3</option><option value="4">4</option><option value="5">5</option>
							<option value="6">6</option><option value="7">7</option><option value="8">8</option>
							<option value="9">9</option><option value="10">10</option><option value="11">11</option>
							<option value="12">12</option>
						</select>
						<select name="search_day" class="selOpt">
							<option value="" selected>일</option><option value="1">1</option><option value="2">2</option>
							<option value="3">3</option><option value="4">4</option><option value="5">5</option>
							<option value="6">6</option><option value="7">7</option><option value="8">8</option>
							<option value="9">9</option><option value="10">10</option><option value="11">11</option>
							<option value="12">12</option><option value="13">13</option><option value="14">14</option>
							<option value="15">15</option><option value="16">16</option><option value="17">17</option>
							<option value="18">18</option><option value="19">19</option><option value="20">20</option>
							<option value="21">21</option><option value="22">22</option><option value="23">23</option>
							<option value="24">24</option><option value="25">25</option><option value="26">26</option>
							<option value="27">27</option><option value="28">28</option><option value="29">29</option>
							<option value="30">30</option><option value="31">31</option>
						</select>
						<!-- <input type="date" name="start_date" id="start_date" name="date"> -->
					</div>
					<div class="w3agile__text w3agile_banner_btom_login_left1">
						<h4>시간</h4>
						<select id="country1" class="frm-field required time1" name="time1">
							<option value="" selected>시</option><option value="00">00</option><option value="01">01</option>
							<option value="02">02</option><option value="03">03</option><option value="04">04</option>
							<option value="05">05</option><option value="06">06</option><option value="07">07</option>
							<option value="08">08</option><option value="09">09</option><option value="10">10</option>
							<option value="11">11</option><option value="12">12</option><option value="13">13</option>
							<option value="14">14</option><option value="15">15</option><option value="16">16</option>
							<option value="17">17</option><option value="18">18</option><option value="19">19</option>
							<option value="20">20</option><option value="21">21</option><option value="22">22</option>
							<option value="23">23</option><option value="24">24</option>
						</select> <span>~</span> 
						<select id="country2" class="frm-field required time2" name="time2">
							<option value="" selected>시</option><option value="00">00</option><option value="01">01</option>
							<option value="02">02</option><option value="03">03</option><option value="04">04</option>
							<option value="05">05</option><option value="06">06</option><option value="07">07</option>
							<option value="08">08</option><option value="09">09</option><option value="10">10</option>
							<option value="11">11</option><option value="12">12</option><option value="13">13</option>
							<option value="14">14</option><option value="15">15</option><option value="16">16</option>
							<option value="17">17</option><option value="18">18</option><option value="19">19</option>
							<option value="20">20</option><option value="21">21</option><option value="22">22</option>
							<option value="23">23</option><option value="24">24</option>
						</select>
					</div>
					
					<div class="clearfix"></div>
					<div class="submit_center">
						<input type="image" name="submit" src="images/find.png" border="0" width="20px" height="20px"
							class="submit_button">
					</div>
				</form>
			</div>
		</div>
		<div class="find_dropdown">
			<div class="find_button">
				<a data-toggle="collapse" href="#collapse1" id="find_button"> <img
					src="images/find.png" id="find_button" width="20px" height="20px"></a>
			</div>
		</div>
	</div>

	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<div class="banner-bottom" id="moveup">
		<c:forEach items="${list}" var="MatchDto" varStatus="MatchStatus">
		<c:if test="${MatchDto.match_progress !='2' && MatchDto.match_progress !='3'}">
			<div class="information">
				<a href="#team_information${MatchStatus.count}" class="team_information play-icon popup-with-zoom-anim">
					<div class="team_progress">
						<div class="progress_circle progress_green"></div>
						<div class="progress_circle progress_yellow"></div>
						<div class="progress_circle progress_red"></div>
					</div>
					<div class="team_info">
						<div class="team_mark">
							<p>
								<b>${MatchDto.team_name}</b>
							<p>
						</div>
						<div class="placeinfo">
							<p>${MatchDto.match_region}</p>
						</div>
						<div class="date_con">
							<div class="dateinfo">
								<p>
									<c:forTokens var="YMD" items="${MatchDto.match_date}" delims=" " begin="0" end="0">
									${YMD}
									</c:forTokens>
								</p>
							</div>
							<div class="timeinfo">
								<p>
									<c:forTokens var="HMS" items="${MatchDto.match_date}" delims=" " begin="1" end="1">
										<c:forTokens var="HM" items="${HMS}" delims=":" begin="0" end="1" varStatus="status">
											${HM}<c:if test="${status.count == 1}"> :</c:if>
										</c:forTokens>
									</c:forTokens>
								</p>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div id="team_information${MatchStatus.count}" class="team_information mfp-hide w3ls_small_dialog">
				<h2>경기 정보</h2>
				<div class="modal-body agileits_modal_body">
				<form action="#" id="team_information_apply${MatchStatus.count}">
					<input type="hidden" value="${MatchDto.match_num}" id="teamdata_code${MatchStatus.count}">
					<input type="hidden" value="<%=session.getAttribute("teamCode")%>" class="session_teamCode">
					<input type="hidden" value="<%=session.getAttribute("nickName")%>" class="session_nickName">
					<input type="hidden" value="<%=session.getAttribute("teamName")%>" class="session_teamName">
					<span class="teamdata" id="teamdata_name">팀이름 : </span><span class="teamdata" id="teamdata_name${MatchStatus.count}">${MatchDto.team_name}</span><br>
					<span class="teamdata" id="teamdata_place">장소 : </span><span class="teamdata" id="teamdata_place${MatchStatus.count}">${MatchDto.match_region}</span><br>
					<span class="teamdata" id="teamdata_date">일시 : </span><span class="teamdata" id="teamdata_date${MatchStatus.count}">
						<c:forTokens var="HM" items="${MatchDto.match_date}" delims=":" begin="0" end="1" varStatus="status">
							${HM}<c:if test="${status.count == 1}"> :</c:if>
						</c:forTokens>
					</span><br>
					<span class="teamdata" id="teamdata_level">팀정보 : </span><span class="teamdata" id="teamdata_level${MatchStatus.count}">Lv ${MatchDto.level}, ${MatchDto.win}승 ${MatchDto.lose}패 ${MatchDto.draw}무, 
						경고횟수: ${MatchDto.penalty}</span><br>
					<span class="teamdata" id="teamdata_phone">연락처 : </span><span class="teamdata" id="teamdata_phone${MatchStatus.count}">${MatchDto.match_phone}</span><br>
					<span class="teamdata" id="teamdata_uniform">유니폼색상 : </span><span class="teamdata" id="teamdata_uniform${MatchStatus.count}">${MatchDto.uniform}</span><br>
					<div class="teamdata_con">
						<c:choose>
							<c:when test="${MatchDto.shower == '1'}"><input type="checkbox" disabled value="shower">샤워실</c:when>
							<c:otherwise><input type="checkbox" disabled value="shower" checked>샤워실</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.parking == '1'}"><input type="checkbox" disabled value="parking">주차장</c:when>
							<c:otherwise><input type="checkbox" disabled value="parking" checked>주차장</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.neon == '1'}"><input type="checkbox" disabled value="neon">전광판</c:when>
							<c:otherwise><input type="checkbox" disabled value="neon" checked>전광판</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.whistle == '1'}"><input type="checkbox" disabled value="whistle">호루라기</c:when>
							<c:otherwise><input type="checkbox" disabled value="whistle" checked>호루라기</c:otherwise>
						</c:choose>
					</div>
					<span>- 상세정보 -</span><br>
					<span id="teamdata_more">${MatchDto.more_info}</span>
					<div class="teamdata_con">
						<div id="teamdata_map"></div>
					</div>
					<%if((session.getAttribute("memberInfo")==null)||((Integer)session.getAttribute("teamCode")==0)){
						%><a href="#make_match" class="apply_error popup-with-zoom-anim">신청하기</a><%
					}else{
						%><input type="button" value="신청하기" class="apply_error btn_apply_match${MatchStatus.count}" onclick="apply_button(${MatchStatus.count})"><%
					} %> 
					<table id="commentTable${MatchStatus.count}" class="table table-condensed commentTable">
						<c:forEach items="${matchComment}" var="Comment">
							<c:if test="${Comment.match_num eq MatchDto.match_num}">
								<tr>
									<td>${Comment.team_name}</td>
									<td>${Comment.nickName}</td>
									<td>${Comment.comment}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</form>
				</div>
			</div>
		</c:if>
		</c:forEach>
	</div>
		<!-- 경기 정보 -->
		<!-- 경기 만들기 -->
		<div class="footer_nav">
			<div class="ft_nav1"><a href="searchMatch.do"><img src="images/matching.png" width="40px" height="40px"></a></div>
			<div class="ft_nav2"><a href="<%=ft_nav2%>" class="<%=anim_class%>"><img src="images/status.png" width="40px" height="40px"></a></div>
			<div class="ft_nav3"><a href="<%=ft_nav3%>" class="<%=anim_class%>"><img src="images/teamInfo.png" width="40px" height="40px"></a></div>
			<div class="ft_nav4"><a href="faq.do"><img src="images/qna.png" width="40px" height="40px"></a></div>
		</div>
		<div class="footer-pos">
			<a href="#make_match" class="play-icon popup-with-zoom-anim"><span></span></a>
		</div>

		<div class="footer">
	</div>
	<!-- //footer -->
	<!-- banner -->
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript' src='js/fluid_dg.min.js'></script>
	<script type='text/javascript' src='js/versus.js' charset="utf-8"></script>
	<!-- //banner -->
	<!-- nav -->
	<script type="text/javascript">
	//첫 로드시 경기정보 불러오기
	var firstLoad = <%=!firstLoad%>;
	if(firstLoad){
		$(searchMatchForm).submit();
	}
	
	//경기신청 에이잭스
	function apply_button(match_num){
		$.ajax({
			type:"post",
			url:"matchApply.ajax",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{
				match_code : $('#teamdata_code'+match_num).val(),
				teamCode : $('.session_teamCode').val(),
				nickName : $('.session_nickName').val()
			},
			datatype:"json",
			success:function(data){
				appendComment(match_num);
			},
			error:function(data){
				alert('error');
			}
		});
	}
	
	//회원가입 아이디 중복확인
	$('#id_check').click(function(){
		var id_check = $('#idCheck1').val();
		$.ajax({
			type:'GET',
			url:"signUpCheck.ajax",
			data:{"id":id_check},
			datatype:"JSON",
			contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			success:function(obj){
				$('#idCheckVal').val('OK');
				if($('#idCheckVal').val()=='OK' && $('#pwCheckVal').val()=='OK'){
					$('.signUpBtn').css('background','#24AB00');
				}
			}
		});
	});

	//경기신청시 댓글달기
	function appendComment(match_num){
		var str1="경기 신청합니다.";
		var str = "<tr><td>"+$('.session_teamName').val()+"</td><td>"+$('.session_nickName').val()+"</td>" +
		"<td>"+str1+"</td></tr>";
		$('#commentTable'+match_num).append(str);
	}
	
	//지역별 검색 옵션 이벤트
	$(function(){
	
		var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구",
					"도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구",
					"영등포구","용산구","은평구","종로구","중구","중랑구"];
		var keongki = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시",
						"남양주", "동두천", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시",
						"안양시", "양주시", "양평군", "여주군", "연천군", "오산시", "용인시", "의왕시",
						"의정부", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
		var incheon = ["강화군","계양구", "남구","남동구", "동구","부평구", "서구","연수구", "웅진군", "중구"];
		var gangwon = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군",
						"정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
		var keongbuk = ["경산시", "경주시", "고령군", "구미시", "군위군", 
						"김천시", "문경시", "봉화군", "상주시", "성주군", 
						"안동시", "영덕군", "영양군", "영주시", "영천시", 
						"예천군", "울릉군", "울진군", "의성군", "청도군", 
						"청송군", "칠곡군", "포항시"];
		var keongnam = ["거제시", "거창군", "고성군", "김해시", 
						"남해군", "마산시", "밀양시", "사천시",
						"산청군", "양산시", "의령군", "진주시", 
						"진해시", "창년군", "창원시", "통영시",
						"하동군", "함안군", "함양군", "합천군"];
		var gwangju = ["광산구", "남구","동구","북구","서초구"];
		var daegu = ["남구","달서구","달성군", "동구","북구","서구","수성구", "중구"];
		var daejeon = ["대덕구", "동구","서구","유성구", "중구"];
		var busan = ["강서구", "금정구", "기장군", "남구",
					"동구", "동래구", "부산진구", "북구", 
					"사상구", "사하구", "서구", "수영구", 
					"연제구", "영도구", "중구", "해운대"];
		var ulsan = ["중구","남구", "동구","북구","울주군"];
		var jeonnam = ["강진군", "고흥군", "곡성군", "광양시", 
						"구례군", "나주시", "담양군", "목포시", 
						"무안군", "보성군", "순천시", "신안군", 
						"여수시", "영광군", "영암군", "완도군", 
						"정성군", "장흥군", "진도군", "함평군", 
						"해남군", "화순군"];
		var jeonbuk = ["고창군", "군산시", "김제시", "남원시", 
						"무주군", "부안군", "순찬군", "완주군", 
						"익산시", "임실군", "장수군", "전주시", 
						"정읍시", "진안군"];
		var jeju = ["서귀포시", "제주시"];
		var chungnam = ["공주시", "금산군", "논산시", "당진군",
						"보령시", "부여군", "서산시", "서천군",
						"아산시", "연기군", "예산군", "천안시", 
						"청양군", "태안군", "홍성군", "계룡시"];
		var chungbuk = ["괴산군", "단양군", "보은군", "영동군", 
						"옥천군", "음성군", "제천시", "전천군", 
						"창원군", "청주시", "충주시", "증평군"];
		
		
		
		$('.choice_region1').on("change", function(){
			var region = $(this).val();
			$('.choice_region2').empty();
			$('.choice_region2').append('<option value="">선택</option>');
			switch(region){
				case "서울":
					for(i=0; i<seoul.length; i++){
						$('.choice_region2').append('<option value='+seoul[i]+'>' + seoul[i] + '</option>');
					}
					break;
				case "경기":
					for(i=0; i<keongki.length; i++){
						$('.choice_region2').append('<option value='+keongki[i]+'>' + keongki[i] + '</option>');
					}
					break;
				case "인천":
					for(i=0; i<incheon.length; i++){
						$('.choice_region2').append('<option value='+incheon[i]+'>' + incheon[i] + '</option>');
					}
					break;
				case "강원":
					for(i=0; i<gangwon.length; i++){
						$('.choice_region2').append('<option value='+gangwon[i]+'>' + gangwon[i] + '</option>');
					}
					break;
				case "광주":
					for(i=0; i<gwangju.length; i++){
						$('.choice_region2').append('<option value='+gwangju[i]+'>' + gwangju[i] + '</option>');
					}
					break;
				case "충북":
					for(i=0; i<chungbuk.length; i++){
						$('.choice_region2').append('<option value='+chungbuk[i]+'>' + chungbuk[i] + '</option>');
					}
					break;
				case "충남":
					for(i=0; i<chungnam.length; i++){
						$('.choice_region2').append('<option value='+chungnam[i]+'>' + chungnam[i] + '</option>');
					}
					break;
				case "대구":
					for(i=0; i<daegu.length; i++){
						$('.choice_region2').append('<option value='+daegu[i]+'>' + daegu[i] + '</option>');
					}
					break;
				case "대전":
					for(i=0; i<daejeon.length; i++){
						$('.choice_region2').append('<option value='+daejeon[i]+'>' + daejeon[i] + '</option>');
					}
					break;
				case "경북":
					for(i=0; i<keongbuk.length; i++){
						$('.choice_region2').append('<option value='+keongbuk[i]+'>' + keongbuk[i] + '</option>');
					}
					break;
				case "경남":
					for(i=0; i<keongnam.length; i++){
						$('.choice_region2').append('<option value='+keongnam[i]+'>' + keongnam[i] + '</option>');
					}
					break;
				case "울산":
					for(i=0; i<ulsan.length; i++){
						$('.choice_region2').append('<option value='+ulsan[i]+'>' + ulsan[i] + '</option>');
					}
					break;
				case "전북":
					for(i=0; i<jeonbuk.length; i++){
						$('.choice_region2').append('<option value='+jeonbuk[i]+'>' + jeonbuk[i] + '</option>');
					}
					break;
				case "전남":
					for(i=0; i<jeonnam.length; i++){
						$('.choice_region2').append('<option value='+jeonnam[i]+'>' + jeonnam[i] + '</option>');
					}
					break;
				case "제주":
					for(i=0; i<jeju.length; i++){
						$('.choice_region2').append('<option value='+jeju[i]+'>' + jeju[i] + '</option>');
					}
					break;
			}
		});
	});
	</script>
	<!-- //nav -->
</body>
</html>