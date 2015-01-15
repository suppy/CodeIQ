/**
 * プログラムコードをハイライト表示する
 * 以下のファイルを事前に読み込むこと
 * /js/jquery.snippet.min.js
 * /css/jquery.snippet.min.css
 */
$(function(){

	if(typeof $.fn.snippet == "function"){
		$("pre.highlight").each(function(){
			var lang = $(this).attr("lang");
			var myBox = $(this).attr("box");
			var myBoxColor = $(this).attr("boxColor");
			var myBoxFill = $(this).attr("boxFill");
			var myShowNum = $(this).attr("showNum") == "false" ? false : true;
			if(lang){
				$(this).snippet(lang, {style:"typical",showNum:myShowNum, menu:false, box:myBox, boxColor:myBoxColor, boxFill:myBoxFill});
			}
		});
	}

	if(typeof Behave == "function"){
		new Behave({
			textarea: 		document.getElementById('editor'),
			replaceTab: 	true,
			softTabs: 		true,
			tabSize: 		4,
			autoOpen: 		true,
			overwrite: 		true,
			autoStrip: 		true,
			autoIndent: 	true
		});

	}


});