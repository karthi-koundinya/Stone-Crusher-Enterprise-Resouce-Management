displayRoomPage = function() {
	$("#loading").show();
	$.ajax({
		url: "getRoomList.action",
		method: "get",
		dataType:"json",
		success: function(data){
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
				var address = _contextPath + "/jsp/addRoom.jsp?Time="+ (new Date()).getTime();
				$.ajax({
					url: address,
					success: function(html){
						$('#workarea').html(html);
						
						customizeItems($("#roomInfoTable"));
						$("#addRoomType").click(function(){
							$("#addRoom").find('input, textarea').val('');
							$("#SaveRoom").attr('data-id',"addRoom");
							//$("#NewGodown").modal('show');		
						});
						
						
						$("#SaveRoom").click(function(){
							if(validateFields("#addRoom", 'top', -1)) {
								$("#loading").show();
								var from = $(this).attr('data-id');
								var parms = {roomType: $("#roomType").val(), noOfPersons: $("#noOfPersons").val(), 
										amountPerDay: $("#amount").val(), totalRooms: $("#totalRooms").val(), time: (new Date()).getTime()};
								var url = "addRoom.action";
								if(from == "updateRoom") {
									url = "updateRoom.action";
									parms["id"] = $("#roomType").attr('data-id');
									//parms["oldGodownName"] = $("#godownName").attr('data-value');
								}
								$.ajax({
									url: url,
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
											$("#addRoom").modal('hide');
											if($("#SaveRoom").attr('data-id') == "updateRoom") {
												alert("Room Info updated successfully");
											} else {
												alert("Room Info added successfully");
											}
											displayRoomPage();
										}
									}
								});
							}
						});
						
						$("#roomInfoTable").on ("click", ".removeRoom", function(){
							var $tr = $(this).closest('tr');
							var parms = {id: $tr.attr('data-id'), time: (new Date()).getTime()};
							$.ajax({
								url: "deleteRoom.action",
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
										alert("Room Info removed successfully");
										displayRoomPage();
									}
								}
							});
						});
						
						$("#loading").hide();
					},
					async: false
				});	
			}
		}
	});
}

displayUserPage = function() {
	$("#loading").show();
	$.ajax({
		url: 'userList.action',
		method: "get",
		dataType:"json",
			success: function(data){
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
 				var address = _contextPath + "/jsp/addUser.jsp?Time="+ (new Date()).getTime();
 				$.ajax({
 					url: address,
 					success: function(html){
 						$('#workarea').html(html);
 						
 						var list = JSON.parse(data.list);
 						var tbody = $("#userListTable tbody");
 						for(var i = 0; i < list.length; i++) {
 							var tr = '<tr>'
 								+'<td align="center">'+(i+1)+'</td>'
 								+'<td data-value="'+list[i].userId+'">'+list[i].userId+'</td>'
 								+'<td data-value="'+list[i].userType+'">'+list[i].userType+'</td>'
 								+'<td>'
 								+	'<img data-id="editUser" height="20px" alt="" class="edit-details" src="'+_contextPath+'/images/edit.png" />'
 								//+   '<img data-userId="'+list[i].userId+'" height="20px" alt="" class="removeUser" src="'+_contextPath+'/images/DeleteRed.png" />'
 								+"</td>"
 								+"</tr>";
 							tbody.append(tr);
 						}
 						customizeItems("#userListTable");
 						$("#addNewUser").click(function(){
 							var id = "", errorMessage = "";
 							$('.popover').remove();
 							$('.has-error').removeClass('has-error');
 							var userName = $.trim($('#userName').val());
 							var password = $.trim($('#password').val());
 							var userType = $('#userType').val();
 							if(userName == null || userName == "") {
 								id = '#userName';
 								errorMessage = "Please Provide User Name";
 							} else if(password == null || password == "") {
 								id = '#password';
 								errorMessage = "Please Provide Password";
 							} else if(userType == null || userType == "") {
 								id = '#userType';
 								errorMessage = "Please User Type";
 							}
 							if(id != "") {
 								$(id).parent().addClass('has-error');
 								$(id).popover({
 									placement:'right',
 									content:errorMessage,
 									delay: {show:500}
 									});
 								$(id).popover('show');
 							} else {
 								var url = "addUser.action";
 								var from = $('#addNewUser').attr("data-type");
 								var oldUserId = "";
 								if(from == "edit") {
 									url = "updateUser.action";
 									oldUserId = $("#userName").attr('data-userid');
 								}
 								var password = CryptoJS.SHA3(password);
 								var parms = {oldUserId: oldUserId, userID: userName, password: password.toString(), userType: userType, Time: (new Date()).getTime()};
 								$("#loading").show();
 								$.ajax({
 									url: url,
 									method: "get",
 									dataType:"json",
 									data: parms,
 						 			success: function(result){
 										var errorString = result.errorString;
 										var resultString = result.resultString;
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
 											$('#addUser').modal('hide');
 											if(from == "update") {
 												alert("User Updated Successfully");
 											} else {
 												alert("User Added Successfully");
 											}
 											$("li[data-id='AddUser']").trigger('click');
 										}
 						 			}
 								});
 							}
 						});	
 						$("#userListTable").on ("click", ".removeUser", function(){
 							if(confirm("Do you want to delete the user?")) {
								var userId = $(this).attr('data-userId');
								var parms = {userID: userId, time: (new Date()).getTime()};
								$.ajax({
									url: "deleteUser.action",
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
											alert("User Info removed successfully");
											$("li[data-id='AddUser']").trigger('click');
										}
									}
								});
 							}
						});
 					},
 					async: false
 				});
			}
			}
	});
}



function customizeItems(id) {
	$(id).dataTable({
		"aaSorting": []
	});
	$(id).on('click' ,".edit-details", function(){
		var from = $(this).attr('data-id');
		var $tr = $(this).closest('tr');
		var dataValues = $tr.find('td[data-value]');
		if(from == "UpdateRoom") {
			$("#SaveRoom").attr('data-id',"updateRoom");
			$("#roomType").val(dataValues.eq(0).attr('data-value'));
			$("#totalRooms").val(dataValues.eq(1).attr('data-value'));
			$("#noOfPersons").val(dataValues.eq(2).attr('data-value'));
			$("#amount").val(dataValues.eq(3).attr('data-value'));
			$("#roomType").attr('data-id', $tr.attr('data-id'));
			$("#addRoom").modal('show');
		} else if(from == "editUser") {
			$("#addNewUser").attr('data-type',"edit");
			$("#userName").attr('data-userid', dataValues.eq(0).attr('data-value'));
			$("#userName").val(dataValues.eq(0).attr('data-value'));
			$("#userType").val(dataValues.eq(1).attr('data-value'));
			$("#addUser").modal('show');
		} 
	});
}