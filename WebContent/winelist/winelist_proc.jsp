<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "dto" class = "vd.business.WinelistDto" />
<jsp:setProperty property ="*" name ="dto" />
<jsp:useBean id ="wlprocessDao" class ="vd.business.WinelistProcessDao" />


<%
String flag = request.getParameter("flag");
boolean result = false;

		
if(flag.equals("insert")){
	result = wlprocessDao.insertWineData(request);
	
}else if(flag.equals("update")){
	result = wlprocessDao.updateWineData(request);
}


if(result){
%>
	<script>
	alert("정상처리 되었습니다.");
	location.href="winelist_main.jsp";
	</script>
<%
}else{
%>	
	<script>
	alert("오류발생! \n 빈디노에게 연락주세요! \n 010-2345-1234");
	location.href="winelist_main.jsp";
	</script>
<%
}
%>	
	




