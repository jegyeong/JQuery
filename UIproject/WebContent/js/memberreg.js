/**
 * 
 */

var regProcess = function(){
	//정규식체크 
	 
	//1. 이름 규칙 검사
	//입력한 값
	namevalue = $('#name').val();
	
	// 공백 체크
	if(namevalue.trim().length == 0){
		alert("이름을 입력하세요");ㅣ
		return;
	}
	
	// 길이 체크
    if(namevalue.trim().length < 2 || namevalue.trim().length > 10){
    	alert("이름은 2~10 사이입니다.");
    	return;
    }
	
	//입력한 값을 비교하는 규칙(정규식)
	//한글 또는 영문으로 입력
	nameReg = /^[가-힣]{2,5}$|^[a-zA-Z]{5,10}$/;
	if(!(nameReg.test(namevalue))){
		alert("이름 오류!");
		return false;
	}

	//2. 비밀번호 체크 - 전방체크 (?:찾는문자열)
	//0번이상 나오는 문자뒤에 대문자을 기준으로 전방에 아무것도 없다 - 대문자로 시작  
	//0번이상 나오는 문자뒤에 소문자를 기준으로 전방에 아무것도 없다 - 소문자로 시작
	//0이상 나오는 문자 뒤에 숫자를 기준으로 전방에 아무것도 없다 - 숫자로 시작 
	passvalue = $('#pwd').val();
	
	// 공백 체크 
    if(passvalue.trim().length <= 0){
    	alert("비밀번호를 입력하세요");
    	return;
    }
	
	// 길이 체크
    if(passvalue.trim().length < 8 || passvalue.trim().length > 13){
    	alert("비밀번호는 8~15 사이입니다.");
    	return;
    }
	
	// 정규식
	passReg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[#@$%^&*!]).{8,12}$/;
	if(!(passReg.test(passvalue))){
		alert("비밀번호 형식 오류!");
		return false;
	}
  /////////////////////////////////////////////////////////////////////
	/*//\w+(?=찾는 문자열) - > \w+(?=:)  
	           //-> :를 찾아서 그것을 기준으로 전방(앞)에 한번	이상 나타나는 문자 
	
	//aa = "http://www.naver.com";
	aa = "https://www.naver.com";
	
	reg = /\w+(?=:)/
	
	bb = aa.match(reg);
	if(bb == "http"){
		alert(bb + "처리 ");
	}else if(bb == "https"){
		alert(bb + "처리");
	}
	*/
	
	//3. 전화번호 규칙 검사
	//입력한 값
	phonevalue = $('#tel').val();
	//정규식
	phoneReg =/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
	if(!(phoneReg.test(phonevalue))){
		alert("전화번호 오류!");
		return false;
	}
	
	//4. 이메일 규칙 검사
	
	//입력한 값
	emailvalue = $('#email').val();
	
	// 공백 체크 
    if(emailvalue.trim().length <= 0){
    	alert("이메일을 입력하세요");
    	return;
    }
	
	//정규식
	emailReg = /^[0-9a-zA-Z]+@[0-9a-zA-Z_-]+(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!(emailReg.test(emailvalue))){
		alert("이메일 형식 오류!");
		return false;
	}
	
	
	////////////////////////////////////////
	
	//다 체크가 정상적으로 완료되면 
	return true ;

	
}





