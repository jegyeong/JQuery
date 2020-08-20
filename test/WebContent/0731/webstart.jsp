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
  <script src="${pageContext.request.contextPath}/js/webscript.js"></script>
  <script>
    $(function(){
    	$('.dropdown').click(function(){
    		event.preventDefault();
    		
    		menu = $('.dropdown-toggle',this).text();  //주메뉴
    		submenu = $('.dropdown-menu li a', this).text(); //부메뉴 
    	    //alert(menu + "," + submenu)
    	    
    	    //map()을 이용 해서 submenu를 공백기준으로 짜른다 
    	    sub2 = $('.dropdown-menu li a', this).map(function(){
    	    	//alert($(this).text());
    	    	return $(this).text();
    	    })
    	    //dropdown메서 얻어진 각 메뉴를 content에 줄력 
    	    var code = "<div class='list-group'>";
    	    code += "<a href='#' class='list-group-item disabled active'>" + menu + "</a>";
    	    $.each(sub2, function(i,v){
    	    	code +="<a href=# class='list-group-item'>" + v + "</span></a>" ; 
    	    })
    	    code += "</div>";
       	    $('.sidenav').html(code);
    	})
    	///////////////////////////////
    	//content의 왼쪽에서 부메뉴를 클릭하면 content의 오른쪽에 표시 
    	//delegate를 이용- 부모요소가 필요 - 클래스에 disabled가 포함되어 있지 않을때
    	$('.sidenav').on('click', '.list-group-item', function(){
    		  if( $(this).attr('class').match('disabled') == null) {
    		 	 subtxt =  $(this).text().trim();
    		 	 $('.text-left h1').text(subtxt);
    		 	 proc();
    		  }
    		  
    	})
    	////navheader의 dropdown메뉴를 클릭하면 content의 오른쪽에 표시//////////////////////////////////////////
    	$('.dropdown-menu li a').click(function(){
    		 subtxt =  $(this).text().trim();
  		     $('.text-left h1').text(subtxt);
  		     proc();
    	})
    	
    	 //회원가입
		$('.naveLogo .nav li a').on('click', function(){
			  subtxt = $(this).text().trim();
			  $('.text-left h1').text(subtxt);
			  proc(); //메소드 호출 : subtxt에 따라서 content의 내용을 변경한다 
		}) 
    	///////////////////////////////////
    	function proc(){
    	  if(subtxt =="진행중인이벤트"){
    		  procUrl("${pageContext.request.contextPath}/0720/test_img_sale.html");  //함수호출 
    	  }else if(subtxt =="공지게시판"){
    		  procUrl("${pageContext.request.contextPath}/0725_ajax/lprod.html");
    	  }
    	}
    	
    })
    
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

 <jsp:include page="navheader.jsp" />
 <jsp:include page="content.jsp" />
 <jsp:include page="footer.jsp" />
   



</body>
</html>
    
    
    
    
    
    
    
    
    
