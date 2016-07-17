var i =6;
var click = 0;

$(document).ready(function(){
	$(".listSize").val()
	
	$("#btnSerach").click(function(){
		if($(".sword").val() == ""){
			$(".sword").focus();
			alert("검색어를 입력하시오!");
			return;
		}
		frm.submit();
	});
	
	$("#btnWrite").click(function(){
		location.href="TN_write.jsp";
	});
	
	$("#btnMy").click(function(){
		location.href="TN_listSort.jsp?flag=m_email";
	});
	
	$("#btnMore").click(function(){
		var top = $("#button").css("margin-top");
		var listSizeRe = ($(".listSize").val())%6;
		var listSize =Math.floor(($(".listSize").val())/6);
		
		top = parseInt(top.replace(/px/,''));
		
		if(click == listSize){
			if(listSizeRe <= 3){
				top+= 263;
			}else{
				top += 565;
			}
			$("#button").css("display","none");
		}else{
			top += 565;
		}
		
		top +='px';
		var top = $("#button").css("margin-top",top);
		
		showMore(i);
	});
	showMore(i);
});


function strCut(comments){
	var com= "";
	if(comments.length >40){
		for(var i=1; i < 40; i++){
			com += comments.substring(i,i+1);
		}
		com += "..."
		return com;
	}
	return comments;
}

function showMore(n){
	for(j=n-5; j<=n; j++){
		var name = "card";
		name += j;
		document.getElementById(name).style.opacity = "1";
		i++;
	}
	click +=1;
}

function cardfrmSubmit(num){
	document.getElementById("cardfrm"+num).submit();
}