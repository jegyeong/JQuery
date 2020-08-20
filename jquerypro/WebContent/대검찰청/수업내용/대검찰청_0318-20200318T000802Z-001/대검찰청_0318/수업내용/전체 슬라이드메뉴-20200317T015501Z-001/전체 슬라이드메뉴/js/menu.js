/**
 * 
 */
$(document).ready(function(){
     
    $("#nav .gnb > li > a").on("mouseenter", function(){
        $("#header").addClass("header_on").stop().animate({"height":"490px"},400);
        $(".arr > span").stop().animate({"top":"0"},300);
    });
    $("#header").mouseleave(function(){
        $("#header").removeClass("header_on").stop().animate({"height":"96px"},400);
        $(".arr > span").stop().animate({"top":"10"},300);
    });
    $("#header > #nav > ul a:eq(0)").on("focusin" , function(){
        $("#header").removeClass("header_on").stop().animate({"height":"96px"},400);
        $(".arr > span").stop().animate({"top":"10"},300);
    });
 
    $("#nav .gnb > li").hover(function() {
        if ($(this).attr("class") != "active") {
            $(this).addClass("on");
        }
    },function() {
        if ($(this).attr("class") != "active") {
            $(this).removeClass("on");
        }
    });
});