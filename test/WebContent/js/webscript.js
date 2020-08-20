/**
 * 
 */

//webstart.jsp에서 서브메뉴클릭 이벤트시에  procUrl함수 호출 
//함수 호출시 load할 html또는 jsp페이지를 
//url파라미터변수에 넘어온다 
var procUrl = function(url){
	$('.text-left #result').load(url);
	
}