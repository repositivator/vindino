var pageN =0;

$(document).ready(function(){
	dataCheck();
	
	$(".btnNext").click(function(){
		var page = "write";
		page = page + pageN;
		pageNone(page);		
		
		pageN += 1;
		page = "write";
		
		if(pageN > 5){
			pageN = 5;
		}
		page = page + pageN;
		
		pageBlock(page);
		
	});
	
	$(".btnPrev").click(function(){
		var page = "write";
		page = page + pageN;
		pageNone(page);	
		
		pageN -= 1;
		page = "write";
		
		if(pageN < 0){
			pageN = 0;
		}
		
		page = page + pageN;
		pageBlock(page);
	});
	
	drawDefault();
	
	$("#varietyElse").hide();
	$("#variety").on("change", function(){
		if($(this).val() === "Else"){
			$("#varietyElse").show();
			$("#wineColor").css("margin-top","0px");
		}else{
			$("#wineColor").css("margin-top","100px");
			$("#varietyElse").hide();
		}
	});
	
	document.getElementById("icore").oninput = draw; 
	document.getElementById("icolor").oninput = draw;
	
	$("#btnSub").click(function(){
		if($(".contentsTiIn") ===""){
			alert("제목을 입력해주세요");
			return;
		}else if($(".contentsComIn") ===""){
				alert("제목을 입력해주세요");
			return;
		}
		
		$("form").submit();
	});
	
	$("#btnCan").click(function(){
		
		if(confirm("정말로 취소하시겠습니까?")){
			location.href="TN_list.jsp";
		}
	});
	
});

function pageNone(page){
	document.getElementById(page).style.display='none';
}

function pageBlock(page){
	document.getElementById(page).style.display='block';
}

function draw(){
	core = "";
	color = "";
	core = document.getElementById("icore").value;
	color = document.getElementById("icolor").value;
	color = "#" + color + "0000";
   
	var c = document.getElementById("wineColor");
	var ctx = c.getContext("2d");
	var grd = ctx.createRadialGradient(300, 300, 300, 300, 300, core);
	grd.addColorStop(0, "white");
	grd.addColorStop(1, color);
	ctx.fillStyle = grd;
	ctx.fillRect(0, 0, 900, 900);
	
	$("#color").attr("value",color);
	$("#core").attr("value",core);
	
}

function drawDefault(){	   
	   var c = document.getElementById("wineColor");
	   var ctx = c.getContext("2d");
	   var grd = ctx.createRadialGradient(300, 300, 300, 300, 300, 100);
	   grd.addColorStop(0, "white");
	   grd.addColorStop(1, "#770000");
	   ctx.fillStyle = grd;
	   ctx.fillRect(0, 0, 900, 900);
}

function dataCheck(){
	aromaCheck();
	document.getElementById($(".pointCheck").val()).setAttribute("selected", "selected");
	document.getElementById($(".wineCheck").val()).setAttribute("selected", "selected");
}

function aromaCheck(){
	var aromas = $(".aromaCheck").val().split(" ");
	for(j=0; j<aromas.length-1; j++){
		document.getElementById(aromas[j].trim()).setAttribute("checked","checked");
	}
}
