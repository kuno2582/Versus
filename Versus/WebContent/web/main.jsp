<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.versus.dto.InputMemberInfoDto"%>
<%@ page import="com.versus.dto.MatchDto"%>
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
<!-- �������� api -->
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
<%!
	InputMemberInfoDto dto;
	MatchDto match_dtos;
	String id;
	String nickName;
	int teamCode;
%>
<%
	if(request.getAttribute("memberInfo")!= null){
		session.setAttribute("memberInfo",request.getAttribute("memberInfo"));
		dto = (InputMemberInfoDto)request.getAttribute("memberInfo") ;
		teamCode = dto.getTeamCode();
		session.setAttribute("teamCode",teamCode);
		nickName = dto.getNickName();
		session.setAttribute("nickName",nickName);
		id = dto.getId();
		session.setAttribute("id",id);
		System.out.println("�α����� ���ǿ� ���� ����!");
	}
	if(request.getAttribute("logout") != null){
		if((String)request.getAttribute("logout") == "logout"){
			session.setAttribute("memberInfo",null);
			System.out.println("������ ���� ����");
		}
	}
%>
<body class="bg">
	<jsp:include page="login.jsp" flush="true"/>
	<jsp:include page="maketeam.jsp" flush="true"/>
	<jsp:include page="makematch.jsp" flush="true"/>
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
						<div class="info_id"><a href="logout.do?nowPage=main.jsp">${memberInfo.id}</a></div>
						<!-- <img src="images/close.png" width="30px" height="30px"> -->
					</li>
				<%}%>
			</ul>
		</div>
		<div class="clearfix"></div>
		<div class="banner-bottom-login">
			<div class="w3agile_banner_btom_login">
				<form action="searchMatch.do" method="post">
					<div class="w3agile__text w3agile_banner_btom_login_left city">
						<h4>����</h4>
						<select class="frm-field required country choice_region1" name="region1">
							<option value="">����</option><option value="����">����</option><option value="���">���</option>
							<option value="��õ">��õ</option><option value="����">����</option><option value="����">����</option>
							<option value="���">���</option><option value="�泲">�泲</option><option value="�뱸">�뱸</option>
							<option value="����">����</option><option value="���">���</option><option value="�泲">�泲</option>
							<option value="���">���</option><option value="����">����</option><option value="����">����</option>
							<option value="����">����</option>
						</select>
					</div>
					<div class="w3agile__text w3agile_banner_btom_login_left city city2">
						<h4>����2</h4>
						<select class="frm-field required country choice_region2" name="region2">
							<option value="">����</option>
						</select>
					</div>
					<div class="w3agile__text w3agile_banner_btom_login_left2">
						<h4>��¥</h4>
						<select name="search_month" class="selOpt">
							<option value="">��</option><option value="1">1</option><option value="2">2</option>
							<option value="3">3</option><option value="4">4</option><option value="5">5</option>
							<option value="6">6</option><option value="7">7</option><option value="8">8</option>
							<option value="9">9</option><option value="10">10</option><option value="11">11</option>
							<option value="12">12</option>
						</select>
						<select name="search_day" class="selOpt">
							<option value="">��</option><option value="1">1</option><option value="2">2</option>
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
						<h4>�ð�</h4>
						<select id="country1" class="frm-field required time1" name="time1">
							<option value="">��</option><option value="00">00</option><option value="01">01</option>
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
							<option value="">��</option><option value="00">00</option><option value="01">01</option>
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
				<h2>��� ����</h2>
				<div class="modal-body agileits_modal_body">
				<form action="#">
					<span class="teamdata" id="teamdata_name">���̸� : </span><span class="teamdata" id="teamdata_name1">${MatchDto.team_name}</span><br>
					<span class="teamdata" id="teamdata_place">��� : </span><span class="teamdata" id="teamdata_place1">${MatchDto.match_region}</span><br>
					<span class="teamdata" id="teamdata_date">�Ͻ� : </span><span class="teamdata" id="teamdata_date1">
						<c:forTokens var="HM" items="${MatchDto.match_date}" delims=":" begin="0" end="1" varStatus="status">
							${HM}<c:if test="${status.count == 1}"> :</c:if>
						</c:forTokens>
					</span><br>
					<span class="teamdata" id="teamdata_level">������ : </span><span class="teamdata" id="teamdata_level1">Lv ${MatchDto.level}, ${MatchDto.win}�� ${MatchDto.lose}�� ${MatchDto.draw}��, 
						���Ƚ��: ${MatchDto.penalty}</span><br>
					<span class="teamdata" id="teamdata_phone">����ó : </span><span class="teamdata" id="teamdata_phone1">${MatchDto.match_phone}</span><br>
					<span class="teamdata" id="teamdata_uniform">���������� : </span><span class="teamdata" id="teamdata_uniform1">${MatchDto.uniform}</span><br>
					<div class="teamdata_con">
						<c:choose>
							<c:when test="${MatchDto.shower == '1'}"><input type="checkbox" disabled value="shower">������</c:when>
							<c:otherwise><input type="checkbox" disabled value="shower" checked>������</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.parking == '1'}"><input type="checkbox" disabled value="parking">������</c:when>
							<c:otherwise><input type="checkbox" disabled value="parking" checked>������</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.neon == '1'}"><input type="checkbox" disabled value="neon">������</c:when>
							<c:otherwise><input type="checkbox" disabled value="neon" checked>������</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${MatchDto.whistle == '1'}"><input type="checkbox" disabled value="whistle">ȣ����</c:when>
							<c:otherwise><input type="checkbox" disabled value="whistle" checked>ȣ����</c:otherwise>
						</c:choose>
					</div>
					<span>- ������ -</span><br>
					<span id="teamdata_more">${MatchDto.more_info}</span>
					<div class="teamdata_con">
						<div id="teamdata_map">
						</div>
					</div>
					<%if((session.getAttribute("memberInfo")==null)||((Integer)session.getAttribute("teamCode")==0)){
						%><a href="#make_match" class="apply_error popup-with-zoom-anim">��û�ϱ�</a><%
					}else{
						%><input type="submit" value="��û�ϱ�"><%
					} %> 
					<c:forEach items="${matchComment}" var="Comment">
						
						<table id="commentTable" class="table table-condensed"></table>
					</c:forEach>
				</form>
				</div>
			</div>
		</c:forEach>
	</div>
		<!-- ��� ���� -->
		<!-- ��� ����� -->
		<div class="footer_nav">
			<!-- <div class="ft_con"> -->
				<div class="ft_nav1"><a href="main.jsp"><img src="images/matching.png" width="40px" height="40px"></a></div>
				<div class="ft_nav2"><a href="matchstatus.jsp"><img src="images/status.png" width="40px" height="40px"></a></div>
				<div class="ft_nav3"><a href="info.jsp"><img src="images/teamInfo.png" width="40px" height="40px"></a></div>
				<div class="ft_nav4"><a href="faq.jsp"><img src="images/qna.png" width="40px" height="40px"></a></div>
			<!-- </div> -->
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
	<script type='text/javascript' src='js/versus.js'></script>
	<!-- //banner -->
	<!-- nav -->
	<script type="text/javascript">
	//������ �˻��ɼ� �̺�Ʈ
	$(function(){
		
		var seoul = ["������","������","���ϱ�","������","���Ǳ�","������","���α�","��õ��","�����",
					"������","���빮��","���۱�","������","���빮��","���ʱ�","������","���ϱ�","���ı�","��õ��",
					"��������","��걸","����","���α�","�߱�","�߶���"];
		var keongki = ["����", "�����", "��õ��", "������", "���ֽ�", "������", "������", "������",
						"������", "����õ", "��õ��", "������", "������", "�����", "�Ȼ��", "�ȼ���",
						"�Ⱦ��", "���ֽ�", "����", "���ֱ�", "��õ��", "�����", "���ν�", "�ǿս�",
						"������", "��õ��", "���ֽ�", "���ý�", "��õ��", "�ϳ���", "ȭ����"];
		var incheon = ["��ȭ��","��籸", "����","������", "����","����", "����","������", "������", "�߱�"];
		var gangwon = ["������","������","���ؽ�","��ô��","���ʽ�","�籸��","��籺","������","���ֽ�","������",
						"������","ö����","��õ��","�¹��","��â��","ȫõ��","ȭõ��","Ⱦ����"];
		var keongbuk = ["����", "���ֽ�", "���ɱ�", "���̽�", "������", 
						"��õ��", "�����", "��ȭ��", "���ֽ�", "���ֱ�", 
						"�ȵ���", "������", "���籺", "���ֽ�", "��õ��", 
						"��õ��", "�︪��", "������", "�Ǽ���", "û����", 
						"û�۱�", "ĥ�", "���׽�"];
		var keongnam = ["������", "��â��", "������", "���ؽ�", 
						"���ر�", "�����", "�о��", "��õ��",
						"��û��", "����", "�Ƿɱ�", "���ֽ�", 
						"���ؽ�", "â�ⱺ", "â����", "�뿵��",
						"�ϵ���", "�Ծȱ�", "�Ծ籺", "��õ��"];
		var gwangju = ["���걸", "����","����","�ϱ�","���ʱ�"];
		var daegu = ["����","�޼���","�޼���", "����","�ϱ�","����","������", "�߱�"];
		var daejeon = ["�����", "����","����","������", "�߱�"];
		var busan = ["������", "������", "���屺", "����",
					"����", "������", "�λ�����", "�ϱ�", 
					"���", "���ϱ�", "����", "������", 
					"������", "������", "�߱�", "�ؿ��"];
		var ulsan = ["�߱�","����", "����","�ϱ�","���ֱ�"];
		var jeonnam = ["������", "���ﱺ", "���", "�����", 
						"���ʱ�", "���ֽ�", "��籺", "������", 
						"���ȱ�", "������", "��õ��", "�žȱ�", 
						"������", "������", "���ϱ�", "�ϵ���", 
						"������", "���ﱺ", "������", "����", 
						"�س���", "ȭ����"];
		var jeonbuk = ["��â��", "�����", "������", "������", 
						"���ֱ�", "�ξȱ�", "������", "���ֱ�", 
						"�ͻ��", "�ӽǱ�", "�����", "���ֽ�", 
						"������", "���ȱ�"];
		var jeju = ["��������", "���ֽ�"];
		var chungnam = ["���ֽ�", "�ݻ걺", "�����", "������",
						"���ɽ�", "�ο���", "�����", "��õ��",
						"�ƻ��", "���ⱺ", "���걺", "õ�Ƚ�", 
						"û�籺", "�¾ȱ�", "ȫ����", "����"];
		var chungbuk = ["���걺", "�ܾ籺", "������", "������", 
						"��õ��", "������", "��õ��", "��õ��", 
						"â����", "û�ֽ�", "���ֽ�", "����"];
		
		
		
		$('.choice_region1').on("change", function(){
			var region = $(this).val();
			$('.choice_region2').empty();
			$('.choice_region2').append('<option value="">����</option>');
			switch(region){
				case "����":
					for(i=0; i<seoul.length; i++){
						$('.choice_region2').append('<option value='+seoul[i]+'>' + seoul[i] + '</option>');
					}
					break;
				case "���":
					for(i=0; i<keongki.length; i++){
						$('.choice_region2').append('<option value='+keongki[i]+'>' + keongki[i] + '</option>');
					}
					break;
				case "��õ":
					for(i=0; i<incheon.length; i++){
						$('.choice_region2').append('<option value='+incheon[i]+'>' + incheon[i] + '</option>');
					}
					break;
				case "����":
					for(i=0; i<gangwon.length; i++){
						$('.choice_region2').append('<option value='+gangwon[i]+'>' + gangwon[i] + '</option>');
					}
					break;
				case "����":
					for(i=0; i<gwangju.length; i++){
						$('.choice_region2').append('<option value='+gwangju[i]+'>' + gwangju[i] + '</option>');
					}
					break;
				case "���":
					for(i=0; i<chungbuk.length; i++){
						$('.choice_region2').append('<option value='+chungbuk[i]+'>' + chungbuk[i] + '</option>');
					}
					break;
				case "�泲":
					for(i=0; i<chungnam.length; i++){
						$('.choice_region2').append('<option value='+chungnam[i]+'>' + chungnam[i] + '</option>');
					}
					break;
				case "�뱸":
					for(i=0; i<daegu.length; i++){
						$('.choice_region2').append('<option value='+daegu[i]+'>' + daegu[i] + '</option>');
					}
					break;
				case "����":
					for(i=0; i<daejeon.length; i++){
						$('.choice_region2').append('<option value='+daejeon[i]+'>' + daejeon[i] + '</option>');
					}
					break;
				case "���":
					for(i=0; i<keongbuk.length; i++){
						$('.choice_region2').append('<option value='+keongbuk[i]+'>' + keongbuk[i] + '</option>');
					}
					break;
				case "�泲":
					for(i=0; i<keongnam.length; i++){
						$('.choice_region2').append('<option value='+keongnam[i]+'>' + keongnam[i] + '</option>');
					}
					break;
				case "���":
					for(i=0; i<ulsan.length; i++){
						$('.choice_region2').append('<option value='+ulsan[i]+'>' + ulsan[i] + '</option>');
					}
					break;
				case "����":
					for(i=0; i<jeonbuk.length; i++){
						$('.choice_region2').append('<option value='+jeonbuk[i]+'>' + jeonbuk[i] + '</option>');
					}
					break;
				case "����":
					for(i=0; i<jeonnam.length; i++){
						$('.choice_region2').append('<option value='+jeonnam[i]+'>' + jeonnam[i] + '</option>');
					}
					break;
				case "����":
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