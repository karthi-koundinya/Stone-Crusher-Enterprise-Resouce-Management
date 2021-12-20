$(document).ready(function(){
	$('#userID').focus();
	$('body').keyup(function(e){
        if (e.keyCode == 13) {
        	$('#login').trigger('click');
        }
        if($.trim($('#userID').val()).length > 0) {
        	$('#userID').popover('hide');
        }
        if($.trim($('#password').val()).length > 0) {
        	$('#password').popover('hide');
        }
    });	
	$('#login').click(function(){
		var userId = $('#userID').val();
		var password = $('#password').val();
		if(userId == "") {
			$('#userID').popover({
						placement:'right',
						content:'Please Provide User ID',
						delay: {show:500}
						});
			$('#userID').popover('show');
		} else if (password == "") {
			$('#password').popover({
						placement:'right',
						content:'Please Provide Password',
						delay: {show:500}
						});
			$('#password').popover('show');
		} else {
			var password = CryptoJS.SHA3(password);
 			var parms = {userID: userId,
 						 password: password.toString(),
 						 time: new Date()};
 			$("#loading").show();
			$.ajax({
				type: "POST",
				url: _contextPath + "/login.action",
				dataType:"json",
				data: parms,
				success: function(data) {
						//data = eval('('+data+')');
						var errorString = data.errorString;
						var resultString = data.resultString;
						if(resultString == "error") {
							$("#loading").hide();
							alert(errorString);
							return;
						} else {
							window.location.href = "mainframe.action";
						}
				}
 			});
 		}
	});
	/*$('#userID').click(function(){
		$('#userID').popover('hide');
	});
	$('#password').click(function(){
		$('#password').popover('hide');
	});*/
});