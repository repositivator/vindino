<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="wlprocessDao" class ="vd.business.WinelistProcessDao" />


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
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- MaterializeCSS (http://materializecss.com/) 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	-->
	
	<!-- Latest jQuery -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>


	<script type="text/javascript" src = "../js/wine_script.js"></script>
	<script type="text/javascript">
	window.onload = function(){
		document.getElementById("btnInsertWine").onclick = InsertWine;
		document.getElementById("btnInsertWineCancel").onclick = InsertWineCancel;
	}
	</script>


<title>신규 와인 등록</title>
</head>



<body>


<% 
int currentNum = wlprocessDao.currentNum();
%>

			
<h2 align = center >와인 신규등록</h2>
<hr>


<form name="insertWineForm" action = "winelist_proc.jsp?flag=insert" enctype="multipart/form-data" method ="post"> 

	<table border="0" style="border-color: white" align = "center" >
		<tr align="center">
			<td>
				<b style="color: gray;"><%=currentNum%>번 제품 등록입니다.</b>
				<input type="hidden" name ="wine_no" value ="<%=currentNum %>">
				<input type="hidden" name ="w_likes" value ="0">
			</td>
			
			
			<td colspan="2">와인 이름 : </td>
			<td colspan="4"><input type ="text" class="form-control" name ="w_name" required></td>
		</tr>
		
		<tr align="center">
			<td>와인 메인이미지를 선택해주세요</td>
			<td colspan="2">Grape Variety</td>
			<td colspan="2"><input type ="text" class="form-control" name ="w_variety" placeholder="포도 품종" required></td>
			<td>&nbsp;색깔&nbsp;</td>
			<td><input type ="text" class="form-control" name ="w_color" required></td>
		</tr>
		<tr align="center">
			<td rowspan="2"><input type ="file" name ="w_image" /></td>
			<td colspan="2">Region(Winery)</td>
			<td colspan="2"><input type ="text" class="form-control" name ="w_region" placeholder="원산지" required></td>
			<td rowspan="2">&nbsp;향기&nbsp;</td>
			<td rowspan="2"><input type ="text" class="form-control" name ="w_aromas" required></td>
		</tr>
		<tr align="center">
			<td colspan="2">Vintage</td>
			<td colspan="2"><input type ="text" class="form-control" name ="w_vintage" placeholder="연도" required></td>
		</tr>
		<tr align="center">
			<td>
				<select name ="w_category" class="form-control">
					<option value="default" selected="selected">Category</option>
					<option value="red">Red</option>
					<option value="white">white</option>
					<option value="rose">Rose</option>
					<option value="sparkling">Sparkling</option>
				</select>
			</td>
			<td>&nbsp;바디감&nbsp;</td>
			<td>
				<select name ="w_body" class="form-control">
					<option value="default" selected="selected">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>	
			</td>
			<td>&nbsp;쓴 맛&nbsp;</td>
			<td>
				<select name ="w_bitter" class="form-control">
					<option value="default" selected="selected">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>	
			</td>
			<td rowspan="2">&nbsp;가격&nbsp;</td>
			<td rowspan="2"><input type ="text" class="form-control" name ="w_price" placeholder="쉼표(,)없이 입력해주세요 (단위: 원)" required> </td>
		</tr>
		<tr align="center">
			<td><input type ="text" class="form-control" name ="w_alcohol" placeholder="도수(Alcohol, %)" required></td>
			<td>&nbsp;신 맛&nbsp;</td>
			<td>
				<select name ="w_acidity" class="form-control">
					<option value="default" selected="selected">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>	
			</td>
			<td>&nbsp;단 맛&nbsp;</td>
			<td>
				<select name ="w_sweet"class="form-control">
					<option value="default" selected="selected">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>	
			</td>
		</tr>
		<tr align="center">
			<td colspan="7" style="padding: 10px;">
				<input type ="button" value = "신규 등록" class="btn btn-primary" id ="btnInsertWine">
				<input type ="button" value = "돌아가기" class="btn btn-default" id ="btnInsertWineCancel">
			</td>
		</tr>
	</table>

<hr>
<p align="center">
* 바디감(타닌감, 오일감 등의 복합) : 가벼운(Light body) vs 무거운(Full body)
</p>

	<!-- From 부트스트랩 기본템플릿 -->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</form>

</body>
</html>