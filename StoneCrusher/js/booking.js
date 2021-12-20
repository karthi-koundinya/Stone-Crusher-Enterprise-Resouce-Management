/**
 * 
 */
$(document).ready(function(){
	$('#datetimepicker1').datetimepicker({
        format: 'yyyy-MM-dd'
    });
	$('#datetimepicker2').datetimepicker({
		 format: 'yyyy-MM-dd'
    });

	$("li.active").removeClass('active');
	$("li.booking").addClass('active');
	var idType = $("#idType").attr('data-idType');
	if(idType != null) {
		$("#idType").val(idType);
		
		if(jQuery('#roomType').find(".removeRoom").length > 1) {
			jQuery('#roomType').find(".removeRoom").show();
		}
	}
	if($("#print").length > 0) {
		printPopUp("printReceipt");
	}
	jQuery('#roomType').on("click", ".removeRoom", function(){
		 $(this).closest('tr').remove();
		 if($("#roomType tbody tr").length == 1) {
			 $("#roomType tbody tr:first .removeRoom").addClass('displayNone');
		 }
		 $("#roomType tbody tr").each(function(i, e){
			 $(this).children('td:first').text(i+1);
		 });
	 }).on("keypress", ".roomType", function(){
		 var amount = parseInt($(this).find('option:selected').attr("data-amount"));
		 var noOfRooms = $(this).closest('tr').find('.noOfRooms').val();
		 noOfRooms = $.trim(noOfRooms).length == 0? 0 : parseInt(noOfRooms);
		 var noOfDays = $(this).closest('tr').find('.noOfDays').val();
		 noOfDays = $.trim(noOfDays).length == 0? 0 : parseInt(noOfDays);
		 amount = amount * noOfRooms * noOfDays;
		 $(this).closest('tr').find('.amount').val(amount);
		 calculateTotalAmount();
	 }).on("keyup", ".noOfRooms, .noOfDays", function(){
		 $(this).closest('tr').find(".roomType").trigger('change');
	 });
	 $("#extraAmount, #discount, #tax").keyup(function(){
		 calculateTotalAmount();
	 });
	 
	 $("#advance").keyup(function(){
		 alert("k");
		 var advance = $("#advance").val();
		 advance = $.trim(advance).length == 0? 0 : parseFloat(advance);
		 var totalAmount = $("#totalAmount").val();
		 totalAmount = $.trim(totalAmount).length == 0? 0 : parseFloat(totalAmount);
		 $("#balanceAmount").val(totalAmount - advance);
	 });
	
	 $("#addRoomType").click(function(){
		 $("#roomType tbody tr:first .removeRoom").removeClass('displayNone');
		 var tr = $("#roomType tbody tr:last").clone();
		 tr.find('.removeRoom').removeClass('displayNone');
		 tr.find('select, input').val('');
		 tr.children('td:first').text($("#roomType tbody tr").length+1);
		 $("#roomType tbody").append(tr);
	 });
	 
	
});

calculateTotalAmount = function() {
	
	var totalAmount = 0;
	jQuery('#roomType').find(".amount").each(function(){
		var amount = $(this).val();
		amount = $.trim(amount).length == 0? 0 : parseFloat(amount);
		totalAmount += amount; 
	});
	$("#roomAmount").val(totalAmount);
	var extraAmount = $("#extraAmount").val();
	extraAmount = $.trim(extraAmount).length == 0? 0 : parseFloat(extraAmount);
	
	var discount = $("#discount").val();
	discount = $.trim(discount).length == 0? 0 : parseFloat(discount);
	
	totalAmount = totalAmount + extraAmount - discount;
	
	var tax = $("#tax").val();
	tax = $.trim(tax).length == 0? 0 : parseFloat(tax);	
	
	totalAmount = ((totalAmount * tax)/100) + totalAmount; 
	totalAmount = Math.round(totalAmount);
	$("#totalAmount").val(totalAmount);
	$("#advance").trigger('keyup');
}