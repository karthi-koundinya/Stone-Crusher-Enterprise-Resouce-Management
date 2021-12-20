<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
    	
	</head>
	<body>
		<%@include file="header.jsp" %>
		<div id="workarea"  class="col-sm-offset-1 col-sm-10">
			<div class="bs-example" id="booking-div">
				<form  action="updateempdet" method="post" enctype="multipart/form-data">
					<h3 class="page-header" style="margin: 0;">Update Employee Details</h3>
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
									<span>Employee_Id<b class="mandatory">&nbsp;*</b></span>
									<input type="text" name="empids" class="form-control" />
								</div>
							</div>
							
								</div>
							</div>
						
						</div>
						
			
		
						
					</div>
					<div class="row next-mater-wrap">
						<div class="col-xs-6">
							<input id="order" type="submit" class="btn btn-success" value="Update Employee" style="float:right;"/>
						</div>
						<div class="col-xs-6">
							<button type="clear" class="btn btn-danger">Cancel</button>
						</div>
					</div>
					<s:token />
				</form>
			
	</body>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/javascript/booking.js"></script>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/js/material.js"></script>
</html>