<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="vd.business.RecommendProcessDao" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String w_name = request.getParameter("w_name");

//System.out.print("search: " + w_name);

List<String> list = processDao.selectSuggestData(w_name);

out.print(list.size());
out.print(")");

for(int i = 0; i < list.size(); i++){
	String data = list.get(i);
	out.print(data);
	if(i < list.size() - 1){
		out.print(",");
	}
}
%>