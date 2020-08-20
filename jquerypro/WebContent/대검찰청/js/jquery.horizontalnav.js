/*
jQuery Plugin for:
Horizontal navigation with animated sub nav Ver 1
Author: William Paoli
wpaoli@gmail.com
building58.com
*/

(function($){
    $.fn.animatedHorizontalNav = function(callerSettings) {

        var settings = $.extend({
            speed: 250,
            useHoverIntent: true
        }, callerSettings||{});

        var obj = this;

        settings.subNavHeight = '-' + obj.find('li ul li').outerHeight() +'px';

        //the total width of the menu..is this needed?
        var topListWidth = obj.outerWidth();

        obj.find('ul').css('width', topListWidth);

        //hide all the subnav li's
        obj.find('li ul li').css({
            'margin-top': settings.subNavHeight,
            'display': 'none'
        });

        var hoverStates = function(item){
            item.toggleClass('hover');
        };

        var rollOver = function () {
            var sub_items = $(this).parents('li').children('ul').find('li');
            var items = $(this).parents('li').not($(this).parents('li'));

                if ($(this).parents('li').children('ul').find('li:animated').length <= 0) {
                    slideDown(sub_items);
                } else {
                    setTimeout(
                    function(){
                        slideDown(sub_items);
                    },100);
                }
                $(this).parents('li').addClass('hover');
        };

        var rollOut = function () {
            var items = $(this).parents('li');
            if ($(this).parents('li').children('ul').length === 0) {
                hoverStates(items);                 
            }
        };

        //hoverItent and regular hover
        if (settings.useHoverIntent) {
            //hoverIntent configuration
            var hoverIntentConfig = {
                sensitivity: 1, // number = sensitivity threshold (must be 1 or higher)    
                interval: 28, // number = milliseconds for onMouseOver polling interval    
                timeout: 30, // number = milliseconds delay before onMouseOut    
                over: rollOver, // function = onMouseOver callback (REQUIRED)    
                out: rollOut // function = onMouseOut callback (REQUIRED)    
            };

            obj.find('li a').not(obj.find('li ul li a')).hoverIntent(hoverIntentConfig);        
        } else {
            obj.find('li a').not(obj.find('li ul li a')).hover(rollOver, rollOut);        
        }

        var slideUp = function (sub_items, removeHoverOnCallback) {
            sub_items.animate({
                'marginTop': settings.subNavHeight
            }, settings.speed, 
            function () {
                $(this).css('display', 'none');
                if (removeHoverOnCallback) {
                    $(this).parents('li').removeClass('hover');
                }
            });

            if (!removeHoverOnCallback) {
                sub_items.parents('li').removeClass('hover');
            }
        };

        var slideDown = function (sub_items) {
                sub_items.css('display', 'block').animate({
                    'marginTop': '0'
                }, settings.speed).dequeue(slideUp(obj.find('li ul li').not(sub_items)));
        };

        obj.bind('mouseleave', function () {   
                slideUp(obj.find('li ul li'), true);
        });
        
    };
})(jQuery);