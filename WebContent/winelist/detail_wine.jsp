<%@page import="vd.business.WinelistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="wlprocessDao" class ="vd.business.WinelistProcessDao" />

<% request.setCharacterEncoding("utf-8"); 
String wine_no = request.getParameter("wine_no");
WinelistDto dto = wlprocessDao.selectWineOne(wine_no);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<!-- From Bootstrap 기본템플릿 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--Import Google Icon Font-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href = "../css/winelist.css" type ="text/css"> 
    <link rel="stylesheet" href = "../css/vd_top.css">
   
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- Latest jQuery -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>


	<script type="text/javascript" src = "../js/wine_script.js"></script>
	<script type="text/javascript">
	window.onload = function(){
		document.getElementById("btnWineDetailCancel").onclick = InsertWineCancel;
	}
	function funcDelWine(wine_no){
		var wine_no = wine_no;
		if(confirm("정말 삭제할까요?") === true){ 
				location.href = "delete_wine.jsp?wine_no="+wine_no;
			
		}
	}
	function funcLikeWine(wine_no){
		var wine_no = wine_no;
		if(confirm("이 와인이 마음에 드시나요?") === true){ 
				location.href = "likes_wine_detail.jsp?wine_no="+wine_no;
		}
	}
	</script>

<title>와인 상세정보</title>
</head>
<body>
   
<div id = "winelist_top">

   <div align="center" style="width: 100%">
   
      <div align ="left" style="margin-left: 20%; padding-top: 50px; padding-left: 50px;">
         <b style ="font-size: 40px; color: #5e0231;">와인 정보 상세보기</b>
      </div>
   
   
      <div class="admin" align ="right" style="margin-right: 20%;">
         <a href = "update_wine.jsp?wine_no=<%=dto.getWine_no() %>">
			<button type="button" class="btn btn-warning btn-lg" style="margin-bottom:20px;" >수정</button>
		</a>
		<a href="javascript:funcDelWine(<%=dto.getWine_no() %>)">
			<button type="button" class="btn btn-danger btn-lg" style="margin-bottom:20px;">삭제</button>
		</a>
      </div>
   </div>
   

</div>   
<hr>



<table border ="1" align="center">
		<tr align="center">
			<td>
				<%=dto.getWine_no() %>
			</td>
			<td colspan="4">
				<b style="font-size: 20px"><%=dto.getW_name() %></b>
			</td>
			<td>
				<a href ="javascript:funcLikeWine(<%=dto.getWine_no() %>)">
					<input type ="button" value ="★ " name ="wineLikeButton" style="height: 70px; width: 70px; font-size: 20px; background-color: #7C174A; color: white;">
				</a> 
			</td>
			<td bgcolor="#5BB75B" style=" background-color: #7C174A; color: white;">
			&nbsp;&nbsp;
			<b style="font-size: 15px;"><%=dto.getW_likes() %></b>명이 좋아합니다. 
			</td>
		</tr>
		<tr>
			<td rowspan="3"><img src = "../winedata/<%=dto.getW_image() %>" width ="150"></td>
			<td colspan="2">&nbsp;&nbsp; Grape Variety</td>
			<td colspan="2">&nbsp;&nbsp; <%=dto.getW_variety() %></td>
			<td>&nbsp;&nbsp; 색깔 </td>
			<td colspan="2">&nbsp;&nbsp; <%=dto.getW_color() %></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp; Region(Winery)</td>
			<td colspan="2">&nbsp;&nbsp; <%=dto.getW_region() %></td>
			<td rowspan="2">&nbsp;&nbsp; 향기</td>
			<td rowspan="2" colspan="2" style="width: 200px;">&nbsp;&nbsp; <%=dto.getW_aromas() %></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp; Vintage</td>
			<td colspan="2">&nbsp;&nbsp; <%=dto.getW_vintage() %>년 산</td>
		</tr>
		<tr>
			<td align="center"><%=dto.getW_category() %></td>
			<td>&nbsp; 바디감 &nbsp;</td>
			<td><img src = "../winedata/guage_<%=dto.getW_body() %>.png" style="width:200px" title ="<%=dto.getW_body() %>점, 바디감(타닌감, 오일감 등의 복합)
: 가벼운(Light body) vs 무거운(Full body)"></td>
			<td> &nbsp; 쓴 맛 &nbsp;</td>
			<td><img src = "../winedata/guage_<%=dto.getW_bitter() %>.png" style="width:200px" title ="<%=dto.getW_bitter() %>점"></td>
			<td rowspan="2">&nbsp;&nbsp; 가격</td>
			<td rowspan="2" colspan="2">&nbsp;&nbsp; <%=dto.getW_price() %> 원 </td>
		</tr>
		<tr>
			<td align="center"><%=dto.getW_alcohol() %>% </td>
			<td> &nbsp; 신 맛 &nbsp;</td>
			<td><img src = "../winedata/guage_<%=dto.getW_acidity() %>.png" style="width:200px" title ="<%=dto.getW_acidity() %>점, 느껴지는 신맛(아랫턱이 당기는 정도)"></td>
			<td> &nbsp; 단 맛 &nbsp;</td>
			<td><img src = "../winedata/guage_<%=dto.getW_sweet() %>.png" style="width:200px" title ="<%=dto.getW_sweet() %>점"></td>
		</tr>
		<tr>
               
		<td colspan="7">
			<a href ="../tastingnote/TN_write.jsp?wine_no=<%=dto.getWine_no() %>">
				<input type ="button" value ="테이스팅노트 등록" name ="newTastingNoteButton" style="margin-bottom:20px; height: 35px; width: 100%; background-color: #5e0231; color: white; border-color: #5e0231;">
			</a> 
		</td>
		</tr>
</table>

<div align="center" style="padding : 15px 0px 0px 0px">
	<input type ="button" value ="돌아가기" name ="wine_list" style="height: 35px; width: 150px; margin-bottom:20px; background-color: #dbc3d0; color: #5e0231; border-color: #5e0231;" id ="btnWineDetailCancel">
</div>	
	
<hr>


	<!-- <h1 align="center">테이스팅노트(후기) 리스트 노출해줄 자리</h1> -->
			
		

</body>
</html>