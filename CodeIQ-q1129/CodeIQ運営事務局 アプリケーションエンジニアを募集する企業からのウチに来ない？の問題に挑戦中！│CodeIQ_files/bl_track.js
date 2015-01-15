(function(){

	function track_host() {
		var track_host="http://d-track.send.microad.jp";
		if(document.location.protocol=="https:"){
			track_host="https://d-track.send.microad.jp";
		}
		return track_host;
	}

	function pc_track(co_account_id, group_id, country_id, version) {
		var encode_url=escape(document.referrer);
		var blade_query="co_account_id="+co_account_id+"&group="+group_id+"&country_id="+country_id+"&ver="+version+"&referrer="+encode_url;
		var blade_url=track_host()+"/bl_track.cgi?"+blade_query;
		var blade_target=new Image();
		blade_target.src=blade_url;
	}

	function sp_track(co_account_id, group_id) {

		var init = function () {
			var microadDevice = new MicroadBladeDevice(navigator.userAgent);
			if (microadDevice) {
				new BladeSponsorAccess(co_account_id, group_id, microadDevice, track_host());
			}
		};

		var jsList=[];
		var loader = function () {
			var o = jsList.length;
			for (var i = 0; i < jsList.length; i++) {
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.charset = 'utf-8';
				s.src = jsList[i];
				s.onload = function () {
					o--;
					if(o == 0) init();
				};
				document.body.appendChild(s);
			}
		};
		var jsURI="http://d-cache.microad.jp";
		if(document.location.protocol=="https:"){
			jsURI="https://d-track.send.microad.jp";
		}
		jsList.push(jsURI+"/js/device.js");
		jsList.push(jsURI+"/js/sponsor.js");
		jsList.push(jsURI+"/js/prefs.js");
		if (document.readyState === 'loading') {
			document.addEventListener('DOMContentLoaded', loader, true);
		} else {
			loader();
		}
	}
	
	function bl_track(co_account_id, group_id, country_id, version) {
		if(/(iPhone|iPod|iPad|Android)/.test(navigator.userAgent)){
			sp_track(co_account_id, group_id);
		} else {
			pc_track(co_account_id, group_id, country_id, version);
		}
	}	

	function parse_blade_script() {
		var scripts = document.getElementsByTagName('script');
		
		var target_params = new Array();
		
		for (var i = 0; i < scripts.length; i++) {
			if (document.getElementsByTagName('script')[i].innerHTML.indexOf('blade_',0)>-1 && document.getElementsByTagName('script')[i].innerHTML.match(/.*blade_co_account_id[ |\t]*=[ |\t]*[\'|\"](\d+)[\'|\"].*[\s|.]*.*blade_group_id[ |\t]*=[ |\t]*[\'|\"](\w*)[\'|\"].*/)) {
				var target_param = new Object();
				target_param['blade_co_account_id'] = RegExp.$1;
				target_param['blade_group_id'] = RegExp.$2;
				target_params.push(target_param);
			}
		}

		if (typeof blade_complete_params == 'undefined') {
			blade_complete_params = new Object();
		}
		
		for (var i = 0; i < target_params.length; i++) {
			var target_blade_co_account_id = target_params[i].blade_co_account_id;
			var target_blade_group_id = target_params[i].blade_group_id;
			var country_id = '1';
			var version = '';
			
			var key = target_blade_co_account_id + '_' + target_blade_group_id;
			if (key in blade_complete_params) {
				continue;
			}
			
			bl_track(target_blade_co_account_id, target_blade_group_id, country_id, version);
			
			blade_complete_params[key] = target_params[i];
			break;
		}
	}

	parse_blade_script();

})();

