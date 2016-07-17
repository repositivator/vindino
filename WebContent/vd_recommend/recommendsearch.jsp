<%@page import="vd.dto.WinelistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../vd_top.jsp" %>
<link rel="stylesheet" href="../css/recommend.css">
<script type="text/javascript" src="../js/recommendajax.js"></script>
<script type="text/javascript" src="../js/recommendsearch.js"></script>
<jsp:useBean id="processDao" class="vd.business.RecommendProcessDao" />
<%
request.setCharacterEncoding("utf-8");
String w_name = request.getParameter("keyword");
//System.out.print(w_name);
List<WinelistDto> list = processDao.selectSearchData(w_name);
//System.out.print(list);
%>
<html>
<script>
function detail(){
	$("#myModal").modal("show");
}
</script>
<body>
<!-- Search Window display reset after a search -->
<div id="wrapper">
<form action="recommendsearch.jsp" name="frm">
	<ul class="after-search">
		<li><input type="text" id="wineSearch" name="keyword" value="<%=w_name %>" onkeydown="javascript:interval()" autocomplete="off" placeholder="어떤 와인 찾으세요?" autofocus><img id="after-searchcon" class="navicon" src="../icons/search.png"></li>
		<li>
		<div id="suggest">
			<div id="suggestList" style="margin:0;padding:0;"></div>
		</div>
		</li>
	</ul>
</form>
</div>

<!-- query result -->
<div class="datas" style="margin:auto;">
<c:forEach var="wine" items="<%=list%>">
			<div class="data">
				<div class="first-column">
					<a href="javascript:detail('${wine_no}')" target="_self">
					<img class="data-image" src="../images/${wine.w_image}">
					</a>
				</div>
				<div class="second-column">
					<a href="javascript:detail('${wine_no}')" target="_self" class="data-name" style="text-decoration:none;">
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
							<a href="likesearch.jsp?wine_no=${wine.wine_no}&w_name=${wine.w_name}&w_likes=${wine.w_likes}"><img id="like" class="navicon" src="../icons/like.png">${wine.w_likes}</a>
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
       <form action="#" name="preferFrm">
          <ul style="list-style:none;">
             <li class="modal1"><h4><c:out value="${wine.w_name}" /></h4></li>
             <li class="modal1">
                <input type="radio" id="radioMale" name="gen" value="남" checked><label for="radioMale">남</label>
                <input type="radio" id="radioFemale" name="gen" value="여"><label for="radioFemale">여</label>
             </li>
             <li></li>
          </ul>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="preferCheck()">Like</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>