<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   <link rel="icon" href="../icons/vd_favicon.ico">

    <title>VinDino - Login</title>

    

    <!-- Custom styles for this template -->
    <link href="../css/login.css" rel="stylesheet" type="text/css">

   

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="../js/login.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
.login{
width:100%;
margin-top: 100px;
padding-right:100px;
}

</style>
<script type="text/javascript">
window.onload = function(){
	loginForm.m_email.focus();
	//document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
	document.getElementById("btnSignup").onclick = function(){
		location.href="signup_main.jsp";
	}
}
</script>
</head>
<body>
<div class=login>
	
    <div class="container">
	
</div>	
      <form name="loginForm" method="post" class="form-signin" action="login_mainproc.jsp">
     <!-- <img title="facebook" src="../image/facebook1.png" height="42" width="42">-->
     
     
     <table>
     	<tr>
     		<td colspan="2"> 
     			<img src="../images/logo1.png" height="140px" style="margin-bottom: 0px">
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<input type="text" name="m_email" id="inputEmail" class="form-control" placeholder="Email address" >
     		</td>
     		<td rowspan ="2" style="padding: 10px">
     			<input type="button" value="Login" id="btnSubmit" class="btn btn-primary" style="background-color: #5e0231; border:0px; width: 100px; height: 100px">
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<input type="password" name="m_passwd" id="inputPassword" class="form-control" placeholder="Password" >
     		</td>
     	</tr>	
     	
     	<tr>
     		<td>
     			&nbsp;
     		</td>
     		<td align="right" style="padding-right: 10px ">
     			<a href="signup_main.jsp" style="font-size: 15px"><u>Sign-up</u></a>
     			<!-- <input type="button" value="Sign-up" id="btnSignup" class="btn btn-primary" > -->
     		</td>
     	</tr>
     </table>	
     
     
     <!--
     <table class="ta">
     	<tr>
     		<td class="login_img" valign="bottom"><img src="../image/logo1.png" height="100px"></td>
     		<td>
     		<table>
				<tr>
					<td colspan="2"><input type="text" name="m_email" id="inputEmail" class="form-control" placeholder="Email address" ></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="m_passwd" id="inputPassword" class="form-control" placeholder="Password" ></td>
				</tr>
				<tr>
					<td><span class="cr6aa7cc lPad10" id="check"></span></td>
				</tr>
				<tr>
					<td colspan="2" class="ta_button">
						<input type="button" value="Login" id="btnSubmit" class="btn btn-primary">
						<input type="button" value="Sign-up" id="btnSignup" class="btn btn-primary">
					</td>
		        	
				</tr>
			</table>
			</td>
     	</tr>
     </table> 
     -->
     
     
      </form>
    </div> <!-- /container -->
   
</body>
</html>