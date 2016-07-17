/**
 * recommend창의 검색입력
 */

$(document).ready(function(){
	$("#wineSearch").on("keyup", function(e){
		if(e.which == 13 || e.keyCode == 13){
			//alert("enter");
			frm.submit();
		}else{
			e.preventDefault();
		}
	});
	
	$("#searchcon").on("click", function(){
		frm.submit();
	});
});