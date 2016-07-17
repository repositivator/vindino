<%@page import="vd.formbean.TN_bean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<TN_bean> list = tn_dao.selectAllTN();
	int i=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/tn_list.css">
 <link rel="stylesheet" href="../css/vd_top.css">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../js/tn_list.js"></script>
</head>
<body>
<%@ include file="../vd_top.jsp" %>
<div id="mainbox">
	<div class="page">
		<input type="button" id="btnWrite" class="btn" value="글작성" style="float:left">
		<input type="button" id="btnMy" class="btn" value="내 글" style="float:left; margin-left: 5px">
		<form action="TN_listSort.jsp" id="frm" method="post">
						<select name="flag">
							<option value="title"  selected="selected">제목</option>
							<option value="comments">내용</option>
							<option value="name" >작성자</option>
							<option value="wine" >와인</option>
						</select>
						<input type="text" name="sword" class="sword" size="20">
						<input type="button" value="검색" class="btn" id="btnSerach">	
		</form>
	</div>
	<div class="contentCard">
	<c:forEach var="li" items="<%=list %>">
		<form action="TN_detail.jsp?note_no=${li.note_no}" id="cardfrm<%=i %>" method="post">
			<div class="card " id="card<%=i%>" onclick="javascript:cardfrmSubmit(<%=i%>)">
	  			<img class="cardImg" src="../data/${li.n_image }" />
	  			<h2 class="cardH2">${li.w_name }</h2>
	  			<div class="context">
	  			<table>
	  				<tr>
	  					<th><div class="contexts" style="width : 200px; text-overflow:ellipsis; white-space:nowrap;  overflow:hidden;">${li.n_title }</div></th>
	  					<td style="text-align: right;">${li.n_date}</td>
	  				</tr>
	  				<tr>
	  					<td colspan="2"><div class="contexts" style=" text-overflow:ellipsis; white-space:nowrap;  overflow:hidden;">${li.n_comments }</div></td>
	  				</tr>
	  				<tr>
	  					<td colspan="2" style="text-align: right;">추천 : ${li.n_likes}</td>
	  				</tr>
	  			</table>
	  			</div>
			</div>
		</form>
			<% i += 1; %>
	</c:forEach>
	</div>
</div>
	<div class="moreContents" id="button">
			<input type="button" id="btnMore" class="btn" value="더 보기">
	</div>
<input type="hidden" class="listSize" value="<%=list.size() %>">
	
</body>
</html>