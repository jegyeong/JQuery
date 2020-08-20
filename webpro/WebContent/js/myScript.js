/**
 * 외부 스크립트 파일입니다.
 */
function gradeFunc(){
	var grade = prompt("성적을 입력해주세요 (A-F까지)");
	
	switch(grade){
		case "A" : alert("잘했어요!");
				   	break;
		case "B" : alert("좋은 점수군요!");
				  	break;
		case "C" : alert("괜찮은 점수군요!");
		  			break;
		case "D" : alert("좀 더 노력하세요!");
		  			break;
		case "F" : alert("다음학기 수강하세요!");
		  			break;
		
		default : alert("알 수 없는 학점입니다");
	}

}

function gradeInput(grade){	
	
	var grade = parseInt(grade /10);
	
	switch(grade){
		case 10 :
		case 9 : document.write("A");
				 break;
		case 8 : document.write("B");
				 break;
		case 7 : document.write("C");
		 break;
		case 6 : document.write("D");
		 break;
		
		default : document.write("F");
				 
	
	
	}
	
	
	
	
	
	
	/*힌트 : parseInt는 소수점일 경우 정수형으로 변경됨 */	
	/*스위치 문으로 
	 * 90점 이상이면 A
	 * 80점 이상이면  B
	 * 70점 이상이면 C
	 * 60점 이상이면 D
	 * 59점 이하는 F	 * 
	 * */
}
/* 가위,바위,보 문제  
 * 
 * 함수 호출 형태 function result(p1, p2) 
 * <<p1, p2 파라미터는 html 내부 스크립트에서 prompt로 입력받기 >>
 * p1,p2는 가위, 바위, 보 중에 하나의 텍스트를 입력받는다 
 * 
 * p1이 가위, p2가 보 라면 
 * "p1이 가위로 이겼습니다"라고 출력
 * 
 * p1이 바위, p2가 바위 라면 
 * "p1과 p2가 바위로 비겼습니다" 라고 출력
 * 
 * */


function result(p1, p2){
	
	if(p1 == p2){
		// 비겼습니다. 
		document.write("p1과 p2가 "+p1+"로 비겼습니다");
	}else{
		if(p1 == "가위"){
			if(p2 == "보"){
				document.write("p1이 "+p1+"로 이겼습니다")
			}
			
		}
		
		
	}
	
	
}




