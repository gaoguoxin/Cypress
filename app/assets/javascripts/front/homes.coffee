$(->
	$(".social li").find("a").css({opacity:0.6})
	$(".social li a").hover(
		->
			$(this).stop().animate({opacity:1 }, 400, 'easeOutExpo')    
		->
			$(this).stop().animate({opacity:0.6 }, 400, 'easeOutExpo' )
	)
	$('#camera_wrap').camera({
		autoAdvance			: true,		
		mobileAutoAdvance	: true,
		height: '37%',
		hover: false,
		loader: 'none',
		navigation: false,
		navigationHover: false,
		mobileNavHover: false,
		playPause: false,
		pauseOnClick: false,
		pagination			: true,
		time: 7000,
		transPeriod: 1000,
		minHeight: '300px'
	})

)
