// JavaScript Document
jQuery(function($){

	/*
		LoginMenu headerMenu
	*/
	var $btn = $('td a#LoginMenu');
	$btn.css('cursor', 'pointer');
	$btn.toggle(function(){
		$(this).parent().parent().parent().parent().next().slideDown(200);
	},function(){
		$(this).parent().parent().parent().parent().next().slideUp(200);
	});
	
	var $btn = $('td a#LoginMenubtn');
	$btn.css('cursor', 'pointer');
	$btn.toggle(function(){
		$(this).parent().parent().parent().parent().next().slideDown(200);
	},function(){
		$(this).parent().parent().parent().parent().next().slideUp(200);
	});
	
	var $btn = $('td a#mainMenu');
	$btn.css('cursor', 'pointer');
	$btn.toggle(function(){
		$(this).parent().parent().parent().parent().next().slideDown(200);
	},function(){
		$(this).parent().parent().parent().parent().next().slideUp(200);
	});
	
	
	/*
		Customer Profile
	*/
	
	var $btn = $('.challengedDetail.trigger');
	$btn.css('cursor', 'pointer');
	$btn.toggle(function(){
		$(this).next().children().slideDown(1);
		$(this).children().addClass('open');
	},function(){
		$(this).next().children().slideUp(1);
		$(this).children().removeClass('open');
	});
	/*
		Customer FeedBack
	*/
	
	var $btn = $('li .cBlockheadWrapper.trigger');
	$btn.css('cursor', 'pointer');
	$btn.toggle(function(){
		$(this).next().children().slideDown(200);
		$(this).children().addClass('open');
	},function(){
		$(this).next().children().slideUp(200);
		$(this).children().removeClass('open');
	});

});





