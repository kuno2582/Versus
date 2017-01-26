$(window).load(function() {
	
	$('#id_check').click(function(){
		var id_check = $('#idCheck1').val();
		$.ajax({
			type:'GET',
			url:"signUpCheck.ajax",
			data:{"id":id_check},
			contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
			success:function(data){
				if(data){
					alert("이미 있는 아이디");
				}else{
					alert("없는 아이디");
				}
			}
		});
	});
	
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
	
	/*$.ajax({
		type:"post",
		url:"searchMatch.do",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data:{
			region1 : searchMatchForm.region1.value,
			region2 : searchMatchForm.region2.value,
			search_month : searchMatchForm.search_month.value,
			search_day : searchMatchForm.search_day.value,
			time1 : searchMatchForm.time1.value,
			time2 : searchMatchForm.time2.value
		},
		datatype:"json",
		success:function(){
			firstLoad = false;
			location.href="main.jsp";
		},
		fail:function(){
			alert('실패');
		}
	});*/
	
});

