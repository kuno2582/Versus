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
	
});
