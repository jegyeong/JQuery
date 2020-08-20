<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <script>
    var board  = {} //자바 스크립트 객체 
    var currentPage = 1;
  
 $(function(){
   var writeServer = function(){
	   $.ajax({
	 		url : 'BoardWrite',
	 		type : 'post',
	 		data : $('#writeForm').serialize(),
	 		dataType : 'json',
	 		success : function(res){
	 			alert(res.status); //성공혹은 실패
	 			$('#writeModal').modal("hide");
	 			readServer(1);
	 		},
	 		error : function(xhr){
	 			alert("상태 : " + xhr.status);
	 		}
	 	})
   }     
  /////////////////////////////////////////
  //board1테이블의 내용을 가져오기 위한 function readServer() {  }
    var readServer = function(cpage){
    		
    	$.ajax({
    			url : '${pageContext.request.contextPath}/BoardList',
    			type : 'get',
    			data : {'cpage' : cpage},  //data : "cpage=" + cpage,
    			dataType : 'json',
    			async : false,
    			success : function(res){
    				totalp = res.totalpage;
    				code = "";
    				$('#accordionList').empty();
    				$.each(res.data, function(i, v){
    					code +='<button class="accordion">' + v.subject + '</button>';
    					code += '<div class="panel">';
    					code += "<p style='width: 80%; float: left;'>작성자 : " +  v.writer 
				            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				            + "이메일 : " + v.mail + "</p>"
				            + '<p style="text-align:right; vertical-align:top;"><button idx="' 
				            + v.seq + '" name="modify" class="action">수정</button><button idx="' 
				            + v.seq + '" name="delete" class="action">삭제</button></p>'
				            + "<hr/>";
				        code += "<p>" + v.content + "</p>"
			            code += '</div>';
    				})
    				$('#accordionList').append(code);
    				//setting();
    				
    				//페이지버튼 생성 
    				$('#btngroup1').empty();
    				for(i=1; i<=totalp; i++){
    					$("<button class='paging'></button>").text(i).appendTo('#btngroup1');
    				}
    			},
    			error : function(xhr){
    				alert("상태 :" + xhr.status);
    			}
    	})
   }
   ////////////////////////////////////////////////////////////////////////////////
   var viewServer = function(seq) {
		$.ajax({
			url: '${pageContext.request.contextPath}/UpdateServlet',     // 
			type: 'GET',
			async: false,   //동기처리 .  리스트의  수정버튼 클릭하는  modify에서 viewServer를 호출 해서 수행힌디 .  
			//timeout: 10000,          // viewServer 처리후에 moodify의 다음처리를 계속한다-board객체를 사용함
			data: {                    //만약 동기가 아니면  board객체에 값이 생성되지 않은 상태에서 
				seq: seq,             //moodify의 다음처리를 하게 될 수도 있다 
				//cpage: cpage
			},
			dataType: 'json',
			success: function(res) {   //select한 결과를 board객체에 담는다 
				board.seq = res.seq;
				board.subject = res.subject;
				board.writer = res.writer;
				board.mail = res.mail;
				board.content = res.content;
			},
			error: function(xhr, status, error) {
				alert('에러 : ' + status + '\n\n' + error);
			}
		});			
	};
    ///////////////////////////////////////////////////////
    var updateServer = function(cpage){
    	//alert("update cpage=" + cpage + " curr=" + currentPage);
    	
    	console.log($('#updateForm').serialize());
    	$.ajax({
    		url : '${pageContext.request.contextPath}/UpdateServlet',
    		type : 'post',
    		data : $('#updateForm').serialize(),
    		dataType : 'json',
    		success : function(res){
    			alert(res.flag);
    			$('#updateModal').modal("hide");
    			readServer(cpage);
    		},
    		error : function(xhr ){
    			alert("상태:" + xhr.status );
    		}
    	}) 
    }
    ///////////////////////////////////////////////////////
    var deleteServer = function(seq, pass){
    	$.ajax({
    		url : '${pageContext.request.contextPath}/DeleteServlet',
    		type : 'get',
    		data : {
    			 "seq" : seq,
    			 "pass" : pass
    		},
    		dataType : 'json',
    		success :  function(res){
    			
					alert('res=' + res.flag );
		        	$('#deleteModal').modal("hide");
					readServer(currentPage);
     		},
    		error : function(xhr){
    			alert("상태:" + xhr.status +'\n' + error);
    		}
    	})
    }
  //////////////////////////////////////////////////////////////////////////////
    	readServer(1); //리스트 최초 실행 
    	
   /////아코디언 접었다 펼쳤다 //////////////////////////////////////////////////////// 	
    	var acc = $('.accordion');
    	$('#accordionList').on('click','.accordion', function(){
    		// $(this).toggleClass("active");
    		 panel = $(this).next();
    		 //alert(panel.scrollHeight);
    		// alert(panel.prop('scrollHeight'));
     	    if(panel.css('maxHeight') =='0px'){
     	    	panel.css('maxHeight', panel.prop('scrollHeight') + "px" )
      	    }else {
     	    	panel.css('maxHeight', '0px');
     	    }
    	})
  ///////////////////////////////////////////////////////////////

/////////////이벤트 ////////////////////////////////////////
////글쓰기 / 수정/ 삭제  이벤트   --  각 해당 modalDialog창 띄우기  //////////////////////
   $(document).on('click', 'button.action', function(){
    		//alert(currentPage);
    		//글쓰기 다이아로그 띄우기 /////////////
    		if($(this).attr('name') == 'write') { //글쓰기
    			//alert("글쓰기");
    			$('#writeModal').modal();
    		}else if($(this).attr('name') == 'modify'){ //리스트의 수정버튼 - viewServer실행
    			
    			var idx = $(this).attr('idx');
    			//alert('수정 : ' + idx);
    			 //viewServer(idx)호츨
    			 //수정번호를 기준으로 select 해서 결과를 board객체에 담는다
    			 //viewServer 에서ajax 는 동기처리 해야 함 , viewServer에서  board객체에 값이 할당 되어  실행 왼료해야만 
    			 //board의  값을 이용해서 밑에 작업을 수행 할 수 있디 - 
    			 viewServer(idx);
    			
    			 //수정폼다이알로그의 요소에 viewServer에서 select한 결과(수정대상의 값, board객체의 값)을 출력 
    			 $('#updateModal').modal();
    			 // 그 검색 결과를 다이알로그 창에 출력 
   			     //board 객체에 담아진 내용을 꺼내서 출력 
   			     //1번 과정이 완전히 끝나야만 2번 과정을 수행 할 수 있다 
   			      $('#updateForm #u_seq').val(board.seq);
	   			  $('#updateForm #u_writer').val(board.writer);
	   			  $('#updateForm #u_subject').val(board.subject);
	   			  $('#updateForm #u_password').val(board.password);
	   			  $('#updateForm #u_mail').val(board.mail);
	   			  $('#updateForm #u_content').val(board.content);
	 		}else if($(this).attr('name') == 'delete'){       /////리스트의 삭제버튼///////////////////////////
    			
    			 idx = $(this).attr('idx'); //글의  seq번호
	 		     viewServer(idx);
	 		     $('#d_seq').val(board.seq);
	 		     $('#d_subject').val(board.subject);
    			 $('#deleteModal').modal();
    			
    		}
    	})
     	
    //////삭제  실행 - deleteModal창에서 확인 버튼 클릭시 ///////////////////////
   	$('#deleteModal #d_submit').on('click', function(){
    	pass = $('#deleteModal  #d_password').val();
    	seq = $('#deleteModal #d_seq').val();
   		deleteServer(seq,pass);
    })	
    //////수정 실행 - updateModal창에서 확인 버튼 클릭시 ///////////////////////
   	$('#updateModal #u_submit').on('click', function(){
    	updateServer(currentPage);
    })
    ///////글쓰기  writeModal창에서 확인 버튼 클릭시 /////////////////////////////
    $('#writeModal #w_submit').on('click', function(){
    	writeServer();
    })
    ///////페이지 버튼 클릭시 //////////////////////////////////////////////
     $('#btngroup1').on('click', 'button.paging', function(){
    	 currentPage = $(this).text();
		  //alert("current=" + currentPage);
		  readServer(currentPage);
	  })
  ///////////모달 다이알로그  닫기-close /////////////////////////////
    $("#writeModal").on('hide.bs.modal', function () {
   		//기존의 값 지우기  
    		$('#w_writer').val("");
    		$('#w_subject').val("");
    		$('#w_mail').val("");
    		$('#w_password').val("");
    		$('#w_content').val("");
    })
    $("#updateModal").on('hide.bs.modal', function () {
    	//기존의 값 지우기 
    	$('#u_seq').val("");
    	$('#u_writer').val("");
		$('#u_subject').val("");
		$('#u_mail').val("");
		$('#u_password').val("");
		$('#u_content').val("");
    })
    $("#deleteModal").on('hide.bs.modal', function () {
    	//기존의 값 지우기 
    	$('#d_subject').val("");
		$('#d_password').val("");
    })
 //////////////////////////////////////////////////////////////////////   
  })
</script>
  
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 15px;
    width: 100%;
    border: 2px double lightgray;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #58ACFA;
}

.accordion:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

.active:after {
    content: "\2212";
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin : 0px;
}
#btngroup2 {
		text-align: right;
		margin-top : 20px;
		margin-right : 20px;
		
}
#btngroup1{
 text-align : center;
}	
#btngroup1 button {
		margin: 3px;
		padding: 3px;
		width: 50px;
	}
</style>
</head>
<body>

<h2>Accordion with symbols</h2>
<p>In this example we have added a "plus" sign to each button. When the user clicks on the button, the "plus" sign is replaced with a "minus" sign.</p>
<div id="accordionList"></div>
<div id="btngroup1">paging처리 1 2 3 4 5</div>
<div id="btngroup2">
		<button name="write" class="action">글쓰기</button>
</div>
 
<!------------------------- writeModal 글쓰기폼 ----------------------------->
  <div class="modal fade" id="writeModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글쓰기</h4>
        </div>
        <div class="modal-body">
         <form id="writeForm">
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="w_subject"  name="subject" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
				<input type="text" id="w_writer" name="writer"  class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
				<input type="text" id="w_mail" name="mail" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label>
				<input type="password" id="w_password" name="password" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="content" class="w_header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
				<br />
				<textarea rows="10" name="content" cols="50" id="w_content" class="text ui-widget-content ui-corner-all"></textarea>
			</div>
	     <button id="w_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
	     </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
  </div>
 <!------------- 삭제  deleteModal  폼--------------------->
 <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글 삭제</h4>
        </div>
        <div class="modal-body">
          <form id="deleteForm" >
			<fieldset>
				<div>
				   <input type="hidden" name="seq" id="d_seq">
					<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
					<input type="text" id="d_subject" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
				</div>
				<div>
					<label for="password" class="header">비밀&nbsp;번호</label>
					<input type="password" id="d_password" class="text ui-widget-content ui-corner-all"/>
				</div>
			</fieldset>
			<button id="d_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
		  </form>
		</div>
		<div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
	  </div>
	</div>
 </div>
 
 <!---------- updateModal 수정폼 ---------------->
  <div class="modal fade" id="updateModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글 수정</h4>
        </div>
        <div class="modal-body">
         <form id="updateForm" >
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="u_subject"  name="subject" class="text ui-widget-content ui-corner-all"/>
			    <input type="hidden" name="seq" id="u_seq">
			</div>
			<div>
				<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
				<input type="text" id="u_writer" name="writer"  class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
				<input type="text" id="u_mail" name="mail" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label>
				<input type="password" id="u_password" name="password" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="content" class="u_header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
				<br />
				<textarea rows="10" name="content" cols="50" id="u_content" class="text ui-widget-content ui-corner-all"></textarea>
			</div>
			<button id="u_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
		   </form>
        </div>
        <div class="modal-footer">
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
  </div>
 
<script>
function setting(){
	var acc = document.getElementsByClassName("accordion");
	
    var i;

    	for (i = 0; i < acc.length; i++) {
    	  acc[i].addEventListener("click", function() {
    		
    	    this.classList.toggle("active");
    	    var panel = this.nextElementSibling;
    	    if (panel.style.maxHeight){
    	      panel.style.maxHeight = null;
    	    } else {
    	      panel.style.maxHeight = panel.scrollHeight + "px";
    	    } 
    	  });
    	}
	
}
</script>
</body>
</html>











