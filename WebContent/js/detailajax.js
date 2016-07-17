/**
 * Use Ajax for Deta0l 0nfos 
 */
var xhr;

function wineDetail(wine_no){
	//alert("aa");
	var para = "wine_no=" + wine_no;
	
	xhr = new XMLHttpRequest();
	xhr.open("post", "detailgetdata.jsp", true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				//alert(xhr.responseText);
				process();
			}else{
				alert("요청 실패: " + xhr.status);
			}
		}
	}
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(para);
	//alert(para);
}

function process(){
	var arr = JSON.parse(xhr.responseText.trim());
	//alert(arr);
    var out = "<div style='width:100%;'>";

        out += "<div style='font-size:16pt;font-weight:bold;'>" +
        arr[0].wine_no + "&nbsp;&nbsp;" + arr[0].w_name + "<span style='float:right;'><img id='like' class='navicon' src='../icons/like.png'>" + arr[0].w_likes + " Likes</span>" +
        "</div>" +
        "<div style='margin-left:30px;font-size:12pt;color:grey;'>" +
        arr[0].w_region +
        "</div>" +
        "<div style='float:left;'>" +
        "<img src='../images/" + arr[0].w_image + "'>" +
        "</div>" +
        "<div style='font-size:14pt;margin-top:50px;padding:0;float:left;'>" +
        	"<div>Category:</div>" +
        	"<div>Vintage:</div>" +
        	"<div>Variety:</div>" +
        	"<div>Price:</div>" +
        	"<div>Color:</div>" +
        	"<div>Body:</div>" +
        	"<div>Acidity:</div>" +
        	"<div>Bitterness:</div>" +
        	"<div>Sweetness:</div>" +
        	"<div>Aromas:</div>" +
        "</div>" +
        "<div style='font-size:14pt;margin-top:50px;padding:0;float:left;text-align:right;'>" +
	        "<div>" +
	        	arr[0].w_category +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_price +
	        "원</div>" +
	        "<div>" +
	        	arr[0].w_variety +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_vintage +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_body +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_color +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_acidity +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_bitter +
	        "</div>" +
	        "<div>" +
	        	arr[0].w_sweet +
	        "</div>" +
        "</div>" +
        "<div>" +
	        "<div style='font-size:14pt;float:left;'>" +
				arr[0].w_aromas +
			"</div>"
        "</div>";
    out += "</div>";
    document.getElementById("wineDetail").innerHTML = out;
    $("#myModal").modal("show");
}