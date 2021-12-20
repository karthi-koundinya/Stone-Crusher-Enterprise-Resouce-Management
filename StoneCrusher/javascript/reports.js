$(document).ready(function(){
	customizeItems($("#allocatedReport"));
	$("li.active").removeClass('active');
	$("li.report").addClass('active');

	$("#allocatedReport").on ("click", ".removeRoom", function(){
		if(confirm("Do you want to delete the transaction?")) {
			var $tr = $(this).closest('tr');
			var parms = {invoiceNumber: $tr.attr('data-bookingId'),
					 	checkOutDateTime: $("#checkOutDateTime").val(),
					 	checkOutFlag : 2,
					 	paingAmount: 0,
					 	Time: (new Date()).getTime()};
			$.ajax({
				url: "checkOutBooking.action",
				method: "get",
				dataType:"json",
				data: parms,
				success: function(data){
					$("#loading").hide();
					var errorString = data.errorString;
					var resultString = data.resultString;
					if(resultString == "error") {
						if(errorString.substring(errorString.length-2) == "ST") {
							alert(errorString.substring(0, errorString.length-2));
							window.location.href = "logout.action";
							return;
						} else {
							alert(errorString);
						}
						return;
					} else {
						alert("Booking Info removed successfully");
				 		window.location.href = "reports.action";
					}
				}
			});
		}
	});
});