function checkPwd(){
   var frm = document.regForm;
   var pw1 = frm.m_passwd.value;
   var pw2 = frm.repasswd.value;
   if(pw1!=pw2){
      document.getElementById("check").style.color = "red";
      document.getElementById("check").innerHTML="비밀번호가 일치하지 않습니다."
   }else{
      document.getElementById("check").style.color = "#5e0231";
      document.getElementById("check").innerHTML = "비밀번호가 확인되었습니다.";
      
   }
   
}

function deleteOk(){
   if(confirm("정말 탈퇴하실거에요?")==true){
      location.href="/VinDino/member/delete.jsp";
      }else{
         return;
      }
}

function inputCheck(){
   if(regForm.m_passwd.value===""){
      alert("비밀번호를 입력해주세요.");
      regForm.m_passwd.focus();
      return;
   }
   
   if (regForm.m_passwd.value.length < 8 || regForm.m_passwd.value.length > 16){
      alert("비밀번호는 공백없이 8~16자입니다.");
      regForm.m_passwd.focus();
      return ;
   }


   
   if(regForm.m_name.value===""){
      alert("이름을 입력해주세요.");
      regForm.m_name.focus();
      return;
   }

   
   if(regForm.m_gen.value===""){
      alert("성별을 체크해주세요.");
      regForm.m_gen.focus();
      return;
   }

   if(regForm.m_phone.value===""){
      alert("전화번호를 입력해주세요.");
      regForm.m_phone.focus();
      return;
   }      
   var regExp2 = /^\d{3}-\d{3,4}-\d{4}/;         //010-111-1234
   if (!regForm.m_phone.value.match(regExp2)) {
      alert("전화번호를 정확히 입력해주세요.");
      regForm.m_phone.focus();
      return;
   }

   regForm.m_birth.value= regForm.txBirthday1.value+"-"+regForm.txBirthday2.value+"-"+regForm.txBirthday3.value;
   document.regForm.submit();
}
