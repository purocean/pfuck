   �         &https://passport.qbao.com/js/common.js     %gqJ8     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   %application/javascript; charset=utf-8   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 11:22:59 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:28 GMT   X-Cache   hit var highlightcolor="#fc3";
var ns6=document.getElementById&&!document.all;
var previous='';
var eventobj;

// SET FOCUS TO FIRST ELEMENT AND HIDE/SHOW ELEMENTS IF JAVASCRIPT ENABLED


// REGULAR EXPRESSION TO HIGHLIGHT ONLY FORM ELEMENTS
	var intended=/INPUT|TEXTAREA|SELECT|OPTION/

// FUNCTION TO CHECK WHETHER ELEMENT CLICKED IS FORM ELEMENT
	function checkel(which){
		if (which.style && intended.test(which.tagName)){return true}
		else return false
	}

// FUNCTION TO HIGHLIGHT FORM ELEMENT
	function highlight(e){
		if(!ns6){
			eventobj=event.srcElement
			if (previous!=''){
				if (checkel(previous))
				previous.style.backgroundColor=''
				previous=eventobj
				if (checkel(eventobj)) eventobj.style.backgroundColor=highlightcolor
			}
			else {
				if (checkel(eventobj)) eventobj.style.backgroundColor=highlightcolor
				previous=eventobj
			}
		}
	}
	
	dynamicTimers = [];
	dynamicOption = {};
	
	showDynamicMsg = function(id, css, msg, time){
		if($('#' + id).size() == 0){
			$('body').append('<span id="' + id + '"></span>');
			dynamicOption[id] = {of: $(window)};
		}
		$('#' + id).hide();
		for(i in dynamicTimers){
			clearTimeout(dynamicTimers[i]);
		}
		dynamicTimers = [];
		
		$('#' + id).removeAttr("class").addClass(css).css('z-index', 9999).html(msg).fadeIn('blind', function() {
			$('#' + id).position(dynamicOption[id]);
			var timerId = setTimeout(function(){
				$('#' + id).fadeOut('blind');
			}, time || 3000);
			dynamicTimers.push(timerId);
		});
	}

	showDynamicErrorMsg = function(msg, time){
		msg = msg || '';
		if(msg == '' || msg == '网络错误'){
			return;
		}
		var isIE6=!!window.ActiveXObject && !window.XMLHttpRequest;
		if(isIE6){
			showDynamicMsg('hyip_float_message', 'hyip-failed', msg, time);
		}else{
			var width = (msg.length > 10)?500:150;
			$.floatingMessage(msg, {
				show: "blind",
				hide: "puff",
		        width: width,
		        height: 20, 
		        time: time || 3000,
		        position: 'top-left',
		        className: 'hyip-failed'
		    });
		}
	}