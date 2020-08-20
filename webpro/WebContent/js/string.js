/**
 * 
 */
var str = "I love you";
var str2 = ", 이혁진 ";

function proc1(){
	var ch = str.charAt(7);
	var chCode = str.charCodeAt(7);
	
	document.getElementById("result").innerHTML 
	= ch +", 유니코드:" + chCode;
	
}

function proc2(){
	var index = str.indexOf("o", 4); //4번째 인덱스 부터 검색
	var lastIndex = str.lastIndexOf("o");
	
	/*
	 * str.indexOf("1");  //-1을 리턴한다 , 없는 문자검색시 -1리턴
	 * */
	
	document.getElementById("result").innerHTML 
	= index +","+lastIndex;
}
function proc3(){
	//var newStr = str + str2;
	var newStr = str.concat(str2); 
	document.getElementById("result").innerHTML  = newStr;
	
}

function proc4(){
	
	//alert(str);
	//alert(str.trim());
	
	//document.getElementById("result").innerHTML = str;
	//str에 공백이 있더라도 innerHTML로 들어가게 되면 공백이 제거된 상태로 출력됨
	
}
function proc5(){
	alert(str.toLowerCase());
	alert(str.toUpperCase());
	
}
function proc6(){
	alert(str.substring(3));
	document.getElementById("result").innerHTML = str.substring(0, 3);
	
}

function proc7(){
	alert(str.substring(3));
	alert(str.slice(-5));
	
	
} 

function proc8(){
	var str = "이혁진&홍종욱&박정민";
	
	var strArr = str.split("&");
	console.log(strArr);
	
	for(var i in strArr){
		alert(strArr[i]);
	}
	
	
	document.getElementById("result").innerHTML = strArr;
	
	
}












