$(document).ready(function(){
		alert("welcome");
		$("#mid").change(function(){
		
			
			var Mid = $("#mid").val();
			var Amount = $("#amont").val();
			alert(Mid);
			
			var mydata = {
					eid : EID,
					ename:Empname
			}
	
	 		 $.ajax({
					url:"GetEname.action",
					method : "get",
					dataType: "json",
					data: mydata,
	 		        success:function(data){
	 		        	var result = JSON.parse(data.GetDetails);
	 		        	
	 		        	$("#Ename").val(result[0].ename);
	 		        	
	 		        }
				
						
				  });  
	      });
    });
	
