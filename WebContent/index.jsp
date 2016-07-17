<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vd.dto.MemberDto"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao" />
<%
request.setCharacterEncoding("utf-8");
String m_email=(String)session.getAttribute("idKey");
MemberDto dto = memberDao.selectDataPart(m_email);
%>
<!DOCTYPE html>
<html>
<head>
  <title>VinDino - Don't forget your wine</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:#5e0231;
      border:0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #dbc3d0;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  
  img#logo{
  	margin-top:-5px;
  	padding:0;
  	height:30px;
  }
  
  .navicon{
  	width:25px;
  }
  .dropdown{
 	margin-top :10px;
  	font-size: 10pt;
  }
  
  .dropdown:ACTIVE{
  	background-color: #5e0231;
  }
  
  .dropdown-menu{
  	background-color:#5e0231;
  }
  
  .nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
  	background-color:#5e0231;
  }
  </style>
  <link rel="shortcut icon" type="image/x-icon" href="icons/vd_favicon.ico" />
  <link rel="stylesheet" href="css/vd_top.css">
  <script type="text/javascript">
  $(document).ready(function(){
	  
	  //alert(confirm("yeah?"));
	  $(".navli").on("mouseenter", function(){
		  $(this).toggleClass("active");
	  });
	  $(".navli").on("mouseleave", function(){
		  $(this).toggleClass("active");
	  });
  });
  
  </script>
<%--  <script type="text/javascript">
  $(document).ready(function(){
	  
	  //alert(confirm("yeah?"));
	  $(".navli").on("mouseenter", function(){
		  $(this).toggleClass("active");
	  });
	  $(".navli").on("mouseleave", function(){
		  $(this).toggleClass("active");
	  });
	  
	  $("#myModal").modal("show");
  });
  
  function preferCheck(){
	  //alert(document.preferFrm.gen.value + " " + document.preferFrm.prefer1.value + " " + document.preferFrm.prefer2.value);
	  <% 
	  String gen = request.getParameter("gen");
	  String category = request.getParameter("prefer1");
	  HashMap<String,String> hash = new HashMap<>();
	  hash.put("gen", gen);
	  hash.put("category", category);
	  session.setAttribute("prefer", hash);
	  %>
	  $("#myModal").modal("hide");
  }
  </script>--%>
<script type="text/javascript">
window.onload = function(){	
	document.getElementById("logout").onclick = function(){
		if(confirm("로그아웃하실거에요?")==true){
		location.href="member/logout.jsp";
		}else{
			return;
		}
	}
}

function passwdCheck(){
	if(modifyFrm.m_passwd.value===""){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "비밀번호를 입력해주세요.";
		return;
	}
	document.modifyFrm.submit();
}
</script>
</head>
<body>
<!-- modal -->
<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-ok-sign"></span>비밀번호 확인</h4>
      </div>
      <div class="modal-body">
       <form action="member/modify_check.jsp" name="modifyFrm" method="post">
          <ul style="list-style:none;">
             <li class="modal1"><h4>비밀번호 확인을 위해 다시 한번 입력해주세요.</h4></li>
             <li class="modal1">
 
               <input type="password" name="m_passwd" id="inputPassword" class="form-control" placeholder="Password" autofocus>
             	<span class="cr6aa7cc lPad10" id="checkPwd"></span>
             </li>
             <li><br/></li>
          </ul>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        <button type="button" class="btn btn-primary" onclick="passwdCheck()" style="background-color: #5e0231; border:0px;">Ok</button>
      </div>
    </div>
  </div>
</div> 

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp"><img src="images/logo4.png" id="logo"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="navli"><a href="index.jsp"><img src="icons/home.png" class="navicon"></a></li>
        <li class="navli"><a href="#">About</a></li>
        <li class="navli"><a href="#">Projects</a></li> 
        <li class="navli"><a href="vd_recommend/recommend.jsp"><img src="icons/wine.png" class="navicon"></a></li>
        <li class="navli"><a href="#">Contact</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      	<li class="navli">
      	<div class="dropdown">
  		<a id="dLabel" style="text-decoration:none; color:#9d9d9d;" data-target="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
    	<img src="icons/man.png" class="navicon">
    	<%=dto.getM_email() %>님
   		 <span class="caret"></span>
		</a>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
      			<li><a href="/VinDino/tastingnote/TN_listSort.jsp?flag=w_category=m_email" id="mylist" style="color:#9d9d9d;"><span class="glyphicon glyphicon-share-alt"></span>내가 쓴 글 보기</a></li>
      			<li><a href="#" id="modify" style="color:#9d9d9d;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-cog"></span> 내 정보 수정</a></li>
  			</ul>
		</div>
		</li>
        
        <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://placehold.it/1200x400?text=IMAGE" alt="Image">
        <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>      
      </div>
	  <!-- add items -->
      <div class="item">
        <img src="http://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
      
      <div class="item">
        <img src="http://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
      
      <div class="item">
        <img src="http://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
      
      <div class="item">
        <img src="http://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>      
      </div>
    </div>
    
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3>What We Do</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Current Project</p>
    </div>
    <div class="col-sm-4"> 
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
      <p>Project 2</p>    
    </div>
    <div class="col-sm-4">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
