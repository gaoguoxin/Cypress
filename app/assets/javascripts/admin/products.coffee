$(->
	$('#sproduct_customer_id').multiselect();
	$('.product_form li').click(->
		button = $(this).parents('ul').siblings('button').find('span.opt')
		button.text($(this).text())
		value  = $(this).data('category')
		$('#product_category_id').val(value)
	) 

	$("#product_mtime" ).datepicker({dateFormat: "yy-mm-dd"})   

	$('.product_form a.btn').click(->
		str = ''
		$('ul.multiselect-container input:checked').map(()->
			str += $(@).val() + ','
		)

		$('#product_customer_id').val(str)
		$('.product_form').submit() 
	)





)