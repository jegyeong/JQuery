/**
 * 
 */
var idtest = function() {
   idvalue =   $('#id').val();
	  if(idvalue.trim().length == 0){
		  alert("아이디를 입력하세요!!");
		  return false;
	  }
	  
	  if(idvalue.length < 4 ||  idvalue.length > 15){
		  alert( idvalue.length   + " ..  4~15사이로 출력");
		  return false;
	  }
	
	  //영문자로 시작하면서 적어도  하나 숫자하나 
	 // regid = /^[a-z]+(?=.*[0-9]){4,14}/
	  regid = /^[a-z]+[0-9]{3,14}/
	  if(!(regid.test(idvalue))){
		  alert(" id 형식오류..");
		  return false;
	  }
	return true;
}

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
	
	/*// 길이 체크
    if(namevalue.trim().length < 2 || namevalue.trim().length > 11){
    	alert("이름은 2~11 사이입니다.");
    	return;
    }
	*/
	//입력한 값을 비교하는 규칙(정규식)
	//한글 또는 영문으로 입력
	nameReg = /^[가-힣]{2,5}$|^[a-zA-Z]{5,10}$/;
	if(!(nameReg.test(namevalue))){
		alert("이름 오류!");
		return false;
	}

	
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
  //. 비밀번호 체크 - 전방체크 (?:찾는문자열)
	//0번이상 나오는 문자뒤에 대문자을 기준으로 전방에 아무것도 없다 - 대문자로 시작  
	//0번이상 나오는 문자뒤에 소문자를 기준으로 전방에 아무것도 없다 - 소문자로 시작
	//0이상 나오는 문자 뒤에 숫자를 기준으로 전방에 아무것도 없다 - 숫자로 시작 
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


var regtest = function(){
	
	namevalue = $('#name').val();
	 if(namevalue.trim().length == 0){
		 alert("이름을 입력하세요");
		 $('#name').focus();
		 return false;
	 }
	
	 regname =/^[ㄱ-ㅎ가-힣]*|^[a-zA-Z]*/;
	 //alert(typeof regname);
	 //alert(typeof regname.toString());
	
	 if((regname.test(namevalue))){
		//alert("1");
		 rkor =/^[ㄱ-ㅎ가-힣]*$/;
		 reng =/^[a-zA-Z]*$/;
		
		//한글로 되어 있을때 2~ 10
		 if((rkor.test(namevalue))){
			// alert("2");
			 if(namevalue.length <2 || namevalue.length >10) {
				 alert("2~10 입니다");
				 return false;
			 } 
		     
         } else if((reng.test(namevalue))){
        	 //영문일때 5~20 
        	// alert("3");
			 if(namevalue.length <5 || namevalue.length >20) {
				 alert("5~20 입니다");
				 return false;
			 } 
	      }else {
	    	  //한글과 숫자, 영문과 숫자가 섞여있을때
	    	  alert("이름 형식오류");
	    	  return false;
	      }
	 }
	
	
	 
	 passvalue = $('#pwd').val();
		
		// 공백 체크 
	    if(passvalue.trim().length <= 0){
	    	alert("비밀번호를 입력하세요");
	    	return;
	    }
		
		// 길이 체크
	    if(passvalue.trim().length < 8 || passvalue.trim().length > 13){
	    	alert("비밀번호는 8~12 사이입니다.");
	    	return;
	    }
		
	    //. 비밀번호 체크 - 전방체크 (?:찾는문자열)
		//0번이상 나오는 문자뒤에 대문자을 기준으로 전방에 아무것도 없다 - 대문자로 시작  
		//0번이상 나오는 문자뒤에 소문자를 기준으로 전방에 아무것도 없다 - 소문자로 시작
		//0이상 나오는 문자 뒤에 숫자를 기준으로 전방에 아무것도 없다 - 숫자로 시작 
	    //소문자나대문자나특수문자나숫자로 시작하고 8~12사이의 문자
		// 정규식
		passReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#@$%^&*!]).{8,12}$/;
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
		
		//3. 전화번호 규칙 검사----------------
		//입력한 값
		phonevalue = $('#ptel').val();
		//정규식
		phoneReg =/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		if(!(phoneReg.test(phonevalue))){
			alert("전화번호 오류!");
			return false;
		}
		
		//4. 이메일 규칙 검사--------------
		
		//입력한 값
		emailvalue = $('#mail').val();
		
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