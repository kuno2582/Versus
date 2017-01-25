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
<!-- //web-fonts -->

</head>
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
				<li><a href="#small-dialog"
					class="play-icon popup-with-zoom-anim"><img
						src="images/login.png" width="35px" height="35px"></a></li>
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
			<div class="status-list">
				<div class="progress_circle progress_red"></div>
				<span>vs</span><span>정환</span>
				<span class="status-place">수원 성남</span>
				<span>16/12/10</span>
			
			</div>
			<div class="status-list">
				<div class="progress_circle progress_red"></div>
				<span>vs</span><span>윤호</span>
				<span class="status-place">중구 신당동 기린아파트 202호</span>
				<span>16/12/15</span>
			
			</div>
		</div>
		<p class="status-ing-p">매칭 진행중</p>
		<div id="status-ing">
			<div class="status-list">
				<div class="progress_circle progress_green"></div>
				<span>vs</span><span>성만</span>
				<span class="status-place">스페인 마드리드</span>
				<span>16/12/19</span>
			
			</div>
		</div>
		<p class="status-fail-p">매칭 실패</p>
		<div id="status-fail">
			<div class="status-list">
				<div class="progress_circle progress_gray"></div>
				<span>vs</span><span>재훈</span>
				<span class="status-place">경기도 범계</span>
				<span>16/12/14</span>
			
			</div>
		</div>
		
		<div class="footer_nav">
			<!-- <div class="ft_con"> -->
				<div class="ft_nav1"><a href="main.jsp"><img src="images/matching.png" width="40px" height="40px"></a></div>
				<div class="ft_nav2"><a href="matchstatus.jsp"><img src="images/status.png" width="40px" height="40px"></a></div>
				<div class="ft_nav3"><a href="info.jsp"><img src="images/teamInfo.png" width="40px" height="40px"></a></div>
				<div class="ft_nav4"><a href="faq.jsp"><img src="images/qna.png" width="40px" height="40px"></a></div>
			<!-- </div> -->
		</div>
	</div>
	<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
	<script type='text/javascript' src='js/fluid_dg.min.js'></script>
	<script type='text/javascript' src='js/versus.js'></script>
	
</body>
</html>