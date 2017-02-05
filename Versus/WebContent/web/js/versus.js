$(window).load(function() {
	
	function fixBanBtnPadding(){
		var banheight = $('#ban').height();
		banheight += 20;
		$('.banner-bottom').css('padding-top',banheight);
	}
	
	$('#find_button').click(function(){
		$('.banner-bottom-login').slideToggle();
		setTimeout(function(){
			fixBanBtnPadding();
		},500);
	});
	
	var lastScroll=1;	//스크롤에 따른 검색창 보이고 숨기기
	$(window).scroll(function(event){
		var st = $(this).scrollTop();
		if(st>lastScroll){
			$('.banner-bottom-login').slideUp();
			setTimeout(function(){
				fixBanBtnPadding();
			},500);
		}else if(st<=lastScroll){
			$('.banner-bottom-login').slideDown();
			setTimeout(function(){
				fixBanBtnPadding();
			},500);
		}
		
		/* lastScroll = st; */
	});
	
	$('.bottom-status-left').click(function(){
		history.back();
	});
	
	$('.popup-with-zoom-anim').magnificPopup({
		type : 'inline',
		fixedContentPos : false,
		fixedBgPos : true,
		overflowY : 'auto',
		closeBtnInside : true,
		preloader : false,
		midClick : true,
		removalDelay : 300,
		mainClass : 'my-mfp-zoom-in'	
	});
	
	fixBanBtnPadding();
	
	$(window).resize(function(){
		fixBanBtnPadding();
	});

	$(".btn-nav").on("click tap",function() {
		$(".nav-container").toggleClass(
				"showNav hideNav")
				.removeClass("hidden");
		$(this).toggleClass("animated");
	});
	
	$(".nav-container").mouseleave(function(){					
			$(".nav-container").toggleClass("showNav hideNav");
			$(".btn-nav").toggleClass("animated");
	});
	
	$('#idCheck1').keyup(function(){
		$('#idCheckVal').val("");
		$('.signUpBtn').css('background','#ff0000');
	});
	
});

//가입하러가기 팀정보불러오기 에이잭스
$('.joinTeamA').click(function(){
	$.ajax({
		type:'GET',
		url:"joinTeam.ajax",
		datatype:"JSON",
		contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		success:function(obj){
			var data = JSON.parse(obj);
			$('#joinTeamTable').empty();
			$('#joinTeamTable').append('<tr><td>팀이름</td><td>주장</td><td>&nbsp;</td></tr>');
			
			for(var i in data){
				var str = "<tr><td><a href='#' onclick='joinInfo("+i+")' class='popup-with-zoom-anim'>"+data[i].team_name+"</a></td><td>"+data[i].leader_id+
				"</td><td><input type='button' value='가입신청' onclick='applyButton("+data[i].team_Code+")'></td></tr>"+				
					"<tr><td colspan='3'><table id='smallTeamInfo"+i+"' class='table table-condensed' style='display:none'>" +
					"<tr><td>리더ID</td><td>"+data[i].leader_id+"</td></tr>" + 
					"<tr><td>부리더ID</td><td>"+data[i].second_leader_id+"</td></tr>" + 
					"<tr><td>대표전화번호</td><td>"+data[i].phone+"</td></tr>" + 
					"<tr><td>주요경기지역</td><td>"+data[i].region+"</td></tr>" + 
					"<tr><td>유니폼</td><td>"+data[i].uniform+"</td></tr>" + 
					"<tr><td>Level</td><td>"+data[i].level+"</td></tr>" + 
					"<tr><td>승</td><td>"+data[i].win+"</td></tr>" + 
					"<tr><td>패</td><td>"+data[i].lose+"</td></tr>" + 
					"<tr><td>무승부</td><td>"+data[i].draw+"</td></tr>" + 
					"<tr><td>경고횟수</td><td>"+data[i].penalty+"</td></tr>" + 
					"</table><td><tr>";
				$('#joinTeamTable').append(str);
			}
		}
	});
});

function joinInfo(i){
	$('#smallTeamInfo'+i).toggle();
}

function applyButton(teamCode){
	$('#apply_teamCode').val(teamCode);
	$(applyTeamForm).submit();
}

function signUpSubmit(){
	if($('#idCheckVal').val()=='OK' && $('#pwCheckVal').val()=='OK'){
		$(vForm).submit();
	}
}


