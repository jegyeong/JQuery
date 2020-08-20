<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    $(function(){
	    $('.dropdown').on('click', function(){
	    	menu = $('.dropdown-toggle', this).text();
	    	submenu = $('.dropdown-menu li a', this).text();
	    	alert(menu + "\n" + submenu);
	    	
	    	//sub2 = submenu.split(" ")
	    	//map()을 이용해서 
	    	sub2 = $('.dropdown-menu li a', this).map(function(){
	    	          return  $(this).text()
	    	})
	    	
	    	
	    	code = '<div class="list-group">';
			code += '<a href="#" class="list-group-item active disabled">' +  menu + '</a>';
			$.each(sub2, function(i){
				code +='<a href="#" class="list-group-item">' + sub2[i] + '</a>'
			})
			code += "</div>";
			
			$('.sidenav').html(code); 
		 })++++++
		 
		 
		 $('.sidenav').on('click', '.list-group-item', function(){
			 if($(this).attr('class').match('disabled')) return;
			 // subtxt =    $(this).text().trim();
			 // $('.text-left h1').text(subtxt);
			  proc(this); //메소드 호출 : subtxt에 따라서 content의 내용을 변경한다 
		 })
		 
		 //드롭다운메뉴 
		$('.dropdown-menu li a').on('click', function(){
			 // subtxt =    $(this).text().trim();
			 // $('.text-left h1').text(subtxt);
			  proc(this); //메소드 호출 : subtxt에 따라서 content의 내용을 변경한다 
		 })
		 
		 //회원가입
		$('.navelogo .nav li a').on('click', function(){
			 // subtxt = $(this).text().trim();
			 // $('.text-left h1').text(subtxt);
			  proc(this); //메소드 호출 : subtxt에 따라서 content의 내용을 변경한다 
		}) 
		
		
  })
  
  function proc(aa){
	    	
	      subtxt = $(aa).text().trim();
	    	   
		  $('.text-left h1').text(subtxt);
	    	 
	    	if(subtxt == "회원가입"){ 
	    		//alert(subtxt);
	    		 $('.text-left #result').load('${pageContext.request.contextPath}/0727_ajax/memberJoin.html');
	    	}else if(subtxt == "1+1"){
	    		//alert(subtxt);
	    		$('.text-left #result').load('${pageContext.request.contextPath}/0720/test_img_sale.html');
	    	}else if(subtxt == "자유게시판"){
	    		// alert(subtxt);
	    		$('.text-left #result').load('${pageContext.request.contextPath}/0721/test_booklist.html');
	    	}
	    	
	    }
		 
    
  </script>
 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

      <jsp:include page="navheader.jsp"></jsp:include>
      <jsp:include page="content.jsp"></jsp:include>
      <jsp:include page="footer.jsp"></jsp:include>
      

</body>
</html>













    