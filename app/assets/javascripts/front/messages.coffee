$(->
	$('#ajax-contact-form a.btn').click((e)->
		username = $.trim($('#username').val())
		email    = $.trim($('#email').val())
		phone    = $.trim($('#phone').val())
		content  = $.trim($('#message').val())
		if username.length > 0 && phone.length > 0 && content.length > 0 
			$.post('/messages',{username:username,email:email,phone:phone,content:content},(data)->
				window.location.reload()
			)
	)
)