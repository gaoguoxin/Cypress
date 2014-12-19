$(->
	$("#admin_product_image").fileinput({showUpload: false})
	$('#product_summernote').summernote();

	$('.product_form a.btn-primary').click(->
		title   = $('#admin_product_name').val()
		content = $('.product_form #product_summernote').code()

		if (title.length > 0 && content.length > 0)
			$('#admin_product_description').text(content)
			$('.product_form').submit() 
	)

	$('.product_form .my-dropdown li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('category')
		$('#admin_product_category_id').val(value)
	)



)