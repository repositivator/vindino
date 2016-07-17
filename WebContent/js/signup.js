var chkID = false, chkAjaxID = false;
var chkEmail = false, chkAjaxEmail = false;

function jsChkID(){
	if(chkID){
		$("#checkMsgID").html("이메일을 입력해주세요.");
		chkID = false;
	}
}
function DuplicateIDCheck(comp){
	var id;
	id = comp.value;
	var regExp =/[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	
	if (id == ''){
		$("#checkMsgID").html("이메일을 입력해주세요.");
		return;
	}else if (!regForm.m_email.value.match(regExp) ) {
			$("#checkMsgID").html("<font class='crRed' >이메일을 정확히 입력해주세요.</font>");
		   regForm.m_email.focus();
		   return;
	}
	else{
		var rstStr = $.ajax({
			type: "POST",
			url: "idcheck.jsp",
			data: "m_email="+id,
			dataType: "text",
			async: false
		}).responseText;
		
		if(rstStr.trim() == "no"){
			$("#checkMsgID").html("<font class='crRed' >사용할 수 없는 이메일입니다.</font>");
			chkID = false;
			document.regForm.m_email.focus();
		}else{
			$("#checkMsgID").html("사용할 수 있습니다.");
			chkID = true;
		}
		chkAjaxID = true;
	}
}

/*소문자로 변환; index를 지정할 경우 index길이만큼만 소문자로 변환
function isToLowerCase(obj, index){
	if(typeof(index) != 'undefined' && index != ""){
		obj.value =
			obj.value.substring(0, index).toLowerCase()
			+ obj.value.substring(index, obj.value.length);
		return;
	}
	obj.value = obj.value.toLowerCase();
}*/


function keyCodeCheckID(event,id) {
	if(event.keyCode == 13){
		DuplicateIDCheck(id);
	}
}

function checkPwd(){
	var frm = document.regForm;
	var pw1 = frm.m_passwd.value;
	var pw2 = frm.repasswd.value;
	
	if(pw1==""||pw2==""){
		document.getElementById('checkPwd').style.color = "#5e0231";
		document.getElementById('checkPwd').innerHTML = "비밀번호 확인을 위해 다시 한번 입력해주세요.";
		
	}else if(pw1!=pw2){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "비밀번호가 동일하지 않습니다.";
	}else{
		document.getElementById('checkPwd').style.color = "#5e0231";
		document.getElementById('checkPwd').innerHTML = "비밀번호가 확인되었습니다.";
		
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

	
	if(regForm.m_email.value===regForm.m_passwd.value){
		alert("이메일과 동일한 패스워드는 사용하실 수 없습니다.");
		regForm.m_passwd.focus();
		return;
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
/*
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
	전화번호는 필수입력아님추후 수정가능하게.*/
	
	
	
	regForm.m_birth.value= regForm.txBirthday1.value+"-"+regForm.txBirthday2.value+"-"+regForm.txBirthday3.value;
	document.regForm.submit();
}

