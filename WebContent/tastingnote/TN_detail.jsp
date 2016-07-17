<%@page import="vd.dto.TN_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<%
	String NowId = (String)session.getAttribute("idKey");
	String note_no = request.getParameter("note_no");
	TN_dto bean = tn_dao.selectTN(note_no); 
	boolean idCheck = true;			
	if(bean.getN_id().equals(NowId)){
		idCheck = true;
	}
	boolean likeCheck = false;
	if(tn_dao.selectLikes(NowId)){
		likeCheck = true;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../icons/vd_favicon.ico" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/vd_top.css">
<link rel="stylesheet" type="text/css" href="../css/tn_detail.css">
<title>VinDino</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../js/tn_detail.js"></script>
</head>
<body>
<%@include file="../vd_top.jsp" %>
<div class="detail">
<form action="TN_detailProc.jsp" id="detailfrm" method="post">
<div class="note">
<table>
	<tr>
		<td>
			<table class="img">
				<tr>
					<td><img class="tn_img" src="../data/<%=bean.getN_image() %>"></td>
				</tr>
			</table>
		</td>
		<td colspan="2">
			<table>
				<tr>
					<td class="w_name" colspan="2"><h2><%=bean.getW_name() %></h2></td>
				</tr>
				<tr>
					<td style="text-align: center"><%=bean.getN_likes() %> likes</td>
					<th id="ccore" class="SubTi"><a href="#" data-toggle="modal" data-target="#myModal">Color&Core</a> </th>
				</tr>
				<tr>
					<th class="SubTi">Aromas</th><td><%=bean.getN_aromas() %></td>
				</tr>
				<tr>
					<th class="SubTi">Body</th><td><img src="../images/gauge<%=bean.getN_body() %>.png"></td>
				</tr>
				<tr>
					<th class="SubTi">Acidity</th><td><img src="../images/gauge<%=bean.getN_acidity() %>.png"></td>
				</tr>
				<tr>
					<th class="SubTi">Sweet</th><td><img src="../images/gauge<%=bean.getN_sweet() %>.png"></td>
				</tr>
				<tr>
					<th class="SubTi">Bitter</th><td><img src="../images/gauge<%=bean.getN_bitter() %>.png"></td>
				</tr>
				<tr>
					<th class="SubTi">E.Price</th><td><%=bean.getN_exprice() %></td>
				</tr>
				<tr>
					<th class="SubTi">Points</th><td><%=bean.getN_points() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table>
	<tr class="t_name">
		<th  style="font-size: 15px;"><h4>Title</h4></th><td style="text-align: left; font-size: 15px;" colspan="3"><h4><%=bean.getN_title() %></h4></td>
	</tr>
	<tr>
		<th colspan="4">Comments</th>
	</tr>
	<tr>
		<td colspan="4" class="comm"><%=bean.getN_comments() %></td>
	</tr>
	<tr>
		<td>
			<input type="button" class="btnList btn" value="List" style="text-align: left">	
		</td>
		<td colspan="3" style="text-align: right">
		<%if(idCheck){
			%>
			<input type="button" class="btnUpdate btn" value="Update">
			<input type="button" class="btnDelete btn" value="Delete">
			<%
		}
			%>
			<input type="button" class="btnLikes btn" value="<%=(likeCheck)? "LikeCan": "Likes"  %>">
		
		</td>
	</tr>
	<tr class="t_name">
		<th><h3>댓 글</h3></th><td><textarea rows="5" cols="130" id="commTArea"></textarea></td>
		<td class="tdWrite"><input type="button" class="btnWrite btn" value="Write"></td>
	</tr>	
</table>
</td>
</tr>
</table>
<input type="hidden" name="note_no" value="<%=note_no%>">
<input type="hidden" id="flag" name="flag" value="">
</div>
</form>
<div class="comment">
</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Color&Core</h4>
      </div>
      <div class="modal-body">
    	<canvas id="wineColor" width="580" height="580">
      </div>
    </div>
  </div>
</div>
<input type="hidden" id="icolor" value="<%=bean.getN_color() %>">
<input type="hidden" id="icore" value="<%=bean.getN_core() %>">
</body>
</html>