<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Chinthu</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="Expand, contract, animate forms with jQuery wihtout leaving the page" />
    <meta name="keywords" content="expand, form, css3, jquery, animate, width, height, adapt, unobtrusive javascript"/>
	<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css" />
</head>
<body>
	 <head>
    </head>
    <body>
		
   		<div class="wrapperLogin">
			<h1>Stone Crusher</h1>
			<h2><span>SIT </span> Tumkur</h2>
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">			
					<form class="login active">
						<h3>Login</h3>
						<div>
							<label>Username:</label>
							<input id="userID" type="text" />
							<span class="error">This is an error</span>
						</div>
						<div>
							<label>Password: </label>
							<input id="password" type="password" />
							<span class="error">This is an error</span>
						</div>
						<div class="bottom">
							<div class="remember"><input type="checkbox" /><span>Keep me logged in</span></div>
							<input id="login" type="button" value="Login"></input>
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	
	    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/jquery-1.10.1.min.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/bootstrap.min.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/plugins/sha3.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath() %>/javascript/login.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath() %>/myscript/login.js"></script>
	    <script type="text/javascript">
			var _contextPath = "<%=request.getContextPath() %>";
		</script>
</body>
</html>