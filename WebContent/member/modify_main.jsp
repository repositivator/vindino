<%@page import="vd.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VinDino - modify</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/modify.css" rel="stylesheet" type="text/css">
<link rel="icon" href="../image/favicon.png">
<script src="../js/modify.js"></script>
<script type="text/javascript">
function go(){
   location.href="../index.jsp"
}
</script>
</head>
<body>
<%@ include file="//vd_top.jsp"%>
<div id="signup">
   <form name="regForm" method="post" action="modify_mainok.jsp">
      <table  class="table table-striped" style="width:60%;" >
         <tr align="center" style="background-color: #dbc3d0">
            <td colspan="2"><b style="color:#5e0231">VinDino - Modify</b></td>
         </tr>
         <tr>
            <!--<th width="16%"><label for="m_email">이메일</label></th>-->
            <td colspan="2" width="57%"  >
            <%=dto.getM_email() %><input type="hidden" name="m_email" value="<%=dto.getM_email()%>">
            </td>
               <!--<input type="button" value="중복확인" id="btnId">-->
         </tr>
         
         <tr>

            <td colspan="2"><input type="password" name="m_passwd" maxlength="16" size="15" onKeyUp="checkPwd();" onKeyDown="checkPwd();" placeholder="비밀번호">
            <span class="cr6aa7cc lPad10" >공백없는 8~16자의 영문/숫자를 조합하여 입력해야합니다.</span></td>
         </tr>
         <tr>

            <td colspan="2"><input type="password" name="repasswd" maxlength="16" size="15" onKeyUp="checkPwd();" onKeyDown="checkPwd();" placeholder="비밀번호 재확인">
            <div class="cr6aa7cc lPad10" id="check">비밀번호 확인을 위해 다시 한번 입력하세요.</div></td>
         </tr>
         <tr>
         
            <td colspan="2"><input type="text" name="m_name" size="15" placeholder="이름"></td>
         </tr>
         <tr>
            <td colspan="2">
            <span class="radiospan"><input type="radio" name="m_gen" value="남" id="memMale" checked="checked"><label for="memMale" style="margin-right:10px">남</label>
            <input type="radio" name="m_gen" value="여" id="memFemale"><label for="memFemale">여</label></span>
            </td>
         </tr>
         
         <tr>
   <td colspan="2">
      <input type="hidden" name="m_birth" value="">
      <select name="txBirthday1" id="memBirth" class="select focusOn" title="태어난 년도 선택" style="width:60px;">
         <option value="1915" >1915</option>
         <option value="1916" >1916</option>
         <option value="1917" >1917</option>
         <option value="1918" >1918</option>
         <option value="1919" >1919</option>
         <option value="1920" >1920</option>
         <option value="1921" >1921</option>
         <option value="1922" >1922</option>
         <option value="1923" >1923</option>
         <option value="1924" >1924</option>
         <option value="1925" >1925</option>
         <option value="1926" >1926</option>
         <option value="1927" >1927</option>
         <option value="1928" >1928</option>
         <option value="1929" >1929</option>
         <option value="1930" >1930</option>
         <option value="1931" >1931</option>
         <option value="1932" >1932</option>
         <option value="1933" >1933</option>
         <option value="1934" >1934</option>
         <option value="1935" >1935</option>
         <option value="1936" >1936</option>
         <option value="1937" >1937</option>
         <option value="1938" >1938</option>
         <option value="1939" >1939</option>
         <option value="1940" >1940</option>                  
         <option value="1941" >1941</option>
         <option value="1942" >1942</option>
         <option value="1943" >1943</option>         
         <option value="1944" >1944</option>         
         <option value="1945" >1945</option>         
         <option value="1946" >1946</option>         
         <option value="1947" >1947</option>         
         <option value="1948" >1948</option>                              
         <option value="1949" >1949</option>         
         <option value="1950" >1950</option>         
         <option value="1951" >1951</option>         
         <option value="1952" >1952</option>         
         <option value="1953" >1953</option>         
         <option value="1954" >1954</option>      
         <option value="1955" >1955</option>         
         <option value="1956" >1956</option>         
         <option value="1957" >1957</option>      
         <option value="1958" >1958</option>         
         <option value="1959" >1959</option>         
         <option value="1960" >1960</option>         
         <option value="1961" >1961</option>         
         <option value="1962" >1962</option>         
         <option value="1963" >1963</option>         
         <option value="1964" >1964</option>      
         <option value="1965" >1965</option>      
         <option value="1966" >1966</option>         
         <option value="1967" >1967</option>         
         <option value="1968" >1968</option>         
         <option value="1969" >1969</option>         
         <option value="1970" >1970</option>         
         <option value="1971" >1971</option>         
         <option value="1972" >1972</option>         
         <option value="1973" >1973</option>         
         <option value="1974" >1974</option>         
         <option value="1975" >1975</option>         
         <option value="1976" >1976</option>         
         <option value="1977" >1977</option>         
         <option value="1978" >1978</option>         
         <option value="1979" >1979</option>         
         <option value="1980" >1980</option>         
         <option value="1981" >1981</option>
         <option value="1982" >1982</option>         
         <option value="1983" >1983</option>         
         <option value="1984" >1984</option>         
         <option value="1985" >1985</option>         
         <option value="1986" >1986</option>         
         <option value="1987" >1987</option>         
         <option value="1988" >1988</option>         
         <option value="1989" >1989</option>         
         <option value="1990" >1990</option>         
         <option value="1991" >1991</option>
         <option value="1992" >1992</option>
         <option value="1993" >1993</option>         
         <option value="1994" >1994</option>         
         <option value="1995" >1995</option>         
         <option value="1996" >1996</option>         
         <option value="1997" >1997</option>         
         <option value="1998" >1998</option>         
         <option value="1999" >1999</option>         
         <option value="2000" >2000</option>         
         <option value="2001" >2001</option>         
      </select>년
      <select name="txBirthday2" class="select lMar10 focusOn" title="태어난 월 선택" style="width:60px;">      
         <option value="01">01</option>      
         <option value="02">02</option>      
         <option value="03">03</option>         
         <option value="04">04</option>         
         <option value="05">05</option>         
         <option value="06">06</option>         
         <option value="07">07</option>         
         <option value="08">08</option>         
         <option value="09">09</option>         
         <option value="10">10</option>         
         <option value="11">11</option>         
         <option value="12">12</option>         
      </select>월
      <select name="txBirthday3" class="select lMar10 focusOn" title="태어난 일 선택" style="width:60px;">
         <option value="01">01</option>      
         <option value="02">02</option>         
         <option value="03">03</option>         
         <option value="04">04</option>         
         <option value="05">05</option>         
         <option value="06">06</option>         
         <option value="07">07</option>         
         <option value="08">08</option>      
         <option value="09">09</option>      
         <option value="10">10</option>         
         <option value="11">11</option>         
         <option value="12">12</option>      
         <option value="13">13</option>      
         <option value="14">14</option>         
         <option value="15">15</option>         
         <option value="16">16</option>         
         <option value="17">17</option>         
         <option value="18">18</option>
         <option value="19">19</option>         
         <option value="20">20</option>         
         <option value="21">21</option>         
         <option value="22">22</option>         
         <option value="23">23</option>      
         <option value="24">24</option>         
         <option value="25">25</option>         
         <option value="26">26</option>         
         <option value="27">27</option>         
         <option value="28">28</option>      
         <option value="29">29</option>
         <option value="30">30</option>         
         <option value="31">31</option>         
      </select>일
      
   </td>
</tr>

         
         <tr>

            <td colspan="2"><input type="text" name="m_phone" size="15" maxlength="16" placeholder="휴대전화번호">
            <span class="cr6aa7cc lPad10" id="checkphone">ex)010-1111-1111</span></td>

   </tr>
      
      
         <tr>
            <td colspan="2" align="center">
               <input type="button" value="메인으로" class="btn btn-primary" onclick="go()" style="background-color: #f6f1e2; border:0px;color:#000000;">
               <input type="button" value="수정" id="btnSubmit" onclick="inputCheck()"class="btn btn-primary" style="background-color: #5e0231; border:0px;"> 
               <input type="reset" value="다시쓰기" class="btn btn-default" style="background-color: #f6f1e2; border:0px;color:#000000;">
            <!--    <input type="button" id="delete" value="탈퇴하기" class="btn btn-danger" onclick="deleteOk()" style="background-color: #231f20;border:0px;">-->   
            </td>
         </tr>
      </table>
      <div class="delete"><a href="javascript:deleteOk()" style="font-size: 15px"><u>탈퇴하기</u></a></div>
   </form>
</div>
</body>
</html>