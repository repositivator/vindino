<%@page import="vd.dto.WinelistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="vd.business.RecommendProcessDao" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String wine_no = request.getParameter("wine_no");

//System.out.print(wine_no);

WinelistDto dto = processDao.selectWineDetail(wine_no);

//System.out.print(dto);
%>
[{"w_name":"<%=dto.getW_name() %>", "w_image":"<%=dto.getW_image() %>", "w_category":"<%=dto.getW_category() %>",
 "w_variety":"<%=dto.getW_variety() %>", "w_vintage":"<%=dto.getW_vintage() %>", "w_region":"<%=dto.getW_region() %>",
 "w_alcohol":"<%=dto.getW_alcohol() %>", "w_color":"<%=dto.getW_color() %>", "w_aromas":"<%=dto.getW_aromas() %>",
 "w_body":"<%=dto.getW_body() %>", "w_acidity":"<%=dto.getW_acidity() %>", "w_bitter":"<%=dto.getW_bitter() %>",
 "w_sweet":"<%=dto.getW_sweet() %>", "wine_no":"<%=dto.getWine_no() %>", "w_price":"<%=dto.getW_price() %>",
 "w_likes":"<%=dto.getW_likes()%>"}]