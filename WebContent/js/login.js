function inputCheck(){
	if(loginForm.m_email.value===""){
		alert("이메일을 입력해주세요.");
		loginForm.m_email.focus();
		return;
	}
	
	if(loginForm.m_passwd.value===""){
		alert("비밀번호를 입력해주세요.");
		loginForm.m_passwd.focus();
		return;
	}
	
	var regExp =/[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	if(!loginForm.m_email.value.match(regExp)){
		alert("이메일을 정확히 입력해주세요.");
		loginForm.m_email.focus();
		return;
	}	
	document.loginForm.submit();
	
}