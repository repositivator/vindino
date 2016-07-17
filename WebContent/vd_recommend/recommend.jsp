<%@page import="vd.dto.WinelistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="processDao" class="vd.business.RecommendProcessDao" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
List<WinelistDto> list = processDao.selectWineAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../vd_top.jsp" %>
<link rel="stylesheet" href="../css/recommend.css">
<script type="text/javascript" src="../js/recommendajax.js"></script>
<script type="text/javascript" src="../js/recommendsearch.js"></script>
<script type="text/javascript" src="../js/detailajax.js"></script>
</head>
<body>
<div id="wrapper">
<form action="recommendsearch.jsp" name="frm">
	<ul class="search">
		<li>
		<div><input type="text" id="wineSearch" name="keyword" onkeydown="javascript:interval()" autocomplete="off" placeholder="어떤 와인 찾으세요?" autofocus><img id="searchcon" class="navicon" src="../icons/search.png"></div>
		</li>
		<li>
		<div id="suggest">
			<div id="suggestList" style="margin:0;padding:0;"></div>
		</div>
		</li>
	</ul>
</form>
</div>

<div class="datas" style="margin:auto;">
<c:forEach var="wine" items="<%=list%>">
			<div class="data" id="wine${wine.wine_no}">
				<div class="first-column">
					<a href="javascript:detail('${wine_no}')" target="_self">
					<img class="data-image" src="../images/${wine.w_image}">
					</a>
				</div>
				<div class="second-column">
					<a href="javascript:wineDetail('${wine.wine_no}')" target="_self" class="data-name" style="text-decoration:none;">
					${wine.w_name}&nbsp;${wine.w_vintage}
					</a>
					<div class="data-region">${wine.w_region}</div>
				</div>
				<div class="bottom">
					<div>
						${wine.w_category}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						PRICE: ${wine.w_price}원
					</div>
					<div style="margin-top:5px;font-size:12pt;font-weight:700;">
						AROMA: ${wine.w_aromas}
						<p style="float:right;font-size:16pt;">
							<a href="like.jsp?wine_no=${wine.wine_no}&w_name=${wine.w_name}&w_likes=${wine.w_likes}"><img id="like" class="navicon" src="../icons/like.png">${wine.w_likes}</a>
						</p>
					</div>
				</div>
			</div>
</c:forEach>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Wine Information</h4>
      </div>
      <div class="modal-body">
        <div class="modal1" style="height:550px;">
           <div id="wineDetail"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary" onclick="preferCheck()">Like</button> -->
      </div>
    </div>
  </div>
</div>
</body>
</html>