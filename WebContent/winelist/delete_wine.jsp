<%@page import="vd.business.WinelistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:useBean id="wlprocessDao" class ="vd.business.WinelistProcessDao" />

<% request.setCharacterEncoding("utf-8"); 
String wine_no = request.getParameter("wine_no");
WinelistDto dto = wlprocessDao.selectWineOne(wine_no);

boolean b = wlprocessDao.deleteWineData(wine_no);

if(b){
%>
	<script>
	alert("삭제 성공");
	location.href="winelist_main.jsp";
	</script>
<%
}else{
%>	
	<script>
	alert("삭제 실패!");
	location.href="winelist_main.jsp";
	</script>
<%
}
%>	
	




