<%@page import="vd.business.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String m_email = (String)session.getAttribute("idKey");
String m_passwd = request.getParameter("m_passwd");
boolean b = false;
if(!m_passwd.equals("")){
	b = memberDao.checkPasswd(m_email,m_passwd);
}
if(b){	//b가 true.비밀번호가 일치하는경우
%>
	<script>
	location.href = "modify_main.jsp"
	</script>
<%
	
}else{	//b가 false.비밀번호 불일치
%>
	<script>
	alert("비밀번호가 일치하지않습니다.\n 다시 확인해주세요.")
	location.href = "../index.jsp"	
	</script>
<%
}
%>