(function(){
	sldnavDepth01 = {
		_queue : true,
		_duration : 338,
		sldnav : function(id) {
			$nav_slc = $("#"+id+">li"); 
			$displayBox = $("#"+id).parent().parent();
			
			$nav_slc.find(">a").mouseenter(function(){
				sldnavDepth01.menu_open($(this));
			}).focusin(function() {
				$(this).mouseenter();
			});
			$('a.sldnav_close').focusout(function() {
				sldnavDepth01.menu_close($(this));     
			});
			$('a.sldnav_close').click(function() {
				sldnavDepth01.menu_close($(this));
				return false;
			});
			$displayBox.mouseleave(function() {
				sldnavDepth01.menu_close($(this));
			});
		},
		menu_open : function(e) {
			var animatedObj = $(".dep02:animated");
			animatedObj.stop();
			var fromHeight = $(".dep02:visible").length>0?$(".dep02:visible").height():0;
			var toheight = e.next().children(".sub_nav").outerHeight();
			$(".dep02").hide();
			e.next().css("height", fromHeight +"px");
			e.next().show();
			$(".gnb_wrap>ul>li").removeClass("on");
			$(".gnb_wrap>ul>li").addClass("ov");
			$(".gnb_all").addClass("on");
			$("#allmenu_wrap").fadeOut( "fast", function() {
				$("#allmenu_wrap").css("disply", "none");
			});
			e.parent().addClass("on");
			e.parent().parent().parent().parent().addClass("ov");
			e.next().find(".sub_lft_nav").css("height", toheight +"px");
			e.next().animate({height: toheight +"px"},{queue: this._queue, duration: this._duration, 
				complete: function() {}
			});
			$displayBox.css("height", (toheight + 45) +"px");
		},
		menu_close : function(e) {
			$(".dep02:visible").animate({height: 0},{queue: this._queue, duration: this._duration, 
				complete: function() {
					$(".dep02").hide();
				}
			});
			$(".gnb_wrap>ul>li").removeClass("on");
			$(".gnb_wrap>ul>li").removeClass("ov");
			$(".gnb_all").removeClass("on");
			$("#gnb").removeClass("ov");
		
			$displayBox.css("height", "45px");
		}
	}
})();

$(document).ready(function() {
	$('.dep02').each(function () {
		$(this).css("overflow", "hidden");
		$(this).children('.sub_nav').height($(this).height());
		$(this).find('.sub_lft_nav').height($(this).height());
	});
	sldnavDepth01.sldnav("gnb_menu");
	/*
	$("ul.snb_wrap > li").each(function () {
		if ($(this).children("a").hasClass("hv") && $(this).children("ul").length > 0 &&  !$(this).children("ul").hasClass("on")) {
			$(this).bind("mouseenter", function () {
				$(this).css("overflow", "hidden");
				var animatedObj = $("ul.snb_wrap > li:animated");
				animatedObj.stop();
				animatedObj.height($(this).children("a").outerHeight());
				var toHeight = $(this).children("a").outerHeight() + $(this).children("ul").height() +1;
				//$(this).children("ul").css("display", "block");
				$(this).animate({
					height: toHeight +"px"
				},
				{ queue: true, duration: 300 }
				);
			});
			$(this).children("a").bind("focusin", function () {
				$(this).parent().css("overflow", "hidden");
				var animatedObj = $("ul.snb_wrap > li:animated");
				animatedObj.stop();
				animatedObj.height($(this).outerHeight());
				var toHeight = $(this).outerHeight() + $(this).parent().children("ul").height() +1;
				//$(this).children("ul").css("display", "block");
				$(this).parent().animate({
					height: toHeight +"px"
				},
				{ queue: true, duration: 300 }
				);
			});
			$(this).bind("mouseleave", function () {
				//$("ul.snb_wrap > li:animated").height(toHeight);
				//$("ul.snb_wrap > li:animated").stop();
				if ($(this).is(":animated")) {
					$(this).stop();
				}
				var toHeight = $(this).children("a").outerHeight();
				$(this).animate({
					height: toHeight +"px"
				},
				{
					queue: true,
					duration: 100,
					complete: function() {
						//$(this).children("ul").css("display", "none");
					}
				}
				);
			});

		}
	});*/
	if ($('#monthList').length > 0) {
		$('#monthList > ul > li').each(function () {
			$(this).children("a").bind("focusin", function () {
				$('#monthList > ul > li > div').removeClass("calOn");
				$(this).next().addClass("calOn");
			});
		});
	}
	$(".rt_nav>li.last>a").mouseenter(function(){
			$(".slc_lan").css("display","block");
		});

		$(".rt_nav>li.last").mouseleave(function(){
			$(".slc_lan").css("display","none");
		});
});

function allmenu_open() {
	if ($("#allmenu_wrap:visible").length < 1) {
		$("#allmenu_wrap").fadeIn( "fast", function() {

		});
		
				$(".dep02").hide();
		$(".gnb_wrap>ul>li").removeClass("on");
		$(".gnb_wrap>ul>li").removeClass("ov");
		$(".gnb_all").removeClass("on");
		$("#gnb").removeClass("ov");
	}
	else {
		$("#allmenu_wrap").fadeOut( "fast", function() {
			$("#allmenu_wrap").css("disply", "none");
		});
	}
}



function viewfamilySiteUL() {
	if ($("#familySiteUL:visible").length < 1) {
		$("#familySiteUL").fadeIn( "fast", function() {
		});
	}
	else {
		$("#familySiteUL").fadeOut( "fast", function() {
			$("#familySiteUL").css("disply", "none");
		});
	}
}
