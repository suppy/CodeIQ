/*
	Standards Compliant Rollover Script
	Author : Daniel Nolan
	http://www.bleedingego.co.uk/webdev.php
*/

function initRollovers() {
	if (!document.getElementById) return
	
	var aPreLoad = new Array();
	var sTempSrc;
	var aImages = document.getElementsByTagName('img');
	var bImages = document.getElementsByTagName('input');

	for (var i = 0; i < aImages.length; i++) {		
		if (aImages[i].className == 'imgover') {
			var src = aImages[i].getAttribute('src');
			var ftype = src.substring(src.lastIndexOf('.'), src.length);
			var hsrc = src.replace(ftype, '_on'+ftype);

			aImages[i].setAttribute('hsrc', hsrc);
			
			aPreLoad[i] = new Image();
			aPreLoad[i].src = hsrc;
			
			aImages[i].onmouseover = function() {
				sTempSrc = this.getAttribute('src');
				this.setAttribute('src', this.getAttribute('hsrc'));
			}	
			
			aImages[i].onmouseout = function() {
				if (!sTempSrc) sTempSrc = this.getAttribute('src').replace('_o'+ftype, ftype);
				this.setAttribute('src', sTempSrc);
			}
		}
	}
	for (var i = 0; i < bImages.length; i++) {		
		if (bImages[i].className == 'imgover') {
			var src = bImages[i].getAttribute('src');
			var ftype = src.substring(src.lastIndexOf('.'), src.length);
			var hsrc = src.replace(ftype, '_on'+ftype);

			bImages[i].setAttribute('hsrc', hsrc);
			
			aPreLoad[i] = new Image();
			aPreLoad[i].src = hsrc;
			
			bImages[i].onmouseover = function() {
				sTempSrc = this.getAttribute('src');
				this.setAttribute('src', this.getAttribute('hsrc'));
			}	
			
			bImages[i].onmouseout = function() {
				if (!sTempSrc) sTempSrc = this.getAttribute('src').replace('_o'+ftype, ftype);
				this.setAttribute('src', sTempSrc);
			}
		}
	}
}

try{
	window.addEventListener("load",initRollovers,false);
}catch(e){
	window.attachEvent("onload",initRollovers);
}




if(window.addEventListener) {
	//alert("load")
	window.addEventListener("unload", dummyLoad,false)
  window.addEventListener("load", initRollovers, false);
}
else if(window.attachEvent) {
  window.attachEvent("onload", initRollovers);
}
function dummyLoad(){
}

jQuery(function($){
	$('div#bnrRaksul div').click(function(){
		window.location = $(this).find('dl dt a').attr('href');
		return false;
	}).mouseover(function(){
		$(this).css('opacity',0.7);
	}).mouseout(function(){
		$(this).css('opacity',1.0);
	});
	
	overBtn($('.alpha'));
	
	function overBtn(elm){
		elm.mouseover(function(){
			$(this).css('opacity',0.7);
		}).mouseout(function(){
			$(this).css('opacity',1.0);
		});
	}
});
