$(document).ready(function(){
	

	// hover(마우스오버&아웃 2가지가 동시에 걸리게 된다) 마우스 이벤트 주기
	$(".detail").hover( // 마우스를 가져다 댄 (hover) [ "," -> button 요소들과 a.more 요소 ] 모두에게 아래 함수 적용  [위 $("a.more").click(function() 와 동일 ]
		// 마우스를 가져다 대었을 때 
		function(){
			$(this).addClass('myhover'); // [ this = button, a.more ] 요소들에게 <- css 에 이미 작성되어 있었던  ".myhover " 클래스를 더해준다. 
		},
		// 마우스를 떼었을 때
		function(){
			$(this).removeClass('myhover');
		}
	);
	
	

	// < 페이지 나누기 >
	
	// 페이지 수 나누기
	var rows = $(".wine_mainlist").find(".wine_itemlist").length; // tr 항목들을 배열처리 후 그 갯수를 출력
	var per_page = 3; // 페이지 당 행 수
	var no_pages = Math.ceil(rows / per_page); // 페이지 수 계산하기 // Math.ceil() : 올림  // .ceil() : 올림, .floor() : 내림, .round() : 반올림 

	// 나뉘어진 페이지로 이동할 navigator(페이지 번호표) 생성 & 출력
	var pNumbersCover =$("<nav align='center'></nav>");
	var pNumbers = $("<ul class='pagination pagination-lg'></ul>"); // 새로운 div 를 만들어서 넣어주는 것
	for (var i = 0; i < no_pages; i++){
		$("<li class='page'><a href='#'>" + (i+1) + "</a></li>").appendTo(pNumbers); // 실제 페이지 linked numbers : span 태그를 만든 후, div 태그 안의 자식으로 밀어넣어 주는 것
	}
	pNumbersCover.append(pNumbers)
	pNumbersCover.insertAfter(".wine_mainlist"); //  table의 다음에 div 넣어준다.

	// 전체 행 숨기고 행들을 배열로 변수에 담아주기 
	$(".wine_mainlist").find(".wine_itemlist").hide(); // 처음에는 모두 다 숨겨버리기
	
	var t = $(".wine_mainlist .wine_itemlist"); // 동일한 [tr = 행] 들이 모두 배열로 t에 담기게 된다.
	
	// 초기값 = 1페이지 보여주기 
	for(var j = 0; j < per_page; j++){
		$(t[j]).show(); // per_page = 3 이므로 3개까지만 보여준다.
	}
	
	// 누르는 페이지 번호에 따라 페이지 출력해주기 
	$("li").click(function(){ // span = page = 페이지 번호리스트
		$(".wine_mainlist").find(".wine_itemlist").hide();  
		// this = span = page = 페이지 번호 리스트 -> 1~4 숫자 
		for(var k = ($(this).text() - 1) * per_page; k < ($(this).text() * per_page); k++){
			// 페이지번호 1을 클릭했을 때   ->   for(k=(1-1) * 3; k < (1*3); k++){}  ==  for(k=0; k<3; k++){ $t[k].show } -> t[0] ~ t[2]
			// 페이지번호 2를 클랙했을 때   ->   for(k=(2-1) * 3; k < (2*3); k++){}  ==  for(k=3; k<6; k++){ $t[k].show } -> t[3] ~ t[5]
			$(t[k]).show();
		}
	});
});