var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";

function interval(){
	if(checkFirst == false){
		setTimeout("sendKeyword()", 1000);		//1초
		loopSend = true;
	}
}

function sendKeyword(){
	if(loopSend == false) return;
	
	var keyWord = document.frm.keyword.value;
	//console.log(keyWord);
	
	if(keyWord == ""){
		lastKeyword = "";
		hide("suggest");
	}else if(keyWord != lastKeyword){
		lastKeyword = keyWord;
		
		if(keyWord != ""){
			//alert(keyWord);
			var para = "w_name=" + keyWord;
			
			xhr = new XMLHttpRequest();
			xhr.open("post", "recommendgetdata.jsp", true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){	//405는 방식이 안맞음. 404는 fileNotFound
						process();
					}else{
						alert("요청 실패: " + xhr.status);
					}
				}
			}
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(para);
		}else{
			hide("suggest");
		}
	}
}

function process(){
	var resultText = xhr.responseText;
	//alert(resultText.trim());
	var result = resultText.split(")");
	//alert("전체 건수: " + result[0] + "\n" + "전체 자료: " + result[1]);
	if(result[0] > 0){
		var datas = result[1].split(",");
		var imsi = "";
		for (var i = 0; i < datas.length; i++) {
			imsi += "<div class='searchli' onclick=\"javascript:func('" + datas[i].trim() + "')\">";
			imsi += "<a id=\"suggestli\" style='cursor:default;text-decoration:none;'>" + datas[i].trim() + "</a><br/>";
			imsi += "</div>";
			//alert(imsi);
		}
		var listView = document.getElementById("suggestList");
		listView.innerHTML = imsi;
		show("suggest");
	}
}

function func(reData){
	frm.keyword.value = reData;
	frm.keyword.focus();
	loopSend = checkFirst = lastKeyword = false;
	hide("suggest");
	frm.submit();
}

function hide(ele){
	var e = document.getElementById(ele);
	if(e) e.style.display = "none";
}

function show(ele){
	var e = document.getElementById(ele);
	if(e) e.style.display = "";
}