<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Belaku Constructions</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-combined.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.dataTables.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/offcanvas.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/mainframe.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css" />
    
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/jquery-migrate-1.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/sha3.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/mainframe.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/globalVariables.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/customizeItems.js"></script>
    <script type="text/javascript">
		var _contextPath = "<%=request.getContextPath() %>";
	</script>
  </head>

  <body>
	<s:set name="userType" value="#session.usertype"></s:set>
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"> <b style="color:#fff;">Stone</b>&nbsp;<b style="color:#ec5d5d;">Crusher</b></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li data-id="Home" class="btn-click home"><a href="home.action">Home</a></li>
            <li class="btn-click booking"><a href="booking.action">Trading</a></li>
            <li data-id="Check Out" class="btn-click checkOut"><a href="dailywages.action">Transaction Details</a></li>
            <li class="dropdown report">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Product Details <span class="caret"></span></a>
              <ul class="dropdown-menu">
               <li data-id="Room Info" class="btn-click"><a href="inward.action">Inward</a></li>
                <li data-id="Room Info" class="btn-click"><a href="outward.action">Outward</a></li>
                <li class="btn-click"><a href="checkProduct.action">CheckProduct</a></li>
                
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee Reports <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li data-id="Room Info" class="btn-click"><a href="addemp.action">Add Employee</a></li>
                 <li data-id="Room Info" class="btn-click"><a href="updateemp.action">Update Employee</a></li>
                  <li data-id="Room Info" class="btn-click"><a href="deleteemp.action">Delete Employee</a></li>
                   <li data-id="Room Info" class="btn-click"><a href="empdet.action"> Employee Details</a></li>
                <!-- <li data-id="Tax Declaration" class="btn-click"><a href="#">Tax Declaration</a></li> -->
             
              </ul>
            </li>
            <li><a href="logout.action"><span class="icon icons-logout"></span>Logout</a></li>
           </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
	<div id="loading"><center><img src="<%=request.getContextPath() %>/images/loading.gif"></img></center></div>
    <div class="modal fade" id="taxDeclaration" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
		  		<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Tax Declaration</h4>
		  		</div>
		  		<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<span>Tax %<b class="mandatory">&nbsp;*</b></span>
								<input type="text" id="newTax" class="form-control" />
							</div>
						</div>
					</div>
		  		</div>
		  		<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" data-from="new" class="btn btn-primary"  id="SaveTax">Save changes</button>
		  		</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
  </body>
</html>
