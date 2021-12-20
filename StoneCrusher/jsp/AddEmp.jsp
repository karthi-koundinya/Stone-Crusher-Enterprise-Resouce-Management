<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
    		<script>
    	function myfun(){

    		 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   		 var nam = document.getElementById("name").value;
   		 var dec = document.getElementById("desc").value;
   		 var ex = /[a-zA-Z]/;
   		 var em = document.getElementById("email").value;
   		
   		
   		  if(!nam.match(ex)){
   			  alert('Please provide a valid Name');
   				 
   			    return false;
   		  }
   		  if(!dec.match(ex)){
   			alert('Please provide a valid Designation');
				 
			    return false;
   		  }
   		  if(!em.match(filter)){
   			  alert("Invalid Email !");
   			  return false;
   		  }
   		
   		  else{
   			  return true;
   		  }
   		
   		
   	}
    	</script>
	</head>
	<body>
		<%@include file="header.jsp" %>
		<div id="workarea"  class="col-sm-offset-1 col-sm-10">
			<div class="bs-example" id="booking-div">
				<form id="newemp" action="newemp" method="post" enctype="multipart/form-data">
					<h3 class="page-header" style="margin: 0;">New Employee</h3>
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
									<span>Date-of-Join<b class="mandatory">&nbsp;*</b></span>
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
								      <input name="dateofjoin" type="text" class="form-control date" readonly="readonly"
								       value="<fmt:formatDate pattern='dd/MM/yyyy HH:MM' value='<%=new java.util.Date()%>' />"></input>
								      <span class="add-on input-group-addon">
								        <i class="icon icon-calendar" data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
								      </span>
								    </div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Employee_Id<b class="mandatory">&nbsp;*</b></span>
									<input type="text"  name="empid" id="cid" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>Employee_Name<b class="mandatory">&nbsp;*</b></span>
									<input type="text" id="name" name="empname" class="form-control" />
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
									<span>Designation<b class="mandatory">&nbsp;*</b></span>
									<input type="text" id="desc" name="designation" class="form-control" />
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
									<span>Salary<b class="mandatory">&nbsp;*</b></span>
									<input type="number" name="salary" class="form-control" />
								</div>
							</div>
							
					
					
								
							
						</div>
						
						
							
						
						</div>

		
						
					</div>
					<div class="row next-mater-wrap">
						<div class="col-xs-6">
							<input id="order" type="submit" class="btn btn-success" value="Add Employee" style="float:right;" onclick="return myfun()"/>
						</div>
						<div class="col-xs-6">
							<button type="clear" class="btn btn-danger">Cancel</button>
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