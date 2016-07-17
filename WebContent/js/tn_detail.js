$(document).ready(function(){
	draw();
	$(".btnLikes").click(function(){
		if($(".btnLikes").val() === "Likes"){
			$("#flag").attr("value","Likes");
		}else{
			$("#flag").attr("value","LikeCan");
		}
		detailfrm.submit();
	});
	
	$(".modal").click(function(){
		$('#modal').modal('toggle');
	});
	
	$(".btnWrite").click(function(){
		if($("#commTArea").val() === ""){
			alert("댓글을 입력하세요");
			$("#commTArea").focus();
			return;
		}
		
		detailfrm.submit();
	});
	
	$(".btnList").click(function(){
		location.href="TN_list.jsp";
	});
	
	$(".btnDelete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$("#flag").attr("value","Delete");
			detailfrm.submit();
		}
	});
	
	$(".btnUpdate").click(function(){
			$("#flag").attr("value","Update");
			detailfrm.submit();
	});
});

function draw(){

	core = "";
	color = "";
	core = document.getElementById("icore").value;
	color = document.getElementById("icolor").value;
	color = "#" + color + "0000";
   
	var c = document.getElementById("wineColor");
	var ctx = c.getContext("2d");
	var grd = ctx.createRadialGradient(280, 280, 280, 280, 280, core);
	grd.addColorStop(0, "white");
	grd.addColorStop(1, color);
	ctx.fillStyle = grd;
	ctx.fillRect(0, 0, 900, 900);
	
	$("#color").attr("value",color);
	$("#core").attr("value",core);
	
}
