<%@page import="vd.dto.RecommendDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String r_memail = (String)session.getAttribute("idKey");
%>
<jsp:useBean id="like" class="vd.formbean.LikeFormBean" />
<jsp:useBean id="dto" class="vd.dto.RecommendDto" />
<jsp:setProperty property="*" name="like"/>
<jsp:useBean id="processDao" class="vd.business.RecommendProcessDao" />
<%
//System.out.print(like.getW_name());
//System.out.print(bean.getWine_no() + " " + bean.getW_likes());
like.setW_likes(like.getW_likes() + 1);
boolean b = processDao.updateLike(like);
//RecommendDto dto = null;
dto.setR_memail(r_memail);
dto.setRwine_no(like.getWine_no());
dto.setR_prefer("1");
boolean br = processDao.insertRecommend(dto);
String url = "recommend.jsp#wine" + like.getWine_no();
//System.out.print(url);
if(b && br) {
	response.sendRedirect(url);
}
else out.print("error!");
%>
<%-- <%=bean.getWine_no() %>
<%=bean.getW_likes() %> --%>
