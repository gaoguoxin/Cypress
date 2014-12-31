$(->
	$('.customer_form a.btn-primary').click(->
		name    = $.trim($('#customer_username').val())
		address = $.trim($('#customer_address').val())

		if (name.length > 0 && address.length > 0)
			$('.customer_form').submit() 
	)

	$('.customer_form .my-dropdown li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('value')
		$('#customer_status').val(value)
	)
)