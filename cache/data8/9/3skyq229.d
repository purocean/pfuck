   �         +http://www.qbcdn.com/merchant/info/js/yu.js     %�}�      %^ �$h              �      
     O K   	   Server   NWS_Appimg_HY   Date   Sun, 28 Feb 2016 11:10:40 GMT   Cache-Control   max-age=7776000   Expires   Sat, 28 May 2016 11:10:40 GMT   Last-Modified   Fri, 19 Feb 2016 02:22:09 GMT   Content-Type   application/x-javascript   Content-Encoding   gzip   X-Cache-Lookup   Hit From MemCache Gz   Accept-Ranges   bytes /*2015.10.23 build by tuxuan*/
var APP = { 
	actConfirm:function(title,msg,fun,status,_this){//标题，内容，回调，状态（success,warn）,节点
		if(!status){ var status='warn'}
		var html='<div class="tip_cont"><span class="'+status+'"></span><div class="dialog">'+msg+'</div></div><div class="btn"><a href="javascript:void(0)" class="save_btn"><em>确&nbsp;定</em></a><a href="javascript:void(0)" class="clear_btn" onclick="APP.close(this)"><em>取&nbsp;消</em></a></div>';
		$('body').delegate('.save_btn','click',function(){ 
			if(fun) fun(_this);
			APP.close()
		})
		APP.alert(1,title,html,550);
	},
	alert:function(flag,title,msg,w){
		var len = $("div[name=tx_alert]").length + 1;
		var html = '<div class="alert" style="width:'+w+'px" id="tx_alert_'+len+'" name="tx_alert">';
		if(flag==1){
			html = html + '<div class="title"><a href="javascript:void(0)" onclick="APP.close(this)"></a>'+title+'</div>'+msg+'</div>';
		}else{
			html = html + msg + '</div>';
		}
		$("body").prepend(html);
 		APP.mask();
		APP.center('#tx_alert_'+len);
	},
	show:function(obj){
		$(obj).show();APP.center(obj);
		//$(window).scroll(function(){ APP.center(obj) });
		//$(window).resize(function(){ APP.center(obj) });
	},
	center:function(obj){
		var windowWidth = $(window).width();//document.documentElement.clientWidth
		var windowHeight = $(window).height();//document.documentElement.clientHeight;   
		var popupHeight = $(obj).height();   
		var popupWidth = $(obj).width();
		var index = parseInt( new Date().getTime()/1000 );
		$(obj).css({   
			"position": "fixed", 
			"margin-top":-Math.floor($(obj).height()/2)-60,
			"left": (windowWidth-popupWidth)/2,
			"top":'50%',
			"z-index":index
		}); 
		$(obj).stop().animate({"opacity":1,"margin-top":'+=60'},400);
	},
	close:function(obj){
		var obj = obj || $("div.alert div.title").find('a');
		$(obj).parents("div[name=tx_alert]").animate({"top":'-=60px',"opacity":"0"},400,function(){
			$(obj).parents("div[name=tx_alert]").remove();
			if($("div.alert").length<=0){
				//$("#filter").animate({"opacity":"0"},400,function(){$("#filter").remove() });		
				$("#filter").fadeOut();
				$("#filter").remove();		
			}
		})
	},
	mask:function(){
		if($("#filter").length<=0){
			var mybg="<div id='filter'></div>";
			var h=$("body").height() > document.documentElement.clientHeight ? $("body").height():document.documentElement.clientHeight;
			$("body").append(mybg);
			$("#filter").height('100%');
			$("#filter").animate({"opacity":"0.75"},400);
		}
	},
	delMask:function(){
		$("#filter").remove();
	},
    tips: function(status,msg,times,callback){
		var html='<div class="msgbox"><span class="msg_'+status+'">'+msg+'</span><span class="msg_right"></span></div>';
		var times = times || 1500;
		$("body").prepend(html);
 		APP.center($("div.msgbox"));
 		setTimeout(APP.delTips,times);
		if(callback){
			var timeout = parseInt(times) + 400;
			setTimeout(callback,timeout);
		}
	},
	delTips: function(){
 		$("div.msgbox").animate({"top":'-='+'30px',"opacity":"0"},400,function(){
			$("div.msgbox").remove();												
		})
	},
	request:function(str){
		var href=window.location.href;
		var p=str+'=';
		var array=href.split(p);
		if(array.length>1){
			var b=array[1].split('&').length;
			if(b>1){
				return array[1].split('&')[0];
			}else{
				return array[1];
			}	
		}else{
			return "";	
		}
	},
	getSeconds:function(){
      var date=new Date();
      var seconds=date.getTime();
      return seconds;
	},
	setCookie:function(name,value,days){
		var argv=APP.setCookie.arguments;
		var argc=APP.setCookie.arguments.length;
		var expires=(2<argc)?argv[2]:null;
		var path=(3<argc)?argv[3]:null;
		var domain=(4<argc)?argv[4]:null;
		var secure=(5<argc)?argv[5]:false;
		var expires = new Date(); 
		expires.setTime(expires.getTime() + days*24*60*60*1000);
		document.cookie=name+"="+escape(value)+((expires==null)?"":("; expires="+expires.toGMTString()))+((path==null)?"":("; path="+path))+((domain==null)?"":("; domain="+domain))+((secure==true)?"; secure":"");	
	},
	getCookie: function(name){
		var search = name + "=";
		var returnvalue = "";
		if (document.cookie.length > 0) {
		   offset = document.cookie.indexOf(search);
		   if (offset != -1) {      
				 offset += search.length;
				 end = document.cookie.indexOf(";", offset);                        
				 if (end == -1)
					   end = document.cookie.length;
				 returnvalue=unescape(document.cookie.substring(offset,end));
		   }
		}
		return returnvalue;
	}
}


