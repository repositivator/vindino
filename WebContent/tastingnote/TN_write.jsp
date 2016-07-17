<%@page import="vd.formbean.TN_bean"%>
<%@page import="java.util.List"%>
<%@page import="vd.dto.TN_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<%
	String note_no = request.getParameter("note_no");
	String NowId = (String)session.getAttribute("idKey");
	System.out.print(NowId);
	TN_dto bean = tn_dao.selectTN(note_no); 
	List<TN_bean> list = tn_dao.selectWine();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="../css/vd_top.css">
<link rel="stylesheet" type="text/css" href="../css/tn_write.css">
<title>VinDion</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../js/tn_write.js"></script>
</head>
<body>
<%@ include file="../vd_top.jsp" %>
<form action="TN_writeProc.jsp"  enctype="multipart/form-data" method="post">
<div class="TN_wirte">
	<div class="w_name">
		<div class="btnSlide">
		<button type="button" class="btnPrev btn">이전</button>
		<button type="button" class="btnNext btn">다음</button>
		</div>
		<div class="wineName">
		<span class="rel_name">
		<select name="w_name">
		<option selected="selected">와인 선택</option>
	<c:forEach var="li" items="<%=list %>">
			<option value="${li.w_name }">${li.w_name }</option>
	</c:forEach>
		</select>
		</span>
		</div>
	</div>
	<div class="wirte_area">
		<ol class="list">
			<li id="write0" >
				<div class="contentImg">
					<p><b>이미지 선택</b></p>
					<p><input type="file" name="n_image" size="500" /></p>
				</div>
			</li>
			<li id="write1" >
				<div class="contentsCanSub">
					<p><b>와인의 색</b></p>
					<input type="range" id="icolor" min="20" max="99" name="n_color">
					<p><b>바디감</b></p>
					<input type="range" id="icore" min="0" max="250" name="n_core">
				</div>
				<div class="contentCan">
					<p><canvas id="wineColor" width="600" height="600"></canvas></p>
				</div>
			</li>
			<li id="write2">
				<div class="contentsAroTi">
					<p><b>향</b></p>
				</div>
				<div class="contentsAro">
						<table align="center" class="aromas">
  							<tr>
  							<td>
  								<input type="checkbox" class="checkbox" id="blackcurrant" value="blackcurrant" name="aroma"><label for="blackcurrant"><div class="subtitle">Black Currant</div><img src="../images/blackcurrant.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="blackberry" value="blackberry" name="aroma"><label for="blackberry"><div class="subtitle">Blackberry</div><img src="../images/blackberry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="raspberry" value="raspberry" name="aroma"><label for="raspberry"><div class="subtitle">Raspberry</div><img src="../images/raspberry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="cherry" value="cherry" name="aroma"><label for="cherry"><div class="subtitle">Cherry</div><img src="../images/cherry.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="strawberry" value="strawberry" name="aroma"><label for="strawberry"><div class="subtitle">Strawberry</div><img src="../images/strawberry.jpeg" class="img writeImg"></label>
  							</td>
  							<td>
						  		<input type="checkbox" class="checkbox" id="tobacco" value="tobacco" name="aroma"><label for="tobacco"><div class="subtitle">Tobacco</div><img src="../images/tobacco.jpg" class="img writeImg"></label>
						  	</td>
  						</tr>
  						<tr>
  							<td>
						  		<input type="checkbox" class="checkbox" id="corn" value="corn" name="aroma"><label for="corn"><div class="subtitle">Corn(bad)</div><img src="../images/sweetcorn.jpg" class="img writeImg"></label>
						  	</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="plum" value="plum" name="aroma"><label for="plum"><div class="subtitle">Plum</div><img src="../images/plum.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="bread" value="bread" name="aroma"><label for="bread"><div class="subtitle">Bread</div><img src="../images/bread.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="capsicum" value="capsicum" name="aroma"><label for="capsicum"><div class="subtitle">Capsicum</div><img src="../images/capsicum.jpg" class="img writeImg"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="cedar" value="cedar" name="aroma"><label for="cedar"><div class="subtitle">Cedar</div><img src="../images/cedar.jpg" class="img"></label>
  							</td>
  							<td>
  								<input type="checkbox" class="checkbox" id="chocolate" value="chocolate" name="aroma"><label for="chocolate"><div class="subtitle">Chocolate</div><img src="../images/chocolate.jpg" class="img"></label>
  							</td>
  							</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="corked" value="corked" name="aroma"><label for="corked"><div class="subtitle">Corked(bad)</div><img src="../images/corked.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="hazelnut" value="hazelnut" name="aroma"><label for="hazelnut"><div class="subtitle">Hazelnut</div><img src="../images/hazelnut.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="leather" value="leather" name="aroma"><label for="leather"><div class="subtitle">Leather</div><img src="../images/leather.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="liquorice" value="liquorice" name="aroma"><label for="liquorice"><div class="subtitle">Liquorice</div><img src="../images/liquorice.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="mint" value="mint" name="aroma"><label for="mint"><div class="subtitle">Mint</div><img src="../images/mint.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="treemoss" value="treemoss" name="aroma"><label for="treemoss"><div class="subtitle">Treemoss</div><img src="../images/treemoss.jpg" class="img"></label>
						  		</td>
						  	</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="coffee" value="coffee" name="aroma"><label for="coffee"><div class="subtitle">Coffee</div><img src="../images/coffee.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="remover" value="remover" name="aroma"><label for="remover"><div class="subtitle">Nail Remover</div><img src="../images/nailpolishremover.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="oak" value="oak" name="aroma"><label for="oak"><div class="subtitle">Oak</div><img src="../images/oak.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="onion" value="onion" name="aroma"><label for="onion"><div class="subtitle">Onion</div><img src="../images/onion.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="pepper" value="pepper" name="aroma"><label for="pepper"><div class="subtitle">Pepper</div><img src="../images/pepper.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="vinegar" value="vinegar" name="aroma"><label for="vinegar"><div class="subtitle">Vinegar(bad)</div><img src="../images/vinegar.jpg" class="img"></label>
						  		</td>
						  	</tr>
						  	<tr>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="cinnamon" value="cinnamon" name="aroma"><label for="cinnamon"><div class="subtitle">Cinnamon</div><img src="../images/cinnamon.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="rubber" value="rubber" name="aroma"><label for="rubber"><div class="subtitle">Rubber(bad)</div><img src="../images/rubber.jpg" class="img"></label>
						  		</td>
						  		<td>
						  			<input type="checkbox" class="checkbox" id="smoke" value="smoke" name="aroma"><label for="smoke"><div class="subtitle">Smoke</div><img src="../images/smoke.jpg" class="img"></label>
						  		</td>
						  	</tr>

						  </table>
					</div>
			</li>
			<li id="write3" >
				<div class="contentsTasty">
					<p><b>무게감</b></p>
					<p><input type="range" id="body" class="controllBar" size="20" min="1" max="5" name="n_body" ></p>
					<p><b>신맛</b></p>
					<p><input type="range" id="acidity" class="controllBar" size="20" min="1" max="5" name="n_acidity"></p>
					<p><b>단맛</b></p>
					<p><input type="range" id="sweet" class="controllBar" size="20" min="1" max="5" name="n_sweet"></p>
					<p><b>쓴맛</b></p>
					<p><input type="range" id="alcohol" class="controllBar" size="20" min="1" max="5" name="n_bitter"></p>
				</div>
			</li>
			<li id="write4" >
				<div class="contentsPoi">
					<p><b>별점</b></p>
					<p>
					<select id="points" name="n_points" class="contentsPoint">
					<option>10</option><option>9</option><option>8</option><option>7</option><option>6</option><option>5</option>
					<option>4</option><option>3</option><option>2</option><option>1</option>
					</select>
					</p>
					<p><b>예상가격</b></p>
					<p><input type="text" name="n_exprice" class="cotentsPrice"></p>
				</div>
			</li>
			<li id="write5">
				<div class="contentsTi">
					<p><b>Title</b></p>
				</div>
					<p><input type="text" name="n_title" class="contentsTiIn"></p>
				<div class="contentsCom">
					<p><b>Commnets</b></p>
				</div>
					<p><textarea name="n_comments" rows="20" cols="125" class="contentsComIn"></textarea></p>
			</li>
			<li id="write6">
				<div class="contentsCompelete">
					<p><b>작성하시겠습니까?</b></p>
					<p>
						<input type="button" value="작성" id="btnSub" class="btnSel">
						<input type="button" value="취소" id="btnCan" class="btnSel">
					</p>
				</div>
					
			</li>
		</ol>
	</div>
</div>
<input type="hidden" name="n_id" value="<%=NowId %>">
</form>
</body>
</html>