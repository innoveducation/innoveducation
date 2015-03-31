// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// require jquery
//= require jquery_ujs
//= require_tree .
vals = []; 
$(document).ready(function(){

	var searchinput = $('.search');
	var searchicon = $('.searchicon');

	var s1 = $('.search').val();
	var s2 = '';

	searchinput.focus(function(){ var val = $(this).val(); $(this).val((val == s1) ? s2 : val); });
	searchinput.focusout(function(){ var val = $(this).val(); $(this).val((val == s2) ? s1 : val); });
	searchicon.click(function(){ searchinput.focus(); });

	$('.sm').hover(function(){
		$('.sm').each(function(){
			$(this).parent().parent().children('ul').css('display', 'none');
		});
		$(this).parent().parent().children('ul').css('display', 'block');
		$(this).parent().parent().children('ul').css('z-index', '999999');
	},function(){
	});

	

	$('.sm').each(function(){
		$(this).parent().parent().children('ul').children('li').children('a').css('width', $(this).width() + 30 );
		$(this).parent().parent().children('ul').children('li').children('a').last().css('border-bottom', '10px solid #80abc3');
		
	});
	$('.top').hover(function(){
		$('.sm').each(function(){
			$(this).parent().parent().children('ul').css('display', 'none');
			$(this).parent().parent().children('ul').css('z-index', '0');
		});
	},function(){});
	$('.slider').hover(function(){
		$('.sm').each(function(){
			$(this).parent().parent().children('ul').css('display', 'none');
			$(this).parent().parent().children('ul').css('z-index', '0');
		});
	},function(){});

    $('.slider').smSlider({
		start           : 0,
		transition      : 'animate', //значения: 'animate' | 'fader'
		activeClass     : 'active',
		autoArr			: true,
		prev			: 'sm_prev',
		next			: 'sm_next',
		pagination		: false,
		typeCtrl		: 'dots', //по умолчанию: dots — айфоновские точки | numeric — нумерация
		subMenu			: false,
		subMenuClass	: 'sm_submenu-item',
		duration		: 1000,
		autoPlay		: true,
		delay			: 8000,
		subMenu			: true,
		subMenuClass	: 'more-item',
		hoverPause		: false,
		easing			: 'swing', //значения: 'swing', 'linear' (расширяется с jQuery easing)
		animationStart	: function(toIndex){
			//do something
		},
		animationComplete : function(toIndex){
			//do something
		}
	});
	carouselInstance = $("#carousel-gallery").touchCarousel({
		itemsPerMove: 4,
		scrollbar: true,
		scrollbarAutoHide: true,
		scrollbarTheme: "dark",
		pagingNav: true,
		snapToItems: false,
		scrollToLast: true,
		useWebkit3d: true,
		loopItems: true
	}).data('touchCarousel');
	$('.touchcarousel-container').width("99999px");
	
	var s2 = '';
	$(".form,.subscribe").each(function(index, Element){
		var e = $(this);
		vals[index] = e.val();
		e.focus(function(){ var val = $(this).val(); $(this).val((val == vals[index]) ? s2 : val); });
		e.focusout(function(){ var val = $(this).val(); $(this).val((val == s2) ? vals[index] : val); });
	});
	 
	
	$(".send").click(function(){
		var isERR = false;
		$(".form").each(function(n, e){
			if (($(this).val() == vals[n]) || ($(this).val() == "")) { isERR = true; return; }
		});
		
		if (isERR){
			jError($(".formError").html(),{autoHide : true, TimeShown : 3000,HorizontalPosition : 'center',VerticalPosition : 'center'});
		} else {
			$.ajax({
				type: 'get',
				url: "/mail",
				data: "name="+$(".fio").val()+"&email="+$(".phone").val()+"&message="+$(".message").val(),
				success: function(data) {
					jNotify($(".formSuccess").html(),{autoHide : true, TimeShown : 3000,HorizontalPosition : 'center',VerticalPosition : 'center'});
					$(".form").each(function(n, e){ $(this).val(vals[n]); });
				}
			});
		}
		return false;
	});
		
	$(".subscribe").keypress(function(e) {if(e.which == 13) {
		if ($(this).val() == ""){
			jError("Не введен адрес",{autoHide : true, TimeShown : 3000,HorizontalPosition : 'center',VerticalPosition : 'center'});
		} else {
			$.ajax({
				type: 'get',
				url: "/subscribe",
				data: "email="+$(this).val(),
				success: function(data) {
					jNotify("Подписка оформлена. Большое спасибо за внимание.",{autoHide : true, TimeShown : 3000,HorizontalPosition : 'center',VerticalPosition : 'center'});
					$(".subscribe").val(vals[vals.length - 1]);;
				}
			});
		}
		return false;        
    } });
	
});
