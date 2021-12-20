/**
 * 
 */
$(document).ready(function(){
	$("#checkOutModal").modal('show');
	$("li.active").removeClass('active');
	$("li.checkOut").addClass('active');
	$("#phoneNumber").focus();
	$("#SearchCheckOut").click(function(){
		if(validateFields("#booking-div", 'top', -1)) {
			$("#loading").show();
			var parms = {invoiceNumber: $("#invoiceNumber").val(), Time: (new Date()).getTime()};
			$.ajax({
				url: "searchCheckout.action",
				method: "get",
				dataType:"json",
				data: parms,
				success: function(data) {
						var errorString = data.errorString;
						var resultString = data.resultString;
						if(resultString == "error") {
							$("#loading").hide();
							if(errorString.substring(errorString.length-2) == "ST") {
								alert(errorString.substring(0, errorString.length-2));
								window.location.href = "logout.action";
								return;
							} else {
								alert(errorString);
							}
							return;
						} else {
							if(data.isEmpty == "true") {
								$("#loading").hide();
								alert("Invalid Invoice Number");
							} else {
								$("#checkOutModal").modal('hide');
								var address = _contextPath + "/jsp/checkoutinfo.jsp?Time="+ (new Date()).getTime();
								$.ajax({
									url: address,
									success: function(html){
										$('#workarea').html(html);
										$("#workarea").show();
										$("#loading").hide();
										$("#paingAmount").focus();
										
										$('#datetimepicker').datetimepicker({
									        format: 'dd/MM/yyyy hh:mm'
									    });
										$(".accordion-toggle").click(function(){
											if($(this).find("i").hasClass('icon-calendar')) {
												$(this).next('li').css('height', '0').hide();
												$(this).prev('li').css('height', 'auto').show();
												$(this).find("i").removeClass('icon-calendar').addClass('icon-time');
											} else {
												$(this).prev('li').css('height','0').hide();
												$(this).next('li').css('height', 'auto').show();
												$(this).find("i").removeClass('icon-time').addClass('icon-calendar');
											}
										});
										
										$("#checkOut").click(function(){
											$("#loading").show();
											var parms = {invoiceNumber: $("#bookingId").val(),
														 checkOutDateTime: $("#checkOutDateTime").val(),
														 checkOutFlag : 1,
														 paingAmount: $("#paingAmount").val(),
														 Time: (new Date()).getTime()};
											$.ajax({
												url: "checkOutBooking.action",
												method: "get",
												dataType:"json",
												data: parms,
												success: function(data) {
														var errorString = data.errorString;
														var resultString = data.resultString;
														if(resultString == "error") {
															$("#loading").hide();
															if(errorString.substring(errorString.length-2) == "ST") {
																alert(errorString.substring(0, errorString.length-2));
																window.location.href = "logout.action";
																return;
															} else {
																alert(errorString);
															}
															return;
														} else {
															$("#loading").hide();
															alert("Checkout done successfully.");
															printPopUp("printReceipt");
															setTimeout(function(){ window.location.href = "mainframe.action"; }, 4000);
														}
													}
												});
										});
									},
									async: false
								});
							}
						}
					}
				});
		}
	});
});