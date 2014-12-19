$(->
	$('.admin_category a.btn-primary').click(->
		title   = $.trim($('#admin_category_name').val())
		if (title.length > 0 )
			$('.admin_category').submit() 
	)

	$('.admin_category .my-dropdown li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('value')
		$('#admin_journalism_status').val(value)
	)
)