<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="vd.dto.MemberDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="memberDao" class="vd.business.MemberDao"></jsp:useBean>
<%boolean b = memberDao.memberInsert(dto); %>
<script>
	alert("회원가입을 환영합니다!");
	location.href = "login_main.jsp";
</script>