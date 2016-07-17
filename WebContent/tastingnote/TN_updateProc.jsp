<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<jsp:useBean id="bean" class="vd.formbean.TN_bean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>

<%
	boolean b = tn_dao.updateTN(bean);
	
	if(b){
		%>
			<script>
			alert("작성 완료");
			location.href="TN_list.jsp";
			</script>
		<%
	}else{
		%>
			<script>
			alert("작성 실패");
			location.href="TN_list.jsp";
			</script>
		<%
	}
%>