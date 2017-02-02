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
<link href="https://fonts.googleapis.com/css?family=Lora" rel="stylesheet"> 	
<!-- //web-fonts -->
<!--  -->

</head>
<body class="bg">
<%!
String ft_nav2="matchstatus.jsp";
String ft_nav3="info.jsp";
String anim_class="";
%>
	<jsp:include page="login.jsp" flush="true"/>
	<jsp:include page="maketeam.jsp" flush="true"/>
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
			<div class="bottom-status-center"><div class="tinfo-center-con"><div class="con-cell"><b>FAQ &amp; REPORT</b></div></div></div>
			<div class="bottom-status-right"></div>
		</div>
		<p class="faq-p">FAQ</p>
		<div id="faq-div">
			<c:forEach items="${FAQList}" var="FaqDto" varStatus="VarStatus">
			<a href="#faq_list${VarStatus.count}" class="popup-with-zoom-anim">
				<div class="faq-list">
					<span class="faq_count" style="border:1px solid gray;">${VarStatus.count}</span>
					<span class="faq_title" style="border:1px solid gray;">${FaqDto.faq_title}</span>
				</div>
			</a>
			<div id="faq_list${VarStatus.count}" class="faqModal mfp-hide w3ls_small_dialog">
				<h2>FAQ ${VarStatus.count}</h2>
				<p>제목: ${FaqDto.faq_title}</p>
				<p>내용: ${FaqDto.faq_content}</p>
			</div>
			</c:forEach>
		</div>
		<p class="faq-p">신고하기</p>
		<div id="report-div">
			<form action="report.do" method="post">
				<span>팀이름: </span><input type="text" name="report-teamname">
				<%if(session.getAttribute("memberInfo")==null){%>
					<a href="#make-team" class="popup-with-zoom-anim">
						<input type="button" value="신고">
					</a>
				<%}else if(session.getAttribute("memberInfo")!=null){%>
					<input type="submit" value="신고">
				<%}%>
				<p>신고사유</p>
				<textarea id="report-reason" rows="6" cols="40" 
				placeholder="아래 내용을 함께 보내주시면 더욱 빨리 처리가 가능합니다.
-팀이름: 피신고인 팀이름 
-신고게시물NO: 신고게시물의 번호 
-신고사유: 정확한 사유를 기입해주시면, 더욱 빠른 처리가 가능합니다.
(*허위 신고 시 신고인과 신고팀에게 패널티가 적용됩니다.)" style="resize:none;"></textarea>
			</form>
		</div>
		
		<div class="footer_nav">
		<%if(session.getAttribute("memberInfo")==null){
			ft_nav2="#make-team";
			ft_nav3="#make-team";
			anim_class="popup-with-zoom-anim";
		}else if(session.getAttribute("memberInfo")!=null){
			ft_nav2="matchStatus.do?teamCode="+session.getAttribute("teamCode");
			ft_nav3="info.jsp";
			anim_class="";
		}%>
			<!-- <div class="ft_con"> -->
				<div class="ft_nav1"><a href="searchMatch.do"><img src="images/matching.png" width="40px" height="40px"></a></div>
				<div class="ft_nav2"><a href="<%=ft_nav2%>" class="<%=anim_class%>"><img src="images/status.png" width="40px" height="40px"></a></div>
				<div class="ft_nav3"><a href="<%=ft_nav3%>" class="<%=anim_class%>"><img src="images/teamInfo.png" width="40px" height="40px"></a></div>
				<div class="ft_nav4"><a href="faq.do"><img src="images/qna.png" width="40px" height="40px"></a></div>
			<!-- </div> -->
		</div>
	</div>
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript' src='js/fluid_dg.min.js'></script>
	<script type='text/javascript' src='js/versus.js'></script>
	<script type='text/javascript'>
		$(function(){
			$(window).resize(function(){
				reportReasonResise();
			});
		});
		
		function reportReasonResise(){
			var reportDivWidth = $('#report-div').width();
			var taCols = reportDivWidth/8 ;
			$('#report-reason').attr("cols",taCols);
		}
	</script>
</body>
</html>