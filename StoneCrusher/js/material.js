$(document).ready(function(){
	
	var number = 1 + Math.floor(Math.random() * 10000);
	
	$("#cid").val(number).css('color','red');
	
	$(".table").on('keyup','tr td input.amt',function(){
		
		
	var qua =  $(this).closest('tr').find('td').find('input.quantity').val();
	
	var amt =  $(this).closest('tr').find('td').find('input.amt').val();

		var quantity = parseFloat(qua);
		var amountind = parseFloat(amt);
		var ptotal = quantity*amountind;
	
		$(this).closest('tr').find('td').find('input.amount').val(ptotal);
		
		checkAmount();
		
	});
	
	
	checkAmount = function(){
		var totalAmount = 0;
	
		var kilo = $("#kiloe").val();
		 kilometer = (25*parseInt(kilo));
		jQuery('tbody').find(".amount").each(function(){
			var amount = $(this).val();
			amount = $.trim(amount).length == 0? 0 : parseFloat(amount);
			totalAmount += amount; 
		});
		totalAmount +=kilometer;
		$("#totalAmount").val(totalAmount);
		
	}
	
});