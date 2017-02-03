<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Matchmaking a Mobile App Flat Bootstrap Responsive
	Website Template | Main :: W3layouts</title>
<!-- For-Mobile-Apps-and-Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Matchmaking Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, SmartPhone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- //For-Mobile-Apps-and-Meta-Tags -->
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9978627f24a383749e985ea4d7323101"></script>
<!-- //js -->
<!-- web-fonts -->
<link href='//fonts.googleapis.com/css?family=Courgette'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href='//http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<!-- //web-fonts -->

</head>
<%!
String ft_nav2="matchstatus.jsp";
String ft_nav3="info.jsp";
String anim_class="";
%>
<body class="bg">
	<jsp:include page="login.jsp" flush="true"/>
	<jsp:include page="maketeam.jsp" flush="true"/>
	<%-- <jsp:include page="matchInformation.jsp" flush="true"/> --%>
	<div class="nav-container hidden hideNav w3_nav">
		<ul class="nav-list">
			<li class="list-item active"><a href="main.jsp"><i
					class="glyphicon glyphicon-home"></i></a></li>
			<li class="list-item"><a href="matchstatus.jsp"><i
					class="glyphicon glyphicon-info-sign" ></i></a></li>
			<li class="list-item"><a href="info.jsp"><i
					class="glyphicon glyphicon-cog"></i></a></li>
			<li class="list-item"><a href="faq.jsp"><i
					class="glyphicon glyphicon-text-size" ></i></a></li>
			<li class="list-item"><a href="#make-team" class="popup-with-zoom-anim"><i
					class="glyphicon glyphicon-picture"></i></a></li>
			<li class="list-item"><a href="#make_match" class="popup-with-zoom-anim"><i
					class="glyphicon glyphicon-envelope"></i></a></li>
		</ul>
	</div>
	<div id="ban" class="agileinfo_menu w3l_menu">
		<button class="btn-nav w3layouts_btn">
			<img src="images/nav-icon.png" width="30px" height="25px">
		</button>
		<div class="agileinfo_menu_center">
			<h1>
				<a href="main.html"><span id="mainV">V</span>ersus<span>For Exciting <i>Matches</i></span></a>
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
		
	</div>

	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	
	<div class="banner-bottom-info">
		<div class="bottom-teaminfo">
			<div class="bottom-status-left"><a href="#"><img src="images/back.png" width="25px" height="25px"></a></div>
			<div class="bottom-status-center"><div class="tinfo-center-con"><div class="con-cell"><b>진행 정보</b></div></div></div>
			<div class="bottom-status-right"></div>
		</div>
		<p class="status-success-p">매칭 완료</p>
		<div id="status-success">
			<c:forEach items="${list}" var="MatchDto" varStatus="MatchStatus">
				<c:if test="${teamCode == MatchDto.team_code && MatchDto.match_progress =='2'}">
					<a href="#team_red${MatchStatus.count}" class="team_information play-icon popup-with-zoom-anim">
						<div class="status-list">
							<div class="progress_circle progress_red"></div>
							<span>vs</span><span>${MatchDto.team_name}</span>
							<span class="status-place">${MatchDto.match_region}</span>
							<span>
								<c:forTokens var="YMD" items="${MatchDto.match_date}" delims=" " begin="0" end="0">
									${YMD}
								</c:forTokens>
							</span>
						</div>
					</a>
					
					<div id="team_red${MatchStatus.count}" class="team_information mfp-hide w3ls_small_dialog">
						<h2>매칭 완료</h2>
						<div class="modal-body agileits_modal_body">
						<form action="#" id="team_information_apply${MatchStatus.count}">
							<input type="hidden" value="${MatchDto.match_num}" id="teamdata_code${MatchStatus.count}">
							<input type="hidden" value="<%=session.getAttribute("teamCode")%>" class="session_teamCode">
							<input type="hidden" value="<%=session.getAttribute("nickName")%>" class="session_nickName">
							<input type="hidden" value="<%=session.getAttribute("teamName")%>" class="session_teamName">
							<span class="teamdata" id="teamdata_name">팀이름 : </span>
							<c:forEach items="${teamInfo}" var="teamDto">
								<c:if test="${MatchDto.opponent_code eq teamDto.team_code}">
								<span class="teamdata" id="teamdata_name${MatchStatus.count}">${MatchDto.team_name} vs ${teamDto.team_name}</span><br>
								<span class="teamdata" id="teamdata_place">장소 : </span><span class="teamdata" id="teamdata_place${MatchStatus.count}">${MatchDto.match_region}</span><br>
								<span class="teamdata" id="teamdata_date">일시 : </span><span class="teamdata" id="teamdata_date${MatchStatus.count}">
								<c:forTokens var="HM" items="${MatchDto.match_date}" delims=":" begin="0" end="1" varStatus="status">
									${HM}<c:if test="${status.count == 1}"> :</c:if>
								</c:forTokens>
								</span><br><hr>
								<span class="teamdata" id="teamdata_level">상대팀정보 : </span>
								<span class="teamdata" id="teamdata_level${MatchStatus.count}">Lv ${teamDto.level}, ${teamDto.win}승 ${teamDto.lose}패 ${teamDto.draw}무, 
								경고횟수: ${teamDto.penalty}</span><br>
								<span class="teamdata" id="teamdata_phone">연락처 : </span><span class="teamdata" id="teamdata_phone${MatchStatus.count}">${teamDto.leader_phone}</span><br>
								<span class="teamdata" id="teamdata_uniform">유니폼색상 : </span><span class="teamdata" id="teamdata_uniform${MatchStatus.count}">${teamDto.uniform}</span><br>
							</c:if>
							</c:forEach>
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
							<input type="button" value="승리" class="resultBtn btn_apply_match${MatchStatus.count}" 
								onclick="matchResult(${MatchDto.match_num},'win',<%=session.getAttribute("teamCode")%>)">
							<input type="button" value="무승부" class="resultBtn btn_apply_match${MatchStatus.count}" 
								onclick="matchResult(${MatchDto.match_num},'draw',<%=session.getAttribute("teamCode")%>)">
							<input type="button" value="패배" class="resultBtn btn_apply_match${MatchStatus.count}" 
								onclick="matchResult(${MatchDto.match_num},'lose',<%=session.getAttribute("teamCode")%>)">
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
		<hr>
		<p class="status-ing-p">매칭 진행중</p>
		<div id="status-ing">
			<c:forEach items="${list}" var="MatchDto" varStatus="MatchStatus">
				<c:if test="${teamCode == MatchDto.team_code && (MatchDto.match_progress =='1' || MatchDto.match_progress=='0')}">
					<a href="#team_green${MatchStatus.count}" class="team_information play-icon popup-with-zoom-anim">
						<div class="status-list">
							<div class="progress_circle progress_green"></div>
							<span>vs</span><span>${MatchDto.team_name}</span>
							<span class="status-place">${MatchDto.match_region}</span>
							<span>
								<c:forTokens var="YMD" items="${MatchDto.match_date}" delims=" " begin="0" end="0">
									${YMD}
								</c:forTokens>
							</span>
						</div>
					</a>
					
					<div id="team_green${MatchStatus.count}" class="team_information mfp-hide w3ls_small_dialog">
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
											<c:if test="${Comment.application}">
												<td><input type="button" value="수락" onclick="acceptMatch(${MatchDto.match_num},${Comment.team_code})"></td>
											</c:if>
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
		<hr>
		<p class="status-fail-p">매칭 실패</p>
		<div id="status-fail">
			<c:forEach items="${list}" var="MatchDto" varStatus="MatchStatus">
				<c:if test="${teamCode == MatchDto.team_code && MatchDto.match_progress =='3'}">	
					<a href="#team_gray${MatchStatus.count}" class="team_information play-icon popup-with-zoom-anim">
						<div class="status-list">
							<div class="progress_circle progress_gray"></div>
							<span>vs</span><span>${MatchDto.team_name}</span>
							<span class="status-place">${MatchDto.match_region}</span>
							<span>
								<c:forTokens var="YMD" items="${MatchDto.match_date}" delims=" " begin="0" end="0">
									${YMD}
								</c:forTokens>
							</span>
						</div>
					</a>
					
					<div id="team_gray${MatchStatus.count}" class="team_information mfp-hide w3ls_small_dialog">
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
		
		<div class="footer_nav">
			<%if(session.getAttribute("memberInfo")==null){
				ft_nav2="#make-team";
				ft_nav3="#make-team";
				anim_class="popup-with-zoom-anim";
			}else if(session.getAttribute("memberInfo")!=null){
				ft_nav2="matchStatus.do?teamCode="+session.getAttribute("teamCode");
				ft_nav3="info.do?teamCode="+session.getAttribute("teamCode");
				anim_class="";
			}%>
			<div class="ft_nav1"><a href="searchMatch.do"><img src="images/matching.png" width="40px" height="40px"></a></div>
			<div class="ft_nav2"><a href="<%=ft_nav2%>" class="<%=anim_class%>"><img src="images/status.png" width="40px" height="40px"></a></div>
			<div class="ft_nav3"><a href="<%=ft_nav3%>" class="<%=anim_class%>"><img src="images/teamInfo.png" width="40px" height="40px"></a></div>
			<div class="ft_nav4"><a href="faq.do"><img src="images/qna.png" width="40px" height="40px"></a></div>
		</div>
	</div>
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript' src='js/fluid_dg.min.js'></script>
	<script type='text/javascript' src='js/versus.js'></script>
	<script type='text/javascript'>
		
	function matchResult(match_num,result,teamCode){
		
		if(teamCode == null){
			alert("다시 로그인해주세요.");
			return;
		}
		
		$.ajax({
			type:'GET',
			url:"matchResult.ajax",
			data:{"match_num":match_num,"match_result":result,"teamCode":teamCode},
			datatype:"JSON",
			contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			success:function(obj){
				$(".mfp-close").trigger("click");
			}
		});
	}
	
	function acceptMatch(match_num,teamCode){
		location.href="acceptMatch.do?match_num=" + match_num + "&teamCode=" + teamCode;
	}
	</script>
</body>
</html>