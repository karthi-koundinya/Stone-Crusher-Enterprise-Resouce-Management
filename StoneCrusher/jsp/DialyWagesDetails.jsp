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
function myFunction() {
    window.print();
}
</script>
    	<script>

  </script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#datepicker" ).datepicker();
    $("#datepicker1").datepicker();
  } );
  </script>
	</head>
	<body>
		<%@include file="header.jsp" %>
		    <table class="table table-hover">
        <thead>
            <tr>
                <th>customerId</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
           		<th>Email</th>
           		<th>loadingPoint</th>
           		<th>TotalAmount</th>
           		<th>Date</th>
           		<th>vehicleId</th>
           		<th>kilometer</th>
           		<th>materialName</th>
           		<th>quantity</th>
           		<th>amount</th>
            </tr>
        </thead>
    
        <tbody>
			<s:iterator value="list">
            <tr style="text-align:center">
                 <td><s:property value="customerId"/></td>
             	 <td><s:property value="name"/></td>
             	  <td><s:property value="contact"/></td>
             	   <td><s:property value="address"/></td>
             	    <td><s:property value="email"/></td>
             	    <td><s:property value="loadingPoint"/></td>
             	      <td><s:property value="TotalAmount"/></td>
             	     
             	      <td><s:property value="date"/></td>
             	       <td><s:property value="vehicleId"/></td>
             	        <td><s:property value="kilometer"/></td>
             	         <td><s:property value="materialName"/></td>
             	          <td><s:property value="quantity"/></td>
             	           <td><s:property value="amount"/></td>
             </tr>
             
             </s:iterator>
             <tr><td><button onclick="myFunction()">Print this page</button></tr>
         </tbody>
       
    </table>
	</body>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/javascript/booking.js"></script>
	<script type="text/javascript"  src="<%=request.getContextPath() %>/js/material.js"></script>
</html>