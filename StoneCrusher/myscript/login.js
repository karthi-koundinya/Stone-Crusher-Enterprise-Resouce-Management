$(document).ready(function(){
	$("#login").click(function(){
		var name= $("#userID").val();
		var psw = $("#password").val();
		
		var parms = {
				username : name,
				password : psw
		}
		
		$.ajax({
			url : "login.action",
			method : "GET",
			dataType : "json",
			data : parms,
			success: function(data){
				var result = data.resultData;
				
					if(result == "success"){
						window.location.href="home.action";
					}
					else{
						alert(result);
					}
			}
		});
	});
});