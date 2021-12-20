<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-tags" prefix="d" %> 
<html>
	<head>
	<script src="js/myscript.js"></script>
	<script src="js/jquery-1.10.2.js"></script>
 	 <script>
	function myfun(){

		 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var nam = document.getElementById("name").value;
		 var ex = /[a-zA-Z]/;
		 var emial = document.getElementById("email").value;
		
		  if (!filter.test(emial)) {
			    alert('Please provide a valid email address');
			 
			    return false;
			 }
		  if(!nam.match(ex)){
			  alert('Please provide a valid Name');
				 
			    return false;
		  }
		  else{
			  return true;
		  }
		
		
	}
	$(document).ready(function(){
		
		$(".table").find("tbody").on('change',"tr td select ",function(){
					
			var id = $(this).val();
			
			var amts;
			
			var mydata = {
					id    :  id
					
			}
	
	 	 	 $.ajax({
					url:"Getamnt.action",
					method : "get",
					dataType: "json",
					data: mydata,
					 async: false,
	 		        success:function(data){
	 		        	var result = JSON.parse(data.GetDetails);
	 		        	
	 		        	amts= result[0].amnt;
	 		        	
	 		        	
	 		        	
	 		        }
				
						
			});  
			$(this).closest('tr').children('td').find('input.amt').val(amts);
			
			
	      });
        });
	
</script>
  	<script>
function myFunction() {
    window.print();
}
</script>
	</head>
	<body>
		<%@include file="header.jsp" %>
		<div id="workarea"  class="col-sm-offset-1 col-sm-10">
			<div class="bs-example" id="booking-div">
				<form id="fileUpload" action="bookMyRoom" method="post" enctype="multipart/form-data">
					<h3 class="page-header" style="margin: 0;">Order Material</h3>
					<input type="hidden" value="NEW" name="fromPage" />
					<s:set name="message" value="#session.message"></s:set>
					<s:property value="exception"/>
					<s:property value="exceptionStack"/>
					<s:if test="hasActionErrors()">
					      <div class="alert alert-danger"> <s:actionerror /></div>
					</s:if>
					<s:else>
						<c:if test="${message != null}">
							<div class="alert alert-success"> ${message} </div>
							<input type="hidden" value="print" id="print" />
							<c:remove var="message" scope="session" />
						</c:if>
					</s:else>
					<s:if test="hasActionMessages()">
					      <div class="alert alert-success"> <s:actionmessage/> </div>
					</s:if>
					<div class="table-responsive">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<span>Date<b class="mandatory">&nbsp;*</b></span>
									<%-- <div class='input-group date' data-provide="datepicker"
										data-date-autoclose="true" data-date-today-btn="linked"
										data-date-end-date="today" data-date-today-highlight="true"
										data-date-format="dd/mm/yyyy hh:mm">
										<input type="text" name="bookingDate" class="form-control date" readonly="readonly" 
											value="<fmt:formatDate pattern='dd/MM/yyyy HH:MM' value='<%=new java.util.Date()%>' />">
										<span class="input-group-addon"><span
											class="icon icon-calendar"></span> </span>
									</div> --%>
									<div id="datetimepicker" class='input-group date'>
								      <input name="bookingDate" type="text" class="form-control date" readonly="readonly"
								       value="<fmt:formatDate pattern='dd/MM/yyyy HH:MM' value='<%=new java.util.Date()%>' />"></input>
								      <span class="add-on input-group-addon">
								        <i class="icon icon-calendar" data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
								      </span>
								    </div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Customer_Id<b class="mandatory">&nbsp;*</b></span>
									<input type="text"  name="cid" id="cid" class="form-control" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Name<b class="mandatory">&nbsp;*</b></span>
									<input type="text"  id="name" name="name" class="form-control" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Phone Number<b class="mandatory">&nbsp;*</b></span>
									<input type="text" name="phoneNumber" class="form-control onlyNumbers" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Address<b class="mandatory">&nbsp;*</b></span>
									<input type="text" name="address" class="form-control" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Email ID<b class="mandatory">&nbsp;*</b></span>
									<input type="text" id="email" name="email" class="form-control" />
								</div>
							</div>
							<div class="row">
							
							
							<div class="col-md-3">
								<div class="form-group">
									<span>Vehicle ID<b class="mandatory">&nbsp;*</b></span>
									<input type="number" name="vehicleId" class="form-control" />
								</div>
							</div>
							
							<div class="col-md-3">
								<div class="form-group">
									<span>Kilometers<b class="mandatory">&nbsp;*</b></span>
									<input type="number" name="kilometer" id="kiloe" class="form-control" />
									
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Loading Point.<b class="mandatory">&nbsp;*</b></span>
									<select class="form-control roomType" name="loadingPoint">
													<option value="" data-amount="0" selected="selected">--- Select ---</option>
												
													<option value="SIT">SIT</option>
													<option value="Hanumanthapura">Hanumanthapura</option>
													<option value="SiraGate">SiraGate</option>
													<option value="HireHalli">HireHalli</option>
													
												</select>
								</div>
								</div>
								<div class="col-md-3">
								<div class="form-group">
									<span>Total Amount<b class="mandatory">&nbsp;*</b></span>
									<input type="text" value="0" id="totalAmount" name="totalAmount" class="form-control onlyNumbers" readonly="readonly" />
								</div>
						</div>
								
							
						</div>
						
						
							
						
						</div>
						<div class="row">
							<div class="col-md-12">
								<fieldset>
								<legend>Material Details&nbsp;</legend>
									<div class="table-responsive">
							         <table id="roomType" class="table table-striped table-bordered table-hover">
							           <thead>
							             <tr>
							               <th>Sl No</th>
							               <th>Material</th>
							               <th>Quantity</th>
							               <th>Amount</th>
							               <th>Total</th>
							               <th>
							               	<img height="30px" id="addRoomType" src="<%=request.getContextPath() %>/images/add.png" />
							               </th>
							             </tr>
							           </thead>
							           <tbody>
							          	<tr>
							             	<td align="center">1</td>
							             	<td>
								             	<select class="form-control roomType" name="roomType" class="mid">
													<option value="" data-amount="0" selected="selected">--- Select ---</option>						
													
														<d:iterator value="list">
														<option><s:property value="matname"/></option>
														</d:iterator>	
														
												</select>
											</td>
											<td>
												<input type="text" value="0" name="noOfRooms" class="form-control quantity onlyNumbers" />
											</td>
											<td>
												<input type="text" value="0" name="noOfDays" id="amont" class="form-control amt onlyNumbers" />
											</td>
											<td>
												<input type="text" value="0" readonly="readonly" name="amount" class="form-control amount onlyNumbers" />
											</td>
											<td align="center">
												<img height="30px" alt="" class="removeRoom displayNone" src="<%=request.getContextPath() %>/images/DeleteRed.png" />
												<!-- <button type="button" class="btn btn-warning removeRoom displayNone"><i class="icon icons-d"></i></button> -->
											</td>
										</tr>
							           </tbody>
							         </table>
							        </div>
								</fieldset> 
							</div>
						</div>
			
		
						
					</div>
					<div class="row next-mater-wrap">
						<div class="col-xs-6">
							<input id="order" type="submit" class="btn btn-success" value="Order Material" style="float:right;" onclick="return myfun()"/>
						</div>
						<div class="col-xs-6">
							<button type="clear" class="btn btn-danger">Cancel</button>&nbsp;&nbsp;&nbsp;<button onclick="myFunction()" class="btn btn-success">Print </button>
						</div>
						
					</div>
					<s:token />
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/javascript/booking.js"></script>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/js/material.js"></script>
</html>