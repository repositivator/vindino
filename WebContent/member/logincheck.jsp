<%@page import="vd.business.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String email = request.getParameter("m_email");

boolean b = true;
String rstStr = "";
if(!email.equals("")){
	b=memberDao.checkEmail(email);
}

if(b){	//b가 true.이미 존재하는 계정인경우.
	rstStr = "no";
	out.print(rstStr);
}else{	//b가 false. 사용가능
	rstStr = "yes";
	out.print(rstStr);
}
