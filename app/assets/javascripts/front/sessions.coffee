$(->
	$('.session form a').click((e)->
		
		mobile   = $.trim($('#mobile').val())
		password = $.trim($('#password').val())
		if mobile.length > 0 && password.length > 0
			$.post('/sessions/login',{mobile:mobile,password:password},(data)->
				if data.success
					window.location.href = '/admin/journalisms/new'
				else
					$('h4.form-signin-heading').text('用户名或密码错误')
					
			)

		e.preventDefault()
	)
)