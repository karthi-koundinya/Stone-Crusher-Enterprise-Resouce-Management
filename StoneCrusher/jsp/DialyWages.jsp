<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<html>
	<head>
    	<style>
    	.buying-selling.active {
    background: #7BB712;   
}

.buying-selling {
    width: 130px; 
    padding: 10px;
    position: relative;
}

.buying-selling-word {
    font-size: 15px;
    font-weight: 600;
    margin-left: 22px;
}

.radio-dot:before, .radio-dot:after {
    content: "";
    display: block;
    position: absolute;
    background: #fff;
    border-radius: 100%;
}

.radio-dot:before {
    width: 20px;
    height: 20px;
    border: 1px solid #ccc;
    top: 10px;
    left: 16px;
}

.radio-dot:after {
    width: 12px;
    height: 12px;
    border-radius: 100%;
    top: 14px;
    left: 20px;
}

.buying-selling.active .buying-selling-word {
    color: #fff;
}

.buying-selling.active .radio-dot:after {
    background: #426C2A;
}

.buying-selling.active .radio-dot:before {
    background: #fff;
    border-color: #699D17;
}

.buying-selling:hover .radio-dot:before {
    border-color: #adadad;
}

.buying-selling.active:hover .radio-dot:before {
    border-color: #699D17;
}


.buying-selling.active .radio-dot:after {
    background: #426C2A;
}

.buying-selling:hover .radio-dot:after {
    background: #e6e6e6;
}

.buying-selling.active:hover .radio-dot:after {
    background: #426C2A;
    
}

@media (max-width: 400px) {
    
    .mobile-br {
        display: none;   
    }

    .buying-selling {
        width: 49%;
        padding: 10px;
        position: relative;
    }

}
    	</style>
    	<script>

  </script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd'
    });
    $("#datepicker1").datepicker({
    	dateFormat: 'yy-mm-dd'
    });
  } );
  </script>
	</head>
	<body>
		<%@include file="header.jsp" %>
		<div id="workarea"  class="col-sm-offset-1 col-sm-10">
			<div class="bs-example" id="booking-div">
				<form id="searchdet" action="searchdet" method="post" enctype="multipart/form-data">
					<h3 class="page-header" style="margin: 0;">Transaction Details</h3>
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
									<span>Date From<b class="mandatory">&nbsp;*</b></span>
								 <input type="text" name ="fromdate" id="datepicker" class="form-control date">
									
								</div>
							</div>
							
									<div class="col-md-3">
								<div class="form-group">
									<span>Date To<b class="mandatory">&nbsp;*</b></span>
								 <input type="text" name="todate" id="datepicker1" class="form-control date">
								
								</div>
							
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<span>CustomerId<b class="mandatory">&nbsp;*</b></span>
									<input type="text"  id="custId" name="custId" class="form-control " />
								</div>
						</div>
						
    <div class="buying-selling-group" id="buying-selling-group" data-toggle="buttons" style="margin-top:18px">
        <label class="btn btn-default buying-selling">
            <input type="radio" name="options" id="date" value="date" autocomplete="off">
            <span class="radio-dot"></span>
            <span class="buying-selling-word">Date</span>
        </label>
    
        <label class="btn btn-default buying-selling">
            <input type="radio" name="options" id="cid"  value="name" autocomplete="off">
            <span class="radio-dot"></span>
            <span class="buying-selling-word">Id</span>
        </label>
</div>
						
					</div>
					<div class="row next-mater-wrap">
						<div class="col-xs-6">
							<input  type="submit" class="btn btn-success" value="Search Details" style="float:right;"/>
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