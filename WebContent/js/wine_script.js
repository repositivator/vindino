


function InsertWineCancel(){
   location.href = "winelist_main.jsp";
}
function UpdateWineCancel(){
   location.href = "winelist_main.jsp";
}
function DeleteWineCancel(){
	   location.href = "winelist_main.jsp";
}


function InsertWine(){

	if(insertWineForm.w_name.value === ""){
		alert("와인 이름을 입력해주세요!");
		insertWineForm.w_name.focus();
		return;
	}else if(insertWineForm.w_variety.value === ""){
		alert("포도 품종을 입력해주세요!");
		insertWineForm.w_variety.focus();
		return;
	}else if(insertWineForm.w_region.value === ""){
		alert("원산지 정보를 입력해주세요!");
		insertWineForm.w_region.focus();
		return;
	}else if(insertWineForm.w_color.value === ""){
		alert("와인의 색깔을 자유롭게 입력해주세요!");
		insertWineForm.w_color.focus();
		return;
	}else if(insertWineForm.w_aromas.value === ""){
		alert("와인의 향기를 자유롭게 입력해주세요!");
		insertWineForm.w_aromas.focus();
		return;
	
	}else if(isNaN(insertWineForm.w_vintage.value) === true || insertWineForm.w_vintage.value === ""){
		alert("빈티지는 숫자만 입력 가능합니다!");
		insertWineForm.w_vintage.focus();
		return;
	}else if(isNaN(insertWineForm.w_price.value) === true || insertWineForm.w_price.value === ""){
		alert("가격은 숫자만 입력 가능합니다!");
		insertWineForm.w_price.focus();
		return;
	}else if(isNaN(insertWineForm.w_alcohol.value) === true || insertWineForm.w_alcohol.value === ""){
		alert("도수는 숫자만 입력 가능합니다!");
		insertWineForm.w_alcohol.focus();
		return;
		
	}else if(insertWineForm.w_category.value === "default"){
		alert("카테고리를 선택해주세요!");
		insertWineForm.w_category.focus();
		return;
	}else if(insertWineForm.w_body.value === "default"){
		alert("바디감의 정도를 선택해주세요!");
		insertWineForm.w_body.focus();
		return;
	}else if(insertWineForm.w_bitter.value === "default"){
		alert("쓴 맛의 정도를 선택해주세요!");
		insertWineForm.w_bitter.focus();
		return;
	}else if(insertWineForm.w_acidity.value === "default"){
		alert("신 맛의 정도를  선택해주세요!");
		insertWineForm.w_acidity.focus();
		return;
	}else if(insertWineForm.w_sweet.value === "default"){
		alert("단 맛의 정도를  선택해주세요!");
		insertWineForm.w_sweet.focus();
		return;
	}
	document.insertWineForm.submit();
}



function UpdateWine(){

	if(updateWineForm.w_name.value === ""){
		alert("와인 이름을 입력해주세요!");
		updateWineForm.w_name.focus();
		return;
	}else if(updateWineForm.w_variety.value === ""){
		alert("포도 품종을 입력해주세요!");
		updateWineForm.w_variety.focus();
		return;
	}else if(updateWineForm.w_region.value === ""){
		alert("원산지 정보를 입력해주세요!");
		updateWineForm.w_region.focus();
		return;
	}else if(updateWineForm.w_color.value === ""){
		alert("와인의 색깔을 자유롭게 입력해주세요!");
		updateWineForm.w_color.focus();
		return;
	}else if(updateWineForm.w_aromas.value === ""){
		alert("와인의 향기를 자유롭게 입력해주세요!");
		updateWineForm.w_aromas.focus();
		return;
	
	}else if(isNaN(updateWineForm.w_vintage.value) === true || updateWineForm.w_vintage.value === ""){
		alert("빈티지는 숫자만 입력 가능합니다!");
		updateWineForm.w_vintage.focus();
		return;
	}else if(isNaN(updateWineForm.w_price.value) === true || updateWineForm.w_price.value === ""){
		alert("가격은 숫자만 입력 가능합니다!");
		updateWineForm.w_price.focus();
		return;
	}else if(isNaN(updateWineForm.w_alcohol.value) === true || updateWineForm.w_alcohol.value === ""){
		alert("도수는 숫자만 입력 가능합니다!");
		updateWineForm.w_alcohol.focus();
		return;
		
	}else if(updateWineForm.w_category.value === "default"){
		alert("카테고리를 선택해주세요!");
		updateWineForm.w_category.focus();
		return;
	}else if(updateWineForm.w_body.value === "default"){
		alert("바디감의 정도를 선택해주세요!");
		updateWineForm.w_body.focus();
		return;
	}else if(updateWineForm.w_bitter.value === "default"){
		alert("쓴 맛의 정도를 선택해주세요!");
		updateWineForm.w_bitter.focus();
		return;
	}else if(updateWineForm.w_acidity.value === "default"){
		alert("신 맛의 정도를  선택해주세요!");
		updateWineForm.w_acidity.focus();
		return;
	}else if(updateWineForm.w_sweet.value === "default"){
		alert("단 맛의 정도를  선택해주세요!");
		updateWineForm.w_sweet.focus();
		return;
	}
	document.updateWineForm.submit(); 
}
