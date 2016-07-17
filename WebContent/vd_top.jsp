<%@page import="vd.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String m_email=(String)session.getAttribute("idKey");
MemberDto dto = memberDao.selectDataPart(m_email);
%>
<!DOCTYPE html>
  <title>VinDino - Don't forget your wine</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="../icons/vd_favicon.ico" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/vd_top.css">
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
  
  window.onload = function(){	
		document.getElementById("logout").onclick = function(){
			if(confirm("로그아웃하실거에요?")==true){
			location.href="/VinDino/member/logout.jsp";
			}else{
				return;
			}
		}
		
		document.getElementById("filter_type").onchange = function(){
			filter_frm.submit(); 
		}
		
/* 		document.getElementById("category_filtergroup").onclick = function(){
			category_frm.submit(); 
		} */
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
 <!-- modal -->
<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="pwdModalLabel">비밀번호 확인</h4>
      </div>
      <div class="modal-body">
       <form action="/VinDino/member/modify_check.jsp" name="modifyFrm" method="post">
          <ul style="list-style:none;">
             <li class="modal1"><h4>비밀번호 확인을 위해 다시 한번 입력해주세요.</h4></li>
             <li class="modal1">
 
               <input type="password" name="m_passwd" id="inputPassword" class="form-control" placeholder="Password" >
             	<span class="cr6aa7cc lPad10" id="checkPwd"></span>
             </li>
             <li><br/></li>
          </ul>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="passwdCheck()">Ok</button>
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
      <a class="navbar-brand" href="../index.jsp"><img src="../images/logo4.png" id="logo"></a>
    </div>
   <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="navli"><a href="../index.jsp"><img src="../icons/home.png" class="navicon"></a></li>
        <li class="navli"><a href="#">About</a></li>
        <li class="navli"><a href="#">Projects</a></li> 
        
        <li class="navli"><a href="/vindino/winelist/winelist_main.jsp"><img src="../icons/wine.png" class="navicon"></a>
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
        
        <li class="navli"><a href="#">Contact</a></li>
        
        <li class="navli"><a href="/vindino/tastingnote/TN_list.jsp">TastingNote</a>
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
    	<img src="../icons/man.png" class="navicon">
    	<%=dto.getM_email() %>님
   		 <span class="caret"></span>
		</a>
  			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
      			<li><a href="/vindino/tastingnote/TN_listSort.jsp?flag=w_category=m_email" id="mylist" style="color:#9d9d9d;"><span class="glyphicon glyphicon-share-alt"></span>내가 쓴 글 보기</a></li>
      			<li><a href="#" id="modify" style="color:#9d9d9d;" data-toggle="modal" data-target="#pwdModal"><span class="glyphicon glyphicon-cog"></span> 내 정보 수정</a></li>
  			</ul>
		</div>
		</li>
        
        <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>