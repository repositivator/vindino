<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String m_email = (String)session.getAttribute("idKey");
boolean b = memberDao.memberDelete(m_email);


if(b){
%>
	<script>
		alert("그동안 고마웠어요!");
		location.href="login_main.jsp";
	</script>
<%
}else{
%>
	<script>
		alert("탈퇴 실패!\n관리자에게 문의해주세요.");
		history.back(-1);
	</script>
<%
}
%>