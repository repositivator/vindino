<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="tn_dao" class="vd.business.TN_Dao"></jsp:useBean>
<%
	String note_no = request.getParameter("note_no");
	String NowId = (String)session.getAttribute("idKey");
	boolean b = false;
	String flag = request.getParameter("flag");
	if(flag.equals("Likes")){
		b = tn_dao.updateLike(note_no, NowId);
		String url ="TN_detail.jsp?note_no=" +note_no;
		%>
			<script>location.href="TN_detail.jsp?note_no=<%=note_no%>";</script>
		<%
	}else if(flag.equals("Delete")){
		tn_dao.deleteTN(note_no);
	}else if(flag.equals("Update")){
		%>
		<script>location.href="TN_update.jsp?note_no=<%=note_no%>";</script>
	<%
	}else if(flag.equals("LikeCan")){
		tn_dao.declineLike(note_no, NowId);
		%>
		<script>location.href="TN_detail.jsp?note_no=<%=note_no%>";</script>
		<%
	}
%>