<%@page import="vd.formbean.TN_bean"%>
<%@page import="java.util.List"%>
<%@page import="vd.dto.TN_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<%
	String note_no = request.getParameter("note_no");
	TN_dto bean = tn_dao.selectTN(note_no); 
	List<TN_bean> list = tn_dao.selectWine();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/vd_top.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/tn_write.css">
<title>VinDino</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../js/tn_update.js"></script>
</head>
<body>
<%@ include file="../vd_top.jsp" %>
<form action="TN_updateProc.jsp" method="post">
<div class="TN_wirte">
	<div class="w_name">
		<div class="btnSlide">
		<button type="button" class="btnPrev btn">이전</button>
		<button type="button" class="btnNext btn">다음</button>
		</div>
		<div class="wineName">
		<span class="rel_name">
		<select>
			<option>와인 선택</option>
	<c:forEach var="li" items="<%=list %>">
			<option id="${li.w_name }">${li.w_name }</option>
	</c:forEach>
		</select>
		</span>
		</div>
	</div>
	<div class="wirte_area">
		<ol class="list">
			<li id="write0" >
				<div class="contentsCanSub">
					<p><b>와인의 색</b></p>
					<input type="range" id="icolor" min="20" max="99" name="n_color" value="<%=bean.getN_color() %>">
					<p><b>바디감</b></p>
					<input type="range" id="icore" min="0" max="250" name="n_core" value="<%=bean.getN_core() %>">
				</div>
				<div class="contentCan">
					<p><canvas id="wineColor" width="600" height="600"></canvas></p>
				</div>
			</li>
			<li id="write1">
				<div class="contentsAroTi">
					<p><b>향</b></p>
				</div>
				<div class="contentsAro">
						<table align="center" class="aromas">
  							<tr>
  							<td>
  								<input type="checkbox" class="checkbox" id="blackcurrant" value="blackcurrant" name="n_aromas" ><label class="check" for="blackcurrant"><div class="subtitle">Black Currant</div><img src="../images/blackcurrant.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="blackberry" value="blackberry" name="n_aromas"><label class="check" for="blackberry"><div class="subtitle">Blackberry</div><img src="../images/blackberry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="raspberry" value="raspberry" name="n_aromas"><label class="check" for="raspberry"><div class="subtitle">Raspberry</div><img src="../images/raspberry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="cherry" value="cherry" name="n_aromas"><label class="check" for="cherry"><div class="subtitle">Cherry</div><img src="../images/cherry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="strawberry" value="strawberry" name="n_aromas"><label class="check" for="strawberry"><div class="subtitle">Strawberry</div><img src="../images/strawberry.jpeg" class="img writeImg"></label>
  							</td>
  							<td>
						  		<input type="checkbox" class="checkbox" id="tobacco" value="tobacco" name="n_aromas"><label class="check" for="tobacco"><div class="subtitle">Tobacco</div><img src="../images/tobacco.jpg" class="img writeImg"></label>
						  	</td>
  						</tr>
  						<tr>
  							<td>
						  		<input type="checkbox" class="checkbox" id="corn" value="corn" name="n_aromas"><label class="check" for="corn"><div class="subtitle">Corn(bad)</div><img src="../images/sweetcorn.jpg" class="img writeImg"></label>
						  	</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="plum" value="plum" name="n_aromas"><label class="check" for="plum"><div class="subtitle">Plum</div><img src="../images/plum.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="bread" value="bread" name="n_aromas"><label class="check" for="bread"><div class="subtitle">Bread</div><img src="../images/bread.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="capsicum" value="capsicum" name="n_aromas"><label class="check" for="capsicum"><div class="subtitle">Capsicum</div><img src="../images/capsicum.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="cedar" value="cedar" name="n_aromas"><label class="check" for="cedar"><div class="subtitle">Cedar</div><img src="../images/cedar.jpg" class="img"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="chocolate" value="chocolate" name="n_aromas"><label class="check" for="chocolate"><div class="subtitle">Chocolate</div><img src="../images/chocolate.jpg" class="img"></label>
  							</td>
  							</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="corked" value="corked" name="n_aromas"><label class="check" for="corked"><div class="subtitle">Corked(bad)</div><img src="../images/corked.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="hazelnut" value="hazelnut" name="n_aromas"><label class="check" for="hazelnut"><div class="subtitle">Hazelnut</div><img src="../images/hazelnut.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="leather" value="leather" name="n_aromas"><label class="check" for="leather"><div class="subtitle">Leather</div><img src="../images/leather.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="liquorice" value="liquorice" name="n_aromas"><label class="check" for="liquorice"><div class="subtitle">Liquorice</div><img src="../images/liquorice.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="mint" value="mint" name="n_aromas"><label class="check" for="mint"><div class="subtitle">Mint</div><img src="../images/mint.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="treemoss" value="treemoss" name="n_aromas"><label class="check" for="treemoss"><div class="subtitle">Treemoss</div><img src="../images/treemoss.jpg" class="img"></label>
						  		</td>
						  	</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="coffee" value="coffee" name="n_aromas"><label class="check" for="coffee"><div class="subtitle">Coffee</div><img src="../images/coffee.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="remover" value="remover" name="n_aromas"><label class="check" for="remover"><div class="subtitle">Nail Remover</div><img src="../images/nailpolishremover.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="oak" value="oak" name="n_aromas"><label class="check" for="oak"><div class="subtitle">Oak</div><img src="../images/oak.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="onion" value="onion" name="n_aromas"><label class="check" for="onion"><div class="subtitle">Onion</div><img src="../images/onion.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="pepper" value="pepper" name="n_aromas"><label class="check" for="pepper"><div class="subtitle">Pepper</div><img src="../images/pepper.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="vinegar" value="vinegar" name="n_aromas"><label class="check" for="vinegar"><div class="subtitle">Vinegar(bad)</div><img src="../images/vinegar.jpg" class="img"></label>
						  		</td>
						  	</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="cinnamon" value="cinnamon" name="n_aromas"><label class="check" for="cinnamon"><div class="subtitle">Cinnamon</div><img src="../images/cinnamon.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="rubber" value="rubber" name="n_aromas"><label class="check" for="rubber"><div class="subtitle">Rubber(bad)</div><img src="../images/rubber.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="smoke" value="smoke" name="n_aromas"><label class="check" for="smoke"><div class="subtitle">Smoke</div><img src="../images/smoke.jpg" class="img"></label>
						  		</td>
						  	</tr>

						  </table>
					</div>
			</li>
			<li id="write2" >
				<div class="contentsTasty">
					<p><b>무게감</b></p>
					<p><input type="range" id="body" class="controllBar" size="40" min="1" max="5" name="n_body" value="<%=bean.getN_body() %>"></p>
					<p><b>신맛</b></p>
					<p><input type="range" id="acidity" class="controllBar" size="40" min="1" max="5" name="n_acidity" value="<%=bean.getN_acidity() %>"></p>
					<p><b>단맛</b></p>
					<p><input type="range" id="sweet" class="controllBar" size="40" min="1" max="5" name="n_sweet" value="<%=bean.getN_sweet() %>"></p>
					<p><b>쓴맛</b></p>
					<p><input type="range" id="alcohol" class="controllBar" size="40" min="1" max="5" name="n_bitter" value="<%=bean.getN_bitter() %>"></p>
				</div>
			</li>
			<li id="write3" >
				<div class="contentsPoi">
					<p><b>별점</b></p>
					<p>
					<select id="points" name="n_points" class="contentsPoint" >
					<option id="10">10</option><option id="9">9</option><option id="8">8</option><option id="7">7</option><option id="6">6</option><option id="5">5</option>
					<option id="4">4</option><option id="3">3</option><option id="2">2</option><option id="1">1</option>
					</select>
					</p>
					<p><b>예상가격</b></p>
					<p><input type="text" name="n_exprice" class="cotentsPrice" value="<%=bean.getN_exprice() %>"></p>
				</div>
			</li>
			<li id="write4">
				<div class="contentsTi">
					<p><b>Title</b></p>
				</div>
					<p><input type="text" type="text" name="n_title" class="contentsTiIn" value="<%=bean.getN_title() %>"></p>
				<div class="contentsCom">
					<p><b>Commnets</b></p>
				</div>
					<p><textarea name="n_comments" rows="20" cols="125" class="contentsComIn" ><%=bean.getN_comments() %></textarea></p>
			</li>
			<li id="write5">
				<div class="contentsCompelete">
					<p><b>수정하시겠습니까?</b></p>
					<p>
						<input type="button" value="수정" id="btnSub" class="btnSel">
						<input type="button" value="취소" id="btnCan" class="btnSel">
					</p>
				</div>
					
			</li>
		</ol>
	</div>
</div>
<input type="hidden" name="note_no" value="<%=note_no %>">
<input type="hidden" name="before_img" value="<%=bean.getN_image() %>">
</form>
<input type="hidden" class="aromaCheck" value="<%=bean.getN_aromas() %>">
<input type="hidden" class="pointCheck" value="<%=bean.getN_points() %>">
<input type="hidden" class="wineCheck" value="<%=bean.getW_name() %>">

</body>
</html>