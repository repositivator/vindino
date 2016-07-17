<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vd.dto.MemberDto"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao" />
<%
request.setCharacterEncoding("utf-8");
String m_email=(String)session.getAttribute("idKey");
if(m_email == null){
   response.sendRedirect("/vindino/member/login_main.jsp");
   return;
}
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
  <link rel="stylesheet" href="css/main_background.css">
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
      <a class="navbar-brand" href="mainpage.jsp"><img src="images/logo4.png" id="logo"></a>
    </div>
   <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="navli"><a href="mainpage.jsp"><img src="icons/home.png" class="navicon"></a></li>
        <li class="navli"><a href="/vindino/vd_recommend/recommend.jsp"><img src="icons/search.png" class="navicon"></a></li>
        
        <li class="navli"><a href="/vindino/winelist/winelist_main.jsp"><img src="icons/wine.png" class="navicon"></a>
           <div class="navSub">
            <ul class="navTN">
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_likes">와인 전체보기(추천 순)</a></li>
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_w_name">가나다 순</a></li>
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_wine_no">신규등록 순</a></li>
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_w_vintage">빈티지 순</a></li>
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_w_priceU">가격 높은 순</a></li>
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_w_priceD">가격 낮은 순</a></li>
               
               <li><a href="/vindino/winelist/winelist_main.jsp?filter_select=order_w_category">카테고리별</a>
                  <ul>
                     <li><a href="/vindino/winelist/winelist_main.jsp?filter_category=all">All</a></li>
                     <li><a href="/vindino/winelist/winelist_main.jsp?filter_category=Red">Red</a></li>
                     <li><a href="/vindino/winelist/winelist_main.jsp?filter_category=white">White</a></li>
                     <li><a href="/vindino/winelist/winelist_main.jsp?filter_category=rose">Rose</a></li>
                     <li><a href="/vindion/winelist/winelist_main.jsp?filter_category=sparkling">Champagne</a></li>
                     <li><a href="/vindino/winelist/winelist_main.jsp?filter_category=champagne">Sparkling</a></li>
                  </ul>
               </li>
            </ul>
         </div>
        </li>

        <li class="navli"><a href="/vindino/tastingnote/TN_list.jsp"><img src="icons/tastingnote.png" class="navicon"></a>
           <div class="navSub">
            <ul class="navTN">
               <li><a href="/vindino/tastingnote/TN_list.jsp">All</a></li>
               <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=n_date" >New</a></li>
               <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=n_likes" >Likes</a></li>
               <li><a href="/vindino/tastingnote/TN_list.jsp" >Wine</a>
                  <ul>
                     <li><a href="/vindion/tastingnote/TN_listSort.jsp?flag=w_category&w_category=Champagne">Champagne</a></li>
                     <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=w_category&w_category=Sparkling">Sparkling</a></li>
                     <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=w_category&w_category=Red">Red</a></li>
                     <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=w_category&w_category=Rose">Rose</a></li>
                     <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=w_category&w_category=White">White</a></li>
                  </ul>
               </li>
            </ul>
         </div>
        </li>
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
               <li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=m_email" id="mylist" style="color:#9d9d9d;"><span class="glyphicon glyphicon-share-alt"></span>내가 쓴 글 보기</a></li>
               <li><a href="#" id="modify" style="color:#9d9d9d;" data-toggle="modal" data-target="#pwdModal"><span class="glyphicon glyphicon-cog"></span> 내 정보 수정</a></li>
           </ul>
      </div>
      </li>
        
        <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>



    <header class="intro">
		<div class="intro-body" style="height: 700px;">
			<div class="container">
				<div class="row bgmain">
					<div class="col-md-8 col-md-offset-2 bgmain">
						<br>
						<br>
						<img src ="/vindino/winedata/main_logo_colorOk.png">
						<br>
						<br>
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="찾으시는 와인이 있나요?"> <span
										class="input-group-btn"> <a href="/location/where">
											<button class="btn btn-primary" type="button" style="background-color: #5D0331; color: white;">와인검색</button>
									</a>
									</span>
								</div>
								<!-- /input-group -->
							</div>
							<!-- /.col-lg-6 -->
						</div>
						<!-- /.row -->
						<br>
						<br> <a href="#about" class="btn btn-circle page-scroll">
							<i class="fa fa-angle-double-down animated"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>

<%@include file="vd_bottom.html" %>



</body>
</html>