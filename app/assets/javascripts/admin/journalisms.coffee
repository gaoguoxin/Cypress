$(->
	$("#admin_journalism_image").fileinput({showUpload: false})
	# $('#summernote').summernote();
	#$('#admin_journalism_content').ckeditor()
	$('.journalism_form a.btn-primary').click(->
		title   = $('#admin_journalism_title').val()
		if (title.length > 0 )
			$('.journalism_form').submit() 
	)

	$('.journalism_form .my-dropdown li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('value')
		$('#admin_journalism_status').val(value)
	)
)

