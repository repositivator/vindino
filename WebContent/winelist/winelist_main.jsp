
<%@page import="vd.business.WinelistDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="wlprocessDao" class ="vd.business.WinelistProcessDao" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   
   <!-- From Bootstrap 기본템플릿 -->
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
   <!--Let browser know website is optimized for mobile-->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!--Import Google Icon Font-->
   <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   
   <link rel="stylesheet" href = "../css/winelist.css" type ="text/css"> 
   <link rel="stylesheet" href = "../css/vd_top.css">
   
   <!-- Javascript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
   <script type="text/javascript">
   function funcLikeWine(wine_no){
      var wine_no = wine_no;
      if(confirm("이 와인이 마음에 드시나요?") === true){ 
            location.href = "likes_wine.jsp?wine_no="+wine_no;
      }
   }
   </script>
   
   <!-- Latest jQuery -->
   <script src="https://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript" src = ../js/winelist.js></script>


<title>전체 와인 리스트</title>
</head>

<body>
<%@ include file="../vd_top.jsp" %>

   <%
    request.setCharacterEncoding("utf-8");
   String filter_type = request.getParameter("filter_select");
   String filter_category = request.getParameter("filter_category");
   
   List<WinelistDto> list = null;
   
   System.out.println(filter_category);
   
         
   if (filter_type == "order_likes" || filter_type == null){
      if (filter_category == "all" || filter_category == null){
         list = wlprocessDao.selectWineAll();
      }else{
         list = wlprocessDao.selectCategoryFilter(filter_category);
      } 
   }else{
      list = wlprocessDao.selectWineFilter(filter_type);
   } 
   
   %>
   
   
<div id = "winelist_top">

   <div align="center" style="width: 100%">
   
      <div align ="left" style="margin-left: 20%; padding-top: 50px; padding-left: 50px;">
         <b style ="font-size: 40px; color: #5e0231;">전체 와인 리스트</b>
      </div>
   
   
      <div align ="right" style="margin-right: 20%;">
         <!-- 필터링 -->
         <form action = "winelist_main.jsp" name ="filter_frm" method ="post" >
            <!-- 검색 종류 선택 -->
            <select id = "filter_type" name ="filter_select" style="margin:0; padding: 0; background-color: #5e0231; color: white; font-size: 20px;"> 
            
            <%
            String selected_filter_type=null;
            
            if(filter_type != null){
               if(filter_type.equals("order_likes")){
                  selected_filter_type = "추천 순";
               }else if(filter_type.equals("order_w_name")){
                  selected_filter_type = "가나다 순";
               }else if(filter_type.equals("order_wine_no")){
                  selected_filter_type = "신규등록 순";
               }else if(filter_type.equals("order_w_vintage")){
                  selected_filter_type = "빈티지 순";
               }else if(filter_type.equals("order_w_priceU")){
                  selected_filter_type = "가격 높은 순";
               }else if(filter_type.equals("order_w_priceD")){
                  selected_filter_type = "가격 낮은 순";
               }else if(filter_type.equals("order_w_category")){
                  selected_filter_type = "카테고리별";
               }
            }else{
               selected_filter_type = "추천 순";
            }
            %>
               <option value ="selected_filter" selected="selected"><%=selected_filter_type %>&nbsp;정렬입니다.</option> 
               
               <option value ="order_likes">추천 순</option> 
               <option value ="order_w_name">가나다 순</option> 
               <option value ="order_wine_no">신규등록 순</option> 
               <option value ="order_w_vintage">빈티지 순</option> 
               
               <option value ="order_w_priceU">가격 높은 순</option> 
               <option value ="order_w_priceD">가격 낮은 순</option> 
               
               <option value ="order_w_category">카테고리별</option> 
            </select>
         </form>
         </br>
         
         <div class="btn-group" role="group" aria-label="test" id="category_filtergroup"" >
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=all" style="color:white;">All</a></button>
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=red" style="color:white;">Red</a></button>
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=white" style="color:white;">White</a></button>
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=rose" style="color:white;">Rose</a></button>
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=sparkling" style="color:white;">Sparkling</a></button>
           <button type="button" class="btn btn-default" style="background-color: #5e0231; color: white;"><a href = "winelist_main.jsp?filter_category=champagne" style="color:white;">Champagne</a></button>
         </div>
         <br>
         
         <a href = "new_wine.jsp" class="admin">
            <button type="button" class="btn btn-success btn-sm" style="margin-bottom:10px ; margin-top:10px; background-color: white; color: #5e0231; border-color: #5e0231">와인 신규등록</button>
         </a>
         
      </div>
   </div>
   

</div>   
<hr>



<table class="wine_mainlist" align="center" >
      
   <%
   if(list == null){
      out.println("<tr><td colspan='8'>현재 와인 데이터가 없습니다.</td></tr>");
   }else{
      for(WinelistDto d:list){
   %>
      
      
   <tr class="wine_itemlist" align="center">
      <td>
      
         <table border ="1" bordercolor="#dbc3d0" align="center">
            <tr align="center">
               <td class="detail">
                  <%=d.getWine_no() %>
               </td>
               <td class="detail"colspan="4">
                  <a href ="detail_wine.jsp?wine_no=<%=d.getWine_no() %>">
                  <b style="font-size: 20px; color: #5e0231;"><%=d.getW_name() %></b>
                  </a>
               </td>
               <td>
                  <a href ="javascript:funcLikeWine(<%=d.getWine_no() %>)">
                     <input type ="button" class="btn btn-success" value ="★ " name ="wineLikeButton" style="height: 70px; width: 70px; font-size: 20px; background-color: #7C174A; color: white; border-color: #7C174A">
                  </a> 
               </td>
               <td bgcolor="#5BB75B" style=" background-color: #7C174A; color: white;">
               &nbsp;&nbsp;
               <b style="font-size: 15px;"><%=d.getW_likes() %></b>명이 좋아합니다. 
               </td>
            </tr>
            
            <tr>
               <td class="detail" rowspan="3"><img src = "../winedata/<%=d.getW_image() %>" width ="150"></td>
               <td class="detail" colspan="2">&nbsp;&nbsp; Grape Variety</td>
               <td class="detail" colspan="2">&nbsp;&nbsp; <%=d.getW_variety() %></td>
               <td>&nbsp;&nbsp; 색깔 </td>
               <td class="detail" colspan="2">&nbsp;&nbsp; <%=d.getW_color() %></td>
            </tr>
            <tr>
               <td class="detail" colspan="2">&nbsp;&nbsp; Region(Winery)</td>
               <td class="detail" colspan="2">&nbsp;&nbsp; <%=d.getW_region() %></td>
               <td class="detail" rowspan="2">&nbsp;&nbsp; 향기</td>
               <td class="detail" rowspan="2" colspan="2" style="width: 200px;">&nbsp;&nbsp; <%=d.getW_aromas() %></td>
            </tr>
            <tr>
               <td class="detail" colspan="2">&nbsp;&nbsp; Vintage</td>
               <td class="detail" colspan="2">&nbsp;&nbsp; <%=d.getW_vintage() %>년 산</td>
            </tr>
            <tr>
               <td class="detail" align="center"><%=d.getW_category() %></td>
               <td class="detail">&nbsp; 바디감 &nbsp;</td>
               <td class="detail"><img src = "../winedata/guage_<%=d.getW_body() %>.png" style="width:200px" title ="<%=d.getW_body() %>점, 바디감(타닌감, 오일감 등의 복합)
: 가벼운(Light body) vs 무거운(Full body)"></td>
               <td class="detail"> &nbsp; 쓴 맛 &nbsp;</td>
               <td class="detail"><img src = "../winedata/guage_<%=d.getW_bitter() %>.png" style="width:200px" title ="<%=d.getW_bitter() %>점"></td>
               <td class="detail" rowspan="2">&nbsp;&nbsp; 가격</td>
               <td class="detail" rowspan="2" colspan="2">&nbsp;&nbsp; <%=d.getW_price() %> 원 </td>
            </tr>
            <tr>
               <td class="detail" align="center"><%=d.getW_alcohol() %>% </td>
               <td class="detail"> &nbsp; 신 맛 &nbsp;</td>
               <td class="detail"><img src = "../winedata/guage_<%=d.getW_acidity() %>.png" style="width:200px" title ="<%=d.getW_acidity() %>점, 느껴지는 신맛(아랫턱이 당기는 정도)"></td>
               <td class="detail"> &nbsp; 단 맛 &nbsp;</td>
               <td class="detail"><img src = "../winedata/guage_<%=d.getW_sweet() %>.png" style="width:200px" title ="<%=d.getW_sweet() %>점"></td>
            </tr>
            <tr>
               <td colspan="6" >
                  <a href ="../tastingnote/TN_write.jsp?wine_no=<%=d.getWine_no() %>">
                     <input  class="detail" type ="button" class="btn btn-primary" value ="테이스팅노트 등록" name ="newTastingNoteButton" style="margin-bottom:20px;height: 35px; width: 100%; background-color: #5e0231; color: white; border-color: #5e0231;">
                  </a> 
               </td>
               <td colspan="2">
                  <a href ="detail_wine.jsp?wine_no=<%=d.getWine_no() %>">
                     <input class="detail" type ="button" class="btn btn-info" value ="자세히 보기" name ="detail_wine" style="margin-bottom:20px; height: 35px; width: 100%; background-color: #dbc3d0; color: #5e0231; border-color: #5e0231;">
                  </a>
               </td>
            </tr>
         </table>
         
      </td>
   </tr>
   
      <%      
      }
   }
   %>
         
</table>


   <!-- From 부트스트랩 기본템플릿 -->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</body>
</html>