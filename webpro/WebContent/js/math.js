/**
 * 
 */
function proc1(){
	var number = Math.floor(Math.random()*10 +1);
	/*1~10까지의 난수를 발생하고 해당 수를 맞추는 문제
	 * 
	 * prompt로 숫자를 입력하면 해당 난수보다 작성한 값이 작으면 "작성한 값이 작습니다."
	 * 해당 난수보다 작성한 값이 크면 "작성한 값이 큽니다"  
	 * 동일하면 "3번째에 맞췄습니다."
	 * */
		var inputNum =0;
		var count = 0;
		var res = "";
		while(true){
			inputNum = parseInt(prompt("숫자를 입력하세요"));
			count++;
			if(inputNum == number) break;
			else if(inputNum > number) alert("입력한 값이 큽니다.");
			else if(inputNum < number) alert("입력한 값이 작습니다.");
		}
	
		res = count +"번째에 맞췄습니다.";
	
	document.getElementById("result").innerHTML = res;
}

function proc2(){
	var arr = ["가위","바위","보"];
	/*0~2까지 난수를 발생시켜서 컴퓨터가 
	 * 가위, 바위, 보 중에서 하나를 선택할 수 있게 지정 */
	random = Math.floor(Math.random()*3); //0,1,2
	com = arr[random];
	
	
	/*prompt로 가위, 바위, 보를 입력하여 
	 * 컴퓨터와 비교시 
	 * 출력형태 ))
	 * "com:가위, user:바위"
	 * "이겼습니다", "졌습니다","비겼습니다."
	 * 
	 * 비겼을 경우는 한번 더 가위바위보 실행 
	 * */
	user = prompt("가위, 바위, 보 중에 하나를 입력하세요");
	
	if(user == com){
		alert("비겼습니다.");
		proc2();
	}else{
		switch(com){
			case "가위" :if(user == "바위") res = "이겼습니다.";
						else if(user =="보") res = "졌습니다.";
						break;
			case "바위" :if(user == "보") res = "이겼습니다.";
						else if(user =="가위") res = "졌습니다.";
						break;
			case "보" :	if(user == "가위") res = "이겼습니다.";
						else if(user =="바위") res = "졌습니다.";
						break;			
		}
		
	}
	
	document.getElementById("result").innerHTML =
		"com :"+com +", user:"+user +"<br>"+ res; 
	
}

function proc3(){
	var lotto = new Array();
	
	var res = "입력한 수 :";
	var rand = 0, idx =0;
	
	while(true){
		rand = Math.floor(Math.random()*45+1);
		res += rand +",";
		
		idx = lotto.indexOf(rand);
		if(idx == -1) lotto.push(rand);
		
		if(lotto.length >=6) break;
	}
	
	res += "<br>배열저장:"+lotto;
	document.getElementById("result").innerHTML = res;
	
}





