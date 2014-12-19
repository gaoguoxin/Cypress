$(->
	$('#summernote').summernote();
	$('.journalism_form a.btn-primary').click(->
		title   = $('#admin_journalism_title').val()
		content = $('.journalism_form #summernote').code()

		if (title.length > 0 && content.length > 0)
			$('#admin_journalism_content').text(content)
			$('.journalism_form').submit() 
	)

	$('.journalism_form .my-dropdown li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('value')
		$('#admin_journalism_status').val(value)
	)
)
