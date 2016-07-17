<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String m_email = request.getParameter("m_email");
String m_passwd = request.getParameter("m_passwd");
boolean b = memberDao.loginCheck(m_email,m_passwd);
if(b){
	session.setAttribute("idKey", m_email);
	response.sendRedirect("../index.jsp");
}else{
%>
	<script>
		alert("로그인 실패!\n아이디 혹은 비밀번호를 확인해주세요.");	
		history.back(-1);
	</script>
<%
}
%>