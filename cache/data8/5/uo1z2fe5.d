   è         %http://www.qbcdn.com/csc/web/js/yu.js     %Á
      %^ =8              È      
     O K   	   Server   NWS_Appimg_HY   Date   Sun, 28 Feb 2016 11:10:42 GMT   Cache-Control   max-age=7776000   Expires   Sat, 28 May 2016 11:10:42 GMT   Last-Modified   Fri, 19 Feb 2016 02:41:55 GMT   Content-Type   application/x-javascript   Content-Encoding   gzip   X-Cache-Lookup   Hit From Disktank Gz   Accept-Ranges   bytes /*2015.10.23 build by tuxuan*/
var APP = { 
	actConfirm:function(title,msg,fun,status,_this){//æ é¢ï¼åå®¹ï¼åè°ï¼ç¶æï¼success,warnï¼,èç¹
		if(!status){ var status='warn'}
		var html='<div class="tip_cont"><span class="'+status+'"></span><div class="dialog">'+msg+'</div></div><div class="btn"><a href="javascript:void(0)" class="save_btn"><em>ç¡®&nbsp;å®</em></a><a href="javascript:void(0)" class="clear_btn" onclick="APP.close(this)"><em>å&nbsp;æ¶</em></a></div>';
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

jQuery.cookie = function(name, value, options) {   
    if (typeof value != 'undefined') { // name and value given, set cookie  
        options = options || {};  
        if (value === null) {  
            value = '';  
            options.expires = -1;  
        }  
        var expires = '';  
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {  
            var date;  
            if (typeof options.expires == 'number') {  
                date = new Date();  
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));  
            } else {  
                date = options.expires;  
            }  
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE  
        }  
        // CAUTION: Needed to parenthesize options.path and options.domain  
        // in the following expressions, otherwise they evaluate to undefined  
        // in the packed version for some reason...  
        var path = options.path ? '; path=' + (options.path) : '';  
        var domain = options.domain ? '; domain=' + (options.domain) : '';  
        var secure = options.secure ? '; secure' : '';    
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');  
    } else { // only name given, get cookie  
        var cookieValue = null;  
        if (document.cookie && document.cookie != '') {  
            var cookies = document.cookie.split(';');  
            for (var i = 0; i < cookies.length; i++) {  
                var cookie = jQuery.trim(cookies[i]);  
                // Does this cookie string begin with the name we want?  
                if (cookie.substring(0, name.length + 1) == (name + '=')) {  
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));  
                    break;  
                }  
            }  
        }  
        return cookieValue;  
    }  
};  




//å¤´é¨
'use strict';

$(function() {
  initSiteTop();
  initSiteNav();
  initSiteFooter();
  initUCMenu();
  initBCMenu();
  adjustLinkUs();
});

// èç³»æä»¬ï¼ä¸´æ¶ä¿®æ­£
function adjustLinkUs() {
  $('.contactUS .sinaWeibo a').attr('href', 'mailto:kefu@qbao.com');
}

// é¡¶é¨èååæ´
function initSiteTop() {
  // æ³¨åé28å
  var registerIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGEAAAAMCAYAAABybNMnAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzEwNzlGRTZCMzc5MTFFNUIzRDg5OTcwM0RBMTQxM0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzEwNzlGRTdCMzc5MTFFNUIzRDg5OTcwM0RBMTQxM0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3MTA3OUZFNEIzNzkxMUU1QjNEODk5NzAzREExNDEzRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3MTA3OUZFNUIzNzkxMUU1QjNEODk5NzAzREExNDEzRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PrXxvLIAAAF/SURBVHja7Fg9a4JBDH6tDl2Kg7tzf02lW/vzRBBXoXTxBzkVXLo3gR7EkDzJfdQuBgLevXeXryfJnbPz83r6pQvxcrrTzWlhTa4Ox+nrbXM1ZpJz0Xo09ua0vEK8zpprWVurZwtp+RZJOYvMgZYRWhAaF8dIwdZc5GTk+MxaLVOOPaB4jkPfagNZgjAnfpCHSyHW7xpESUMRalpRmEEe2qNtlrrKYGo7rG+t5YgDsCV+stDhpXNvJoxMf08ntDYqQ7cARJHBQdgRv3uLSpRrMiGqgRkjEFIjQERnW1k5IiORX5CPOAh74lfix0ipCM2WM/Rez3irTut9nh7ZYFjZnQGRp+OowHEQPohfiD957NW7DJq0MyzF/uI20nOW1Q9qMmpUT2A6EX/zOyF7xdPIRk13lKMzKK8te1GfarUhk12yJzTdJFAj67l/RzeobK1HezJX494AdD3WUF0fITzTEL1s9M7Pvj9k9iJdtSytI+oJKHBeD5nd/7b4f/oRYACD36FWYY4+eQAAAABJRU5ErkJggg==',
    $registerPrompt = $('<a />').attr({
      href: 'http://www.qbao.com/announcement/announce-detail.htm?id=101448',
      target: '_blank'
    }).append($('<img />').attr('src', registerIcon));

  var appendPrompt = function() {
    var $register = $('.site-header .menu-login'),
      $userName = $('.site-header .user-name');

    if ($register.length !== 0) {
      $register.append($registerPrompt);
      // æ¿æ¢æ³¨åé¾æ¥
      // $('.site-header a[href="http://user.qbao.com/usercenter/regist/toRegist.html"]').attr({
      //   href: 'https:/user.qbao.com/register/register.htm'
      // });
    } else if ($userName.is(':hidden')) {
      setTimeout(appendPrompt, 500);
    }
  };

  setTimeout(appendPrompt, 500);

  // æ¥çæ¶æ¯æ ·å¼åæ´
  var adjustCount = 0;
  var adjustMessage = function() {
    var $register = $('.site-header .menu-login'),
      $userMedal = $('.site-header .user-news .user-medal');

    if ($register.length !== 0) {
      return;
    } else if ($userMedal.length !== 0 && !$userMedal.is(':hidden')) {
      $userMedal.hide();
      if ($('.site-header .user-news .news-none').length === 0) {
        $('.user-message h2').after($('<a>').attr({
          target: "_blank",
          href: "http://www.qbao.com/messageboard/my/message.html",
          title: "æ¥çå¨é¨æ¶æ¯",
          class: "menu orange under-line",
          style: "position: absolute; top: 20px; right: 10px;"
        }).text('æ¥çå¨é¨æ¶æ¯'));
      }
    }
    if (adjustCount++ < 20) {
      setTimeout(adjustMessage, 500);
    }
  }

  setTimeout(adjustMessage, 500);
}

// ä¸»å¯¼èªåæ´
function initSiteNav() {
  var $newIcon = $('<em class="new"></em>');

  // éèæ´å¤èåï¼å å¥æ¨å¹¿èå
  $('.more-menu').hide();
  if ($('#site-menu-prompt').length === 0) {
    $('#site-menu-store').after($('<li id="site-menu-prompt"><a href="http://www.qbao.com/promote/index.html" target="_blank">æ¨å¹¿</a></li>'));
  }

  $('#site-menu-prompt').append($newIcon);
  // å¤©å¤©èªå
  // $newIcon.addClass('p2c');
  // $('#site-menu-activity').append($newIcon);
  // ç¯çä¸¤å°æ¶
  // $newIcon.addClass('auction');
  // $('#site-menu-auction').append($newIcon);

  // é·æåååæ´
  $('#site-menu-auction a').attr('href', 'http://paipai.qbao.com');
}

// ç¨æ·ä¸­å¿èååæ´
function initUCMenu() {
  // éèæ¨å¹¿ç®¡ççnewå¾æ 
  $('#prompt-management-menu .menu-new-icon').hide();
  // éèåºå¼çèå
  $('#auction-order-menu').hide();
  $('#auction-history-menu').hide();
  $('#group-redbag-menu').hide();
  // å å¥æ°èå
  if (!$('#auction-old-history-menu').length) {
    $('#auction-management-menu ul')
      .append($('<li class="submenu-item" id="auction-old-history-menu">' +
        '<a href="http://paipai.qbao.com/order/listUserOldAuction.html">ç«æè®°å½æ¥è¯¢</a>' +
        '</li>'));
  }
  // æ¿æ¢ç­¾å°æç»èå
  if ($('#sign-detail-menu').length) {
    $('#sign-detail-menu a')
      .attr({
        href: 'http://sign.qbao.com/sign/signTaskRandom/tablelist.html'
      })
      .text('é¢åæ¶ç');
  }
}

// åå®¶å¹³å°èååæ´
function initBCMenu() {}

// æ´ç«é¡µèåæ´
function initSiteFooter() {
  // å å¥"æ¿äº§ãçè´¢"èå
  $('#footer-money-link').hide();
  if (!$('#footer-house-link').length) {
    $('a[href="http://www.qianwang365.com/portal/aboutQianWang.html"]')
      .after($('<a id="footer-house-link" href="http://www.qbao.com/house/home.html" style="width: 63px" target="_blank">é±å®æ¿äº§</a>'))
      .after($('<br/>'));
  }
  // å å¥"åçå®"è®¤è¯å¾æ 
  if (!$('#footer-anquan-icon').length) {
    $('a[href="http://www.bj.cyberpolice.cn/index.jsp"]')
      .after($('<a href="http://v.pinpaibao.com.cn/authenticate/cert/?site=www.qbao.com&at=business" target="_blank" id="footer-anquan-icon">' +
        '<i style="display:inline-block; width:80px; height:31px; background-image:url(http://www.qbcdn.com/images/ft_img5.png)"></i>' +
        '</a>'));
  }
  // æ¢ææå¡ç­çº¿
  $('.site-footer ul li:eq(3)')
    .replaceWith($('<li><h2 style="font-size:16px;margin-bottom:2px">025-68226688 <span style="font-size:12px;color:#888;font-weight:normal;font-family:\'å¾®è½¯éé»\';">(åäº¬)</span></h2>' +
                   '<h2 style="font-size:16px;margin-bottom:5px;">400-153-6868 <span style="font-size:12px;color:#888;font-weight:normal;font-family:\'å¾®è½¯éé»\'">(å¨å½)</span></h2>' +
                   '<p class="mb10 foot_tips">7x24å°æ¶ éçæå¡</p>' +
                   '<p><a href="mailto:kefu@qbao.com">å®¢æé®ç®±ï¼kefu@qbao.com</a></p></li>'));
}



var QB = this.QB = this.QB || {};

QB.config = {};

QB.domain = {
  qhb: 'http://qhb.qbao.com',
  qbao: 'http://www.qbao.com',
  user: 'http://user.qbao.com',
  help: 'http://help.qbao.com',
  goods: 'http://goods.qbao.com',
  raise: 'http://bc.qbao.com',
  ticket: 'http://bq.qbao.com',
  events: 'http://events.qbao.com',
  auction: 'http://paipai.qbao.com',
  passport: 'http://passport.qbao.com',
  bizorder: 'http://bizorder.qbao.com',
  order: 'http://oc.qbao.com',
  qwang: 'http://www.qianw.com',
  cdn: 'http://www.qbcdn.com',
  store: 'http://store.qbao.com',
  mz: 'http://mzxy.qbao.com',
  paipai: 'http://paipai.qbao.com',
  mp: 'https://mp.qbao.com',
  bc: 'http://bc.qbao.com',
  task: 'http://task.qbao.com',
  enterprise: 'http://enterprise.qbao.com',
  imgUrl: "http://enterprise.qbao.com/webChat/business-center/"
};


if (this.Handlebars) {
  Handlebars.registerHelper('domain', function(name) {
    return QB.domain[name];
  });
}

/**
 * Utilities
 */
QB.utils = {
  addCommas: function(nStr) {
    nStr += '';
    var x = nStr.split('.'),
      x1 = x[0],
      x2 = x.length > 1 ? '.' + x[1] : '',
      rgx = /(\d+)(\d{3})/;

    while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
  }
};

if (this.Handlebars) {
  Handlebars.registerHelper('commas', function(nStr) {
    return QB.utils.addCommas(nStr);
  });
}

/**
 * Ajax Config
 */
if (this.jQuery) {
  //$(document).ajaxComplete(function(event, xhr) {
  //  if (xhr.responseText.indexOf('<title>ç¨æ·ç»å½ï¼é±å®ç½</title>') >= 0) {
  //    console.log('Ajax error, redirect!');
  //    window.location.href = QB.domain.passport + '/cas/qianbaoLogin?service=' + window.location.href;
  //    return;
  //  }
  //});
}

this["QB"] = this["QB"] || {};
this["QB"]["templates"] = this["QB"]["templates"] || {};
this["QB"]["templates"]["operate-crumbs"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var helper;

  return "  <a>"
    + this.escapeExpression(((helper = (helper = helpers.manager || (depth0 != null ? depth0.manager : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"manager","hash":{},"data":data}) : helper)))
    + "</a>\n <span>&gt;</span>\n";
},"3":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "  <a>"
    + alias3(((helper = (helper = helpers.managerName || (depth0 != null ? depth0.managerName : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"managerName","hash":{},"data":data}) : helper)))
    + "</a>\n <span>&gt;</span>\n <em>"
    + alias3(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</em>\n";
},"5":function(depth0,helpers,partials,data) {
    var helper;

  return "  <em>"
    + this.escapeExpression(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</em>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return "<div class=\"bussiness-crumbs\">æ¨çä½ç½®ï¼\n"
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.manager : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.managerName : depth0),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "</div>";
},"useData":true});
this["QB"]["templates"]["operate-list"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.data : depth0),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"2":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "    <tr attr="
    + alias3(((helper = (helper = helpers.userId || (depth0 != null ? depth0.userId : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"userId","hash":{},"data":data}) : helper)))
    + " type="
    + alias3(((helper = (helper = helpers.state || (depth0 != null ? depth0.state : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"state","hash":{},"data":data}) : helper)))
    + ">\n      <td class=\"w140\"><span>"
    + alias3(((helper = (helper = helpers.userName || (depth0 != null ? depth0.userName : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"userName","hash":{},"data":data}) : helper)))
    + "</span></td>\n   </tr>\n";
},"4":function(depth0,helpers,partials,data) {
    return "  <tr><td colspan=\"7\">ææ å°äºä¿¡æ¯ï¼</td></tr>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.data : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.program(4, data, 0),"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["refund-flow"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "<h3>æä½è®°å½</h3>\r\n<ul>\r\n"
    + ((stack1 = helpers.each.call(depth0,((stack1 = (depth0 != null ? depth0.returnInfo : depth0)) != null ? stack1.stepList : stack1),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</ul>\r\n";
},"2":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "    <li>\r\n        <div>\r\n            <span>"
    + alias3(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</span>\r\n            <em>"
    + alias3((helpers.formatTime || (depth0 && depth0.formatTime) || alias1).call(depth0,(depth0 != null ? depth0.time : depth0),{"name":"formatTime","hash":{},"data":data}))
    + "</em>\r\n        </div>\r\n        <p>\r\n            <em>"
    + alias3(((helper = (helper = helpers.type || (depth0 != null ? depth0.type : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"type","hash":{},"data":data}) : helper)))
    + "</em>\r\n            <span>"
    + alias3(((helper = (helper = helpers.content || (depth0 != null ? depth0.content : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"content","hash":{},"data":data}) : helper)))
    + "</span>\r\n        </p>\r\n"
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.imgUrls : depth0),{"name":"if","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "    </li>\r\n";
},"3":function(depth0,helpers,partials,data) {
    var stack1;

  return "        <dl>\r\n            <dd>\r\n            <span>å¾çï¼</span>\r\n            <i>"
    + ((stack1 = (helpers.imglist || (depth0 && depth0.imglist) || helpers.helperMissing).call(depth0,(depth0 != null ? depth0.imgUrls : depth0),{"name":"imglist","hash":{},"data":data})) != null ? stack1 : "")
    + "</i>\r\n            </dd>\r\n        </dl>\r\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,depth0,{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["refund-list"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "<table>\r\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.data : depth0),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</table>\r\n";
},"2":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2=this.escapeExpression, alias3="function";

  return "    <tr class=\"\">\r\n        <th colspan=\"5\" class=\"order-code\">\r\n            <em>"
    + alias2((helpers.formatTime || (depth0 && depth0.formatTime) || alias1).call(depth0,(depth0 != null ? depth0.createTime : depth0),{"name":"formatTime","hash":{},"data":data}))
    + "</em>\r\n"
    + ((stack1 = (helpers.if_con || (depth0 && depth0.if_con) || alias1).call(depth0,(depth0 != null ? depth0.refundOrderId : depth0),(depth0 != null ? depth0.orderId : depth0),{"name":"if_con","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "            <span>è®¢åç¼å·ï¼"
    + alias2(this.lambda((depth0 != null ? depth0.orderId : depth0), depth0))
    + "</span>\r\n        </th>\r\n    </tr>\r\n    <tr>\r\n        <td class=\"order-content\">\r\n            <div>\r\n                <div class=\"order-pic\">"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.productList : depth0),{"name":"each","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                "
    + ((stack1 = (helpers.if_pai || (depth0 && depth0.if_pai) || alias1).call(depth0,(depth0 != null ? depth0.orderType : depth0),{"name":"if_pai","hash":{},"fn":this.program(7, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                "
    + ((stack1 = (helpers.if_baog || (depth0 && depth0.if_baog) || alias1).call(depth0,(depth0 != null ? depth0.orderType : depth0),{"name":"if_baog","hash":{},"fn":this.program(9, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                </div>\r\n                <div class=\"order-name\">\r\n                   "
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.productList : depth0),{"name":"each","hash":{},"fn":this.program(11, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                    <div>ä¹°å®¶ï¼"
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.buyerNickName : depth0),{"name":"if","hash":{},"fn":this.program(13, data, 0),"inverse":this.program(15, data, 0),"data":data})) != null ? stack1 : "")
    + "</div>\r\n                </div>\r\n            </div>\r\n        </td>\r\n        <td class=\"order-sum\">\r\n            <div><strong>"
    + alias2((helpers.setSp || (depth0 && depth0.setSp) || alias1).call(depth0,(depth0 != null ? depth0.payTotalCount : depth0),{"name":"setSp","hash":{},"data":data}))
    + "</strong>\r\n            </div>\r\n        </td>\r\n        <td class=\"order-sum\">\r\n            <div><strong>"
    + alias2((helpers.setSp || (depth0 && depth0.setSp) || alias1).call(depth0,(depth0 != null ? depth0.refundTotalCount : depth0),{"name":"setSp","hash":{},"data":data}))
    + "</strong>\r\n            </div>\r\n        </td>\r\n        <td class=\"refund-state\">"
    + ((stack1 = (helpers.getStatus || (depth0 && depth0.getStatus) || alias1).call(depth0,(depth0 != null ? depth0.status : depth0),{"name":"getStatus","hash":{},"data":data})) != null ? stack1 : "")
    + "</td>\r\n        <td>\r\n            <a target=\"_blank\" href=\"/portle/sellerShipping.html?orderId="
    + alias2(((helper = (helper = helpers.orderId || (depth0 != null ? depth0.orderId : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"orderId","hash":{},"data":data}) : helper)))
    + "&userId="
    + alias2(((helper = (helper = helpers.buyerId || (depth0 != null ? depth0.buyerId : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"buyerId","hash":{},"data":data}) : helper)))
    + "&_merchant_user_id_="
    + alias2(((helper = (helper = helpers.sellerId || (depth0 != null ? depth0.sellerId : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"sellerId","hash":{},"data":data}) : helper)))
    + "\">"
    + alias2((helpers.getOption || (depth0 && depth0.getOption) || alias1).call(depth0,(depth0 != null ? depth0.status : depth0),{"name":"getOption","hash":{},"data":data}))
    + "</a>\r\n\r\n            "
    + alias2((helpers.checkBtn || (depth0 && depth0.checkBtn) || alias1).call(depth0,(depth0 != null ? depth0.status : depth0),(depth0 != null ? depth0.sellerId : depth0),{"name":"checkBtn","hash":{},"data":data}))
    + "\r\n        </td>\r\n    </tr>\r\n";
},"3":function(depth0,helpers,partials,data) {
    return "            <span>éè´§åå·ï¼"
    + this.escapeExpression(this.lambda((depth0 != null ? depth0.refundOrderId : depth0), depth0))
    + "</span>\r\n";
},"5":function(depth0,helpers,partials,data) {
    var helper;

  return "<img src=\""
    + this.escapeExpression(((helper = (helper = helpers.imgUrl || (depth0 != null ? depth0.imgUrl : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"imgUrl","hash":{},"data":data}) : helper)))
    + "\" />";
},"7":function(depth0,helpers,partials,data) {
    return "<div class=\"pai\"></div>";
},"9":function(depth0,helpers,partials,data) {
    return "<div class=\"baog\"></div>";
},"11":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "<p>"
    + alias3(((helper = (helper = helpers.productName || (depth0 != null ? depth0.productName : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"productName","hash":{},"data":data}) : helper)))
    + "</p><p class=\"type\">åå·ï¼"
    + alias3(((helper = (helper = helpers.skuText || (depth0 != null ? depth0.skuText : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"skuText","hash":{},"data":data}) : helper)))
    + "</p>";
},"13":function(depth0,helpers,partials,data) {
    var helper;

  return this.escapeExpression(((helper = (helper = helpers.buyerNickName || (depth0 != null ? depth0.buyerNickName : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"buyerNickName","hash":{},"data":data}) : helper)));
},"15":function(depth0,helpers,partials,data) {
    var helper;

  return this.escapeExpression(((helper = (helper = helpers.buyerUserName || (depth0 != null ? depth0.buyerUserName : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"buyerUserName","hash":{},"data":data}) : helper)));
},"17":function(depth0,helpers,partials,data) {
    return "<div class=\"refund-none\">æ åè¡¨</div>\r\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.data : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.program(17, data, 0),"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["refund-product - å¯æ¬"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression, alias3=helpers.helperMissing;

  return "<table>\r\n    <thead>\r\n        <tr>\r\n            <th class=\"product-name\">ååä¿¡æ¯</th>\r\n            <th class=\"product-price\">åä»·</th>\r\n            <th class=\"product-number\">æ°é</th>\r\n            <th class=\"product-total\">å®ä»æ¬¾</th>\r\n            <th class=\"order-state\">è®¢åç¶æ</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"order-infor\" colspan=\"5\">\r\n                <em>è®¢åç¼å·ï¼"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderId : stack1), depth0))
    + "</em>\r\n                <em>ä¸åæ¶é´ï¼"
    + alias2((helpers.formatTime || (depth0 && depth0.formatTime) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.createTime : stack1),{"name":"formatTime","hash":{},"data":data}))
    + "</em>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n                <div class=\"product-infor\">\r\n                    <div>"
    + ((stack1 = helpers.each.call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.productList : stack1),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                         "
    + ((stack1 = (helpers.if_pai || (depth0 && depth0.if_pai) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderType : stack1),{"name":"if_pai","hash":{},"fn":this.program(4, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                         "
    + ((stack1 = (helpers.if_baog || (depth0 && depth0.if_baog) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderType : stack1),{"name":"if_baog","hash":{},"fn":this.program(6, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                    </div>\r\n                    <p>"
    + ((stack1 = helpers.each.call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.productList : stack1),{"name":"each","hash":{},"fn":this.program(8, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</p>\r\n                    <p>"
    + ((stack1 = helpers.each.call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.productList : stack1),{"name":"each","hash":{},"fn":this.program(10, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</p>\r\n                    <p>åå®¶ï¼"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerUserName : stack1), depth0))
    + "</p>\r\n                </div>\r\n            </td>\r\n"
    + ((stack1 = helpers.each.call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.productList : stack1),{"name":"each","hash":{},"fn":this.program(12, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "            <td>\r\n                <div>"
    + alias2((helpers.setSp || (depth0 && depth0.setSp) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.totalAmount : stack1),{"name":"setSp","hash":{},"data":data}))
    + " é±å®å¸</div>\r\n            </td>\r\n            <td>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerWebDetailDesc : stack1), depth0))
    + "</td>\r\n        </tr>\r\n        \r\n    </tbody>\r\n</table>\r\n<ul>\r\n    <li>\r\n        <h3>æ¶è´§ä¿¡æ¯</h3>\r\n        <dl>\r\n            <dd>\r\n                <label>ä¹°å®¶è´¦å·ï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.buyerUserName : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººå§åï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.consignee : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººçµè¯ï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.phoneNum : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººå°åï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.address : stack1), depth0))
    + "</span>\r\n            </dd>\r\n        </dl>\r\n        <div class=\"im-code\">\r\n            <div><img src=\""
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.IMcode : stack1), depth0))
    + "\" /></div>\r\n            <p>ç¨é±å®å®¢æ·ç«¯æ«æèç³»ä¹°å®¶</p>\r\n        </div>\r\n    </li>\r\n    <li>\r\n        <h3>çè¨ä¿¡æ¯</h3>\r\n        <div class=\"refund-remark\">\r\n            <label>ä¹°å®¶çè¨ï¼</label>\r\n            <p>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.buyerRemark : stack1), depth0))
    + "</p>\r\n            <br>\r\n            <label>åå®¶çè¨ï¼</label>\r\n            <p>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerRemark : stack1), depth0))
    + "</p>\r\n        </div>\r\n    </li>\r\n</ul>\r\n";
},"2":function(depth0,helpers,partials,data) {
    var helper;

  return "<img src=\""
    + this.escapeExpression(((helper = (helper = helpers.imgUrl || (depth0 != null ? depth0.imgUrl : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"imgUrl","hash":{},"data":data}) : helper)))
    + "\" alt=\"\" />";
},"4":function(depth0,helpers,partials,data) {
    return "<div class=\"pai\"></div>";
},"6":function(depth0,helpers,partials,data) {
    return "<div class=\"baog\"></div>";
},"8":function(depth0,helpers,partials,data) {
    var helper;

  return this.escapeExpression(((helper = (helper = helpers.productName || (depth0 != null ? depth0.productName : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"productName","hash":{},"data":data}) : helper)));
},"10":function(depth0,helpers,partials,data) {
    var helper;

  return "åå·ï¼"
    + this.escapeExpression(((helper = (helper = helpers.sellType || (depth0 != null ? depth0.sellType : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"sellType","hash":{},"data":data}) : helper)));
},"12":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing;

  return "            <td>"
    + ((stack1 = (helpers.if_equre || (depth0 && depth0.if_equre) || alias1).call(depth0,(depth0 != null ? depth0.productPrice : depth0),{"name":"if_equre","hash":{},"fn":this.program(13, data, 0),"inverse":this.program(15, data, 0),"data":data})) != null ? stack1 : "")
    + "</td>\r\n            <td>"
    + this.escapeExpression(((helper = (helper = helpers.productNum || (depth0 != null ? depth0.productNum : depth0)) != null ? helper : alias1),(typeof helper === "function" ? helper.call(depth0,{"name":"productNum","hash":{},"data":data}) : helper)))
    + "</td>\r\n";
},"13":function(depth0,helpers,partials,data) {
    return this.escapeExpression((helpers.setSp || (depth0 && depth0.setSp) || helpers.helperMissing).call(depth0,(depth0 != null ? depth0.productPrice : depth0),{"name":"setSp","hash":{},"data":data}))
    + " é±å®å¸";
},"15":function(depth0,helpers,partials,data) {
    return "é¢è®®";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,depth0,{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["refund-product"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1, alias1=this.lambda, alias2=this.escapeExpression, alias3=helpers.helperMissing;

  return "<table>\r\n    <thead style=\"border-bottom: 1px solid #e8e7e7;\">\r\n        <tr>\r\n            <th class=\"product-name\">ååä¿¡æ¯</th>\r\n            <th class=\"product-price\">åä»·</th>\r\n            <th class=\"product-number\">æ°é</th>\r\n            <th class=\"product-total\">å®ä»æ¬¾</th>\r\n            <th class=\"order-state\">è®¢åç¶æ</th>\r\n        </tr>\r\n    </thead>\r\n\r\n    <tbody>\r\n        <tr >\r\n            <td class=\"order-infor\" colspan=\"5\" style=\"    background: #eee;\">\r\n                <em>è®¢åç¼å·ï¼"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderId : stack1), depth0))
    + "</em>\r\n                <em>ä¸åæ¶é´ï¼"
    + alias2((helpers.formatTime || (depth0 && depth0.formatTime) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.createTime : stack1),{"name":"formatTime","hash":{},"data":data}))
    + "</em></br>\r\n                <em  style=\"color: #ba3d2b; margin-right: 80px;\">åå®¶ï¼"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerUserName : stack1), depth0))
    + "</em>\r\n                <em style=\"margin-right: 80px;\">"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerWebDetailDesc : stack1), depth0))
    + "</em>\r\n                <em  style=\"color: #ba3d2b;    margin-right: 80px;\">æ»éé¢ï¼"
    + alias2((helpers.setSp || (depth0 && depth0.setSp) || alias3).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.totalAmount : stack1),{"name":"setSp","hash":{},"data":data}))
    + " é±å®å¸</em>\r\n            </td>\r\n        </tr>\r\n\r\n"
    + ((stack1 = helpers.each.call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.productList : stack1),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "        </tr>\r\n\r\n    </tbody>\r\n</table>\r\n<ul>\r\n    <li>\r\n        <h3>æ¶è´§ä¿¡æ¯</h3>\r\n        <dl>\r\n            <dd>\r\n                <label>ä¹°å®¶è´¦å·ï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.buyerUserName : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººå§åï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.consignee : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººçµè¯ï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.phoneNum : stack1), depth0))
    + "</span>\r\n            </dd>\r\n            <dd>\r\n                <label>æ¶è´§äººå°åï¼</label><span>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.address : stack1), depth0))
    + "</span>\r\n            </dd>\r\n        </dl>\r\n        <div class=\"im-code\">\r\n            <div><img src=\""
    + alias2(alias1(((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.IMcode : stack1), depth0))
    + "\" /></div>\r\n            <p>ç¨é±å®å®¢æ·ç«¯æ«æèç³»ä¹°å®¶</p>\r\n        </div>\r\n    </li>\r\n    <li>\r\n        <h3>çè¨ä¿¡æ¯</h3>\r\n        <div class=\"refund-remark\">\r\n            <label>ä¹°å®¶çè¨ï¼</label>\r\n            <p>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.buyerRemark : stack1), depth0))
    + "</p>\r\n            <br>\r\n            <label>åå®¶çè¨ï¼</label>\r\n            <p>"
    + alias2(alias1(((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.sellerRemark : stack1), depth0))
    + "</p>\r\n        </div>\r\n    </li>\r\n</ul>\r\n";
},"2":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "        <tr>\r\n            <td style=\"border-top: 1px solid #e8e7e7;\">\r\n                <div class=\"product-infor\">\r\n                    <div><img src=\""
    + alias3(((helper = (helper = helpers.imgUrl || (depth0 != null ? depth0.imgUrl : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"imgUrl","hash":{},"data":data}) : helper)))
    + "\" alt=\"\" />\r\n                         "
    + ((stack1 = (helpers.if_pai || (depth0 && depth0.if_pai) || alias1).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderType : stack1),{"name":"if_pai","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                         "
    + ((stack1 = (helpers.if_baog || (depth0 && depth0.if_baog) || alias1).call(depth0,((stack1 = ((stack1 = (depth0 != null ? depth0.data : depth0)) != null ? stack1.data : stack1)) != null ? stack1.orderType : stack1),{"name":"if_baog","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "\r\n                    </div>\r\n                    <p>"
    + alias3(((helper = (helper = helpers.productName || (depth0 != null ? depth0.productName : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"productName","hash":{},"data":data}) : helper)))
    + "</p>\r\n                    <p>åå·ï¼"
    + alias3(((helper = (helper = helpers.sellType || (depth0 != null ? depth0.sellType : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"sellType","hash":{},"data":data}) : helper)))
    + "</p>\r\n\r\n                </div>\r\n            </td>\r\n\r\n            <td style=\"border-top: 1px solid #e8e7e7;\">"
    + ((stack1 = (helpers.if_equre || (depth0 && depth0.if_equre) || alias1).call(depth0,(depth0 != null ? depth0.productPrice : depth0),{"name":"if_equre","hash":{},"fn":this.program(7, data, 0),"inverse":this.program(9, data, 0),"data":data})) != null ? stack1 : "")
    + "</td>\r\n            <td style=\"border-top: 1px solid #e8e7e7;\">"
    + alias3(((helper = (helper = helpers.productNum || (depth0 != null ? depth0.productNum : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"productNum","hash":{},"data":data}) : helper)))
    + "</td>\r\n\r\n            <td style=\"border-top: 1px solid #e8e7e7;\"></td>\r\n            <td style=\"border-top: 1px solid #e8e7e7;\"></td>\r\n";
},"3":function(depth0,helpers,partials,data) {
    return "<div class=\"pai\"></div>";
},"5":function(depth0,helpers,partials,data) {
    return "<div class=\"baog\"></div>";
},"7":function(depth0,helpers,partials,data) {
    return this.escapeExpression((helpers.setSp || (depth0 && depth0.setSp) || helpers.helperMissing).call(depth0,(depth0 != null ? depth0.productPrice : depth0),{"name":"setSp","hash":{},"data":data}))
    + " é±å®å¸";
},"9":function(depth0,helpers,partials,data) {
    return "é¢è®®";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,depth0,{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["sample"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var helper;

  return "<h1>\n  Hello "
    + this.escapeExpression(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "!\n</h1>";
},"useData":true});
this["QB"]["templates"]["user-crumbs"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-header"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-menu"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-shop-crumbs"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fee8aad65163c7b39bacd1042c85f1c31' type='text/javascript'%3E%3C/script%3E"));

if (location.hostname.indexOf('qbao.com') >= 0) {
  var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
  document.write(unescape("%3Cspan id='cnzz_stat_icon_1255072395'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1255072395%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
} else {
  var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
  document.write(unescape("%3Cspan id='cnzz_stat_icon_1255070442'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1255070442%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
}

'use strict';
var QB = this.QB = this.QB || {};

QB.widget = this.QB.widget || {};

/**
 * User center data tab widget.
 */
var DataTab = QB.widget.DataTab = function(options) {
  this.$el = options.$el;
  this.tabs = options.tabs;
  this.filters = options.filters || [];
  this.callbackFn = options.callback || function() {};
  this.currentTab = 0;

  this.initDOM();
  this.initTabs();
  this.initFilters();
  this.selectTab(0);
};

DataTab.prototype.initDOM = function() {
  this.$el.empty()
    .append(QB.templates['data-tab']({
      tabs: this.tabs,
      filters: this.filters
    }));
};

DataTab.prototype.initTabs = function() {
  var self = this;

  this.$tabLine = this.$el.find('.line');
  this.$tabContainer = this.$el.find('.tabs')
    .hover(null, function() {
      self.$tabLine
        .stop(true, true)
        .animate({
          left: $(self.$tabs[self.currentTab]).position().left
        }, 'fast');
    });
  this.$tabs = this.$tabContainer.find('li');
  for (var i = 0; i < this.$tabs.length; i++) {
    $(this.$tabs[i]).click((function(index) {
        return function() {
          self.selectTab(index);
        };
      })(i))
      .hover((function(index) {
        return function() {
          self.$tabLine
            .stop(true, true)
            .animate({
              left: $(self.$tabs[index]).position().left
            }, 'fast');
        };
      })(i));
  }
};

DataTab.prototype.initFilters = function() {
  this.$filterContainers = this.$el.find('.filters');
  this.$filterContainers.hide();
};

DataTab.prototype.selectTab = function(index) {
  var self = this;

  this.$tabs.removeClass('selected');
  $(this.$tabs[index]).addClass('selected');
  this.currentTab = index;

  if (this.filters.length) {
    this.$filterContainers.hide();
    $(this.$filterContainers[index]).show();
    this.$filters = $(this.$filterContainers[index]).find('li');

    for (var i = 0; i < this.$filters.length; i++) {
      $(this.$filters[i]).click((function(index) {
        return function() {
          self.selectFilter(index);
        }
      })(i));
    }
    this.selectFilter(0);
  } else {
    this.callbackFn(index);
  }
};

DataTab.prototype.selectFilter = function(index) {
  this.$filters.removeClass('selected');
  $(this.$filters[index]).addClass('selected');
  this.callbackFn(this.currentTab, index);
};

/**
 * User center data filter widget.
 */
var DataFilter = QB.widget.DataFilter = function(options) {
  this.$el = options.$el;
  this.startDate = options.startDate || moment().startOf('month');
  this.endDate = options.endDate || moment();
  this.callbackFn = options.callback || function() {};
  this.disableShortcut = !!options.disableShortcut;

  this.initDOM();
  this.initDatePicker();
  this.initDateFilter();
  this.initButton();

  this.triggerFilter();
};

DataFilter.prototype.initDOM = function() {
  this.$el.empty();

  if (!this.disableShortcut) {
    this.$el.addClass('clearfix');
    this.$el.append([
      '<ul>',
      '  <li data-filter="today"><span>ä»å¤©</span></li>',
      '  <i>|</i>',
      '  <li data-filter="sevenDay">æè¿7å¤©</li>',
      '  <i>|</i>',
      '  <li data-filter="thirtyDay">æè¿30å¤©</li>',
      '  <i>|</i>',
      '  <li data-filter="threeMonth">æè¿3ä¸ªæ</li>',
      '</ul>'
    ].join(''));
  }

  this.$el.append([
    '<span>èµ·æ­¢æ¶é´ï¼</span>',
    '<input id="start-time"/>',
    '<span class="divider"> - </span>',
    '<input id="end-time"/>',
    '<span class="button">æ¥è¯¢</span>'
  ].join(''));
};

DataFilter.prototype.initDatePicker = function() {
  var self = this;

  this.startDateInput = new Pikaday({
    field: document.getElementById('start-time'),
    defaultDate: this.startDate.toDate(),
    setDefaultDate: true,
    maxDate: this.endDate.toDate(),
    i18n: {
      months: ['ä¸æ', 'äºæ', 'ä¸æ', 'åæ', 'äºæ', 'å­æ', 'ä¸æ', 'å«æ', 'ä¹æ', 'åæ', 'åä¸æ', 'åäºæ'],
      weekdays: ['å¨æ¥', 'å¨ä¸', 'å¨äº', 'å¨ä¸', 'å¨å', 'å¨äº', 'å¨å­'],
      weekdaysShort: ['æ¥', 'ä¸', 'äº', 'ä¸', 'å', 'äº', 'å­']
    },
    firstDay: 1,
    format: 'YYYY-MM-DD',
    onSelect: function() {
      console.log(this.getMoment().format('Do MMMM YYYY'));
      self.startDate = this.getMoment();
      self.endDateInput.setMinDate(self.startDate.toDate());
    }
  });

  this.endDateInput = new Pikaday({
    field: document.getElementById('end-time'),
    defaultDate: this.endDate.toDate(),
    setDefaultDate: true,
    minDate: this.startDate.toDate(),
    i18n: {
      months: ['ä¸æ', 'äºæ', 'ä¸æ', 'åæ', 'äºæ', 'å­æ', 'ä¸æ', 'å«æ', 'ä¹æ', 'åæ', 'åä¸æ', 'åäºæ'],
      weekdays: ['å¨æ¥', 'å¨ä¸', 'å¨äº', 'å¨ä¸', 'å¨å', 'å¨äº', 'å¨å­'],
      weekdaysShort: ['æ¥', 'ä¸', 'äº', 'ä¸', 'å', 'äº', 'å­']
    },
    firstDay: 1,
    format: 'YYYY-MM-DD',
    onSelect: function() {
      console.log(this.getMoment().format('Do MMMM YYYY'));
      self.endDate = this.getMoment();
      self.startDateInput.setMaxDate(self.endDate.toDate());
    }
  });
};

DataFilter.prototype.initDateFilter = function() {
  var $filters = this.$el.find('li'),
    self = this;

  $filters.click(function() {
    var filter = $(this).data().filter;

    $filters.removeClass('selected');
    $(this).addClass('selected');

    switch (filter) {
      case 'today':
        self.startDateInput.setMoment(moment());
        self.endDateInput.setMoment(moment());
        break;
      case 'sevenDay':
        self.startDateInput.setMoment(moment().subtract(6, 'days'));
        self.endDateInput.setMoment(moment());
        break;
      case 'thirtyDay':
        self.startDateInput.setMoment(moment().subtract(29, 'days'));
        self.endDateInput.setMoment(moment());
        break;
      case 'threeMonth':
        self.startDateInput.setMoment(moment().subtract(3, 'months'));
        self.endDateInput.setMoment(moment());
        break;
      default:
        break;
    }

    self.currentFilter = filter;
    self.triggerFilter();
  });
};

DataFilter.prototype.initButton = function() {
  var self = this;

  this.$el.find('.button').click(function() {
    self.triggerFilter();
  });
};

DataFilter.prototype.triggerFilter = function() {
  this.callbackFn({
    startDate: this.startDateInput.getMoment(),
    endDate: this.endDateInput.getMoment()
  });
};

/**
 * User center data table widget.
 */
var DataTable = QB.widget.DataTable = function(options) {
  this.$el = options.$el;
  this.selectorCallbackFn = options.selectorCallback;
  this.columns = options.columns;
  this.rowTypes = options.rowTypes;
  this.perPage = options.perPage || 10;
  this.disablePaginator = !!options.disablePaginator;
  this.rows = [];
  this.template = QB.templates['data-table'];
  this.loadFn = options.loadFn;
  this.drawFn = options.drawFn;
  this.drawEndFn = options.drawEndFn;
  this.listStyle = options.listStyle;

  this.initTable();
};

DataTable.prototype.initTable = function() {
  var self = this,
    total = 0;

  this.loadFn(0).done(function(resp) {
    // TODO: Refactor this?
    total = resp.totalCount || resp.total;
    self.rows = new Array(total);

    self.$el.empty().append(self.template({
      listStyle: self.listStyle,
      columns: self.columns,
      rows: self.rows
    }));

    if (self.listStyle) {
      self.$rows = self.$el.find('#data-table-body > li');
    } else {
      self.$rows = self.$el.find('#data-table-body > tr');
    }

    self.appendData(0, resp.data);

    if (!self.disablePaginator && resp.data.length > 0) {
      $('.data-paginator').jPages({
        containerID: 'data-table-body',
        previous: '1',
        next: '1',
        midRange: 3,
        perPage: self.perPage,
        callback: function(pages) {
          var start = (pages.current - 1) * self.perPage + 1,
            end = (total > pages.current * self.perPage) ? (pages.current * self.perPage) : total;

          self.$el.find('.data-status')
            .text('å½åæ¾ç¤º' + start + 'å°' + end + 'æ¡è®°å½ï¼æ»å±' + total + 'æ¡');
          if (pages.current === 1) {
            return;
          }
          self.loadFn(pages.current - 1).done(function(resp) {
            self.appendData(pages.current - 1, resp.data);
          });
        }
      });
    }
  }).fail(function() {
    self.$el.empty().append(self.template({
      listStyle: self.listStyle,
      columns: self.columns
    }));
  });
};

DataTable.prototype.appendData = function(index, data) {
  var $row,
    $custRow,
    content,
    backupStyle;

  for (var i = 0; i < data.length; i++) {
    $row = $(this.$rows[index * this.perPage + i]);
    if ($row.children().length === 0) {
      if (!this.drawFn) {
        for (var j = 0; j < this.rowTypes.length; j++) {
          if (data[i][this.rowTypes[j]] === 0) {
            content = 0;
          } else {
            content = data[i][this.rowTypes[j]] || '';
          }
          $row.append($('<td>').text(content));
        }
        if (i % 2 === 1) {
          $row.addClass('odd');
        }
      } else {
        $(this.drawFn(data[i], $row, index * this.perPage + i));
      }
    }
  }

  if (this.drawEndFn) {
    this.drawEndFn();
  }
};

/**
 * User center selector widget.
 */
var DataSelector = QB.widget.DataSelector = function(options) {
  this.$el = options.$el;
  this.options = options.options;
  this.callbackFn = options.callback || function() {};

  this.$el.empty().append('<p class="filter"></p>');

  var $display = this.$el.find('.filter'),
    $filterList = $('<ul>').appendTo(this.$el).hide(),
    self = this;

  this.$el.hover(function() {
    $filterList.show();
  }, function() {
    $filterList.hide();
  });

  $display.text(this.options[0]);

  for (var i = 0; i < this.options.length; i++) {
    $('<li>').text(this.options[i])
      .appendTo($filterList)
      .click((function(index) {
        return function() {
          $display.text(self.options[index]);
          $filterList.hide();
          self.callbackFn(index, self.options[index]);
        };
      })(i));
  }
};

(function(d) {
  if ("http:" == document.location.protocol) {
    setTimeout(function() {
      var _uid = QB.config.userId || '',
        _uname = QB.config.userName || '';
      window.QBAO_UT_GV = window.QBAO_UT_GV || {};
      window.QBAO_UT_GV['_uid'] = _uid;
      window.QBAO_UT_GV['_uname'] = _uname;
      var s = d.createElement('script'),
        e = d.body.getElementsByTagName('script')[0];
      s.type = 'text/javascript';
      s.async = true;
      s.charset = 'utf-8';
      e.parentNode.insertBefore(s, e);
      s.src = 'http://dig.qbao.com/qb-site/js/user_tracker_dig.js';
    }, 2000);
  }
})(document);

(function($) {

  /*æå³ä¾§èç³»æä»¬ç¨jsåå¥é¡µé¢*/

  //å³ä¾§èç³»æä»¬åè½å®ç°å¼å§===========================
  //è¿åé¡¶é¨
  $(".shortcutBox .topBtnNew").hide();
  $(window).scroll(function() {
    if ($(window).scrollTop() > 60) {
      $(".shortcutBox .topBtnNew").slideDown(300);
    } else {
      $(".shortcutBox .topBtnNew").slideUp(300);
    }
  });
  //å½ç¹å»è·³è½¬é¾æ¥åï¼åå°é¡µé¢é¡¶é¨ä½ç½®
  $(".topBtnNew").click(function() {
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;
  });
  $(".followUs").hover(
    function() {
      $(".followUs .followBox").show();
    },
    function() {
      $(".followUs .followBox").hide();
    });
  $(".contactUS").hover(
    function() {
      $(".contactUS .followBox").show();
    },
    function() {
      $(".contactUS .followBox").hide();
    });
  $("#d").bind('click', function() {
    var $t = $(this);
    $(".shortcutBox").fadeOut(300, function() {
      $("#u").fadeIn(300);
    });
  });

  $("#u").bind('click', function() {
    $(this).fadeOut(300, function() {
      $(".shortcutBox").fadeIn(300);
    });
  });
  //å³ä¾§èç³»æä»¬åè½å®ç°ç»æ===========================
})(jQuery);

(function(window) {
  "use strict";

  var popTag = null;
  var Pop = function() {

  };

  var tool = {

    gl: {
      bindFn: null
    },

    /**
     * obtain HTML tag's object for DOM.
     * ID must be of type string
     * @param {string} id
     * @returns {HTMLObjectElement}
     */
    byId: function(id) {
      var dom = null;

      //Compatible method of low version of the browser to get the DOM object.
      if (document.all) {
        var doms = document.all[id];

        if (!doms.length) {
          return doms;
        }

        for (var i = 0, len = doms.length; i < len; i++) {
          if (doms[i].id === id) {
            dom = doms[i];
          }
        }
      } else {
        dom = document.getElementById(id);
      }


      if (dom === null) {
        throw new Error(id + " was not found in the page");
      }

      return dom;
    },

    /**
     * The sub array directly obtain the DOM object nodes
     * The parameter's type must be DOM object
     * @param {HTMLObjectElement} dom
     * @returns {Array}
     */
    children: function(dom) {
      var nodes = [];

      //Judging whether the DOM object can have child nodes
      if (dom.hasChildNodes()) {
        var items = dom.childNodes;

        for (var i = 0, len = items.length; i < len; i++) {

          //To determine the child node is a DOM object
          if (Number(items[i].nodeType) === 1) {
            nodes.push(items[i]);
          }
        }
      }

      return nodes;
    },

    bindEvent: function(type, dom, fn) {
      var self = this;
      var ary = [];

      if (arguments.length > 3) {

        for (var i = 3, len = arguments.length; i < len; i++) {
          ary.push(arguments[i]);
        }
      }
      self.gl.bindfn = function() {
        fn.apply(dom, ary);
      };

      if (window.addEventListener) {
        dom.addEventListener(type, self.gl.bindfn, false);
      } else {
        dom.attachEvent('on' + type, self.gl.bindfn);
      }
    }
  };

  Pop.fn = Pop.prototype = {

    /**
     *
     * @param {Object} id/html/width/height/scroll/fn
     */
    load: function(options) {
      var self = this;
      var dom = null;
      var popCon = null,
        popColse = null,
        popMain = null;
      var left = 0,
        top = 0;

      //Judge DOM property exists if there is no default is body
      if (options.id) {
        dom = tool.byId(options.id);
      } else {
        dom = window.document.body;
      }

      //The HTML attribute must be present
      popTag = dom.appendChild(popDom({

        title: (function() {
          var str = 'title';

          if (options.title) {
            str = options.title;
          }

          return str;
        })(),

        html: (function() {
          var html = '';

          if (options.html) {
            html = options.html;
          }

          return html;
        })()
      }));

      //set pop's class attribute
      popTag.className = "md_pop";
      popCon = child(child(popTag, 1), 0);
      popColse = child(child(popCon, 0), 0);
      popMain = child(popCon, 1);

      //colse pop layout
      tool.bindEvent('click', popColse, function() {
        self.close();
      });

      //set popMain's height
      if (options.height) {
        popMain.style.height = options.height + 'px';
      }

      if (options.width) {
        popCon.style.width = options.width + 'px';
      }

      if (options.scroll && Boolean(options.scroll)) {
        popMain.style.overflowY = 'scroll';
      }

      left = -Math.floor(Number(popCon.offsetWidth) / 2);
      top = -Math.floor(Number(popCon.offsetHeight) / 2);
      popCon.style.left = left + 'px';
      popCon.style.top = top + 'px';

      if (options.fn) {
        options.fn.apply(popMain, [popTag, child(popTag, 0), arguments]);
      }
    },

    close: function() {
      var dom = null;

      if (popTag !== null && popTag.className === 'md_pop') {
        dom = popTag.parentNode;
        dom.removeChild(popTag);
      } else {
        return null;
      }
    }
  };

  /**
   * The child node single sequence obtained in DOM
   * @param dom {HTMLObjectElement}
   * @param index {Number}
   * @returns {HTMLObjectElement}
   */
  function child(dom, index) {
    var children = tool.children(dom);
    var len = children.length;

    if (index >= len) {
      return null;
    } else {
      return children[index];
    }
  }

  /**
   * Add tags content
   * @param options title/html
   * @returns {HTMLElement}
   */
  function popDom(options) {
    var tagArr = [];
    var dom = document.createElement('div');

    tagArr.push('<div class="md_pop_layout"><!--layout--></div>');
    tagArr.push('<div class="md_pop_frame">');
    tagArr.push('<div class="md_pop_con">');
    tagArr.push('<div class="md_pop_title">');
    tagArr.push('<span>X</span>');
    tagArr.push('<strong>' + options.title + '</strong>');
    tagArr.push('</div>');
    tagArr.push('<div class="md_pop_main">');
    tagArr.push(options.html);
    tagArr.push('</div>');
    tagArr.push('</div>');
    tagArr.push('</div>');
    dom.innerHTML = tagArr.join('');

    return dom;
  }

  window.pop = new Pop();
})(window);
$(function() {
  $("#popWeixin").click(function() {
    showWeixin();
    return false;
  });
  $("#popWeixin2").click(function() {
    showWeixin2();
    return false;
  });

  if (location.hostname.indexOf('qbao.com') >= 0) {
    $('#cert-link').attr('href', 'https://search.szfw.org/cert/l/CX20150318007076007211');
  }
});

function showWeixin() {
  pop.load({
    id: 'popWeixinBox',
    title: 'é±å®ç½å®æ¹å¾®ä¿¡äºç»´ç ',
    height: 480,
    width: 600,
    html: '<p>æå¼å¾®ä¿¡ï¼ç¹å»å³ä¸è§çâé­æ³æ£âï¼éæ©âæ«ä¸æ«âåè½ï¼å¯¹åä¸æ¹äºç»´ç å³å¯ã</p>' +
      '<h2 class=" mt20" style="text-align:center"><img src="' + QB.domain.cdn + '/images/newFooter/2Dcode_weixin_dy.jpg" /></h2>',
    fn: function(popDom, frDom) {
      frDom.onclick = pop.close;
    }
  });
}

function showWeixin2() {
  pop.load({
    id: 'popWeixinBox',
    title: 'é±æºæºè½å®æ¹å¾®ä¿¡äºç»´ç ',
    height: 480,
    width: 600,
    html: '<p>æå¼å¾®ä¿¡ï¼ç¹å»å³ä¸è§çâé­æ³æ£âï¼éæ©âæ«ä¸æ«âåè½ï¼å¯¹åä¸æ¹äºç»´ç å³å¯ã</p>' +
      '<h2 class=" mt20" style="text-align:center"><img src="' + QB.domain.cdn + '/images/newFooter/2Dcode_weixin_fw.jpg" /></h2>',
    fn: function(popDom, frDom) {
      frDom.onclick = pop.close;
    }
  });
}

function callColse(evt) {
  var e = evt || window.event;
  var dom = e.target || e.srcElement;

  if (dom.className === 'md_pop_frame' ||
    dom.className === 'md_pop_layout') {
    pop.close();
  }
}

var QB = this.QB = this.QB || {};

QB.SiteHeader = QB.SiteHeader || {};

QB.SiteHeader.floatMenu = function() {
  'use strict';
  var elementId = document.getElementById("site-menu-fixed");

  window.onscroll = function() {
    var top = document.documentElement.scrollTop || document.body.scrollTop;
    if (top > 134) {
      if (elementId.className === '') {
        elementId.className = 'site-menu-fixed';
      }
    } else {
      if (elementId.className !== '') {
        elementId.className = '';
      }
    }
  };
};

QB.SiteHeader.active = function(menu) {
  'use strict';

  $('.site-menu').find(menu).addClass('current');
};


$(function() {
  'use strict';

  if (!$('.site-header').length) {
    return;
  }

  if (document.location.protocol === 'http:') {
    // loadSiteLogo();
    loadLeftMenu();
  }

  function loadSiteLogo() {
    $.ajax({
      url: QB.domain.cdn + '/account/logoUrl.html',
      jsonp: 'jsonpCallback',
      dataType: 'jsonp'
    }).done(function(resp) {
      if (resp && resp.id) {
        $('.site-logo img').attr('src', QB.domain.qbao + '/bannerManager1/loadBannerPic1.html?bannerId=' + resp.id);
      }
    });
  }

  function loadLeftMenu() {
    $.ajax({
      url: QB.domain.qbao + '/account/checkLogin.html',
      jsonp: 'jsonpCallback',
      dataType: 'jsonp'
    }).done(function(resp) {
      if (resp.success) {
        QB.config.isLogin = true;
        _renderLeftMenu();
      }
    });
  }

  function _renderLeftMenu() {
    $.ajax({
      url: QB.domain.qbao + '/account/latestInfo.html',
      jsonp: 'jsonpCallback',
      dataType: 'jsonp'
    }).done(function(resp) {
      QB.config.userId = resp.id;
      QB.config.userName = resp.username;
      if (resp.username.length >= 6) {
        resp.displayName = resp.username.substring(0, 3) + "******" + resp.username.substring(resp.username.length - 2);
      } else {
        resp.displayName = resp.username;
      }
      resp.balance = QB.utils.addCommas(resp.balance);
      $('.site-nav .menu-login').replaceWith(QB.templates['user-info'](resp));
      $('.site-nav .user-news').replaceWith(QB.templates['user-message']({
        unreadMessageNumber: 0
      }));

      refreshMessage();
      // setInterval(refreshMessage, 60 * 1000);
    });
  }

  function refreshMessage() {
    $.ajax({
      url: QB.domain.user + '/usercenter/message/unread/jsonp.html',
      jsonp: 'jsonpCallback',
      dataType: 'jsonp'
    }).done(function(resp) {
      if (resp.data && resp.data.unreadMessageNumber > 0) {
        if (resp.data.unreadMessageNumber > 99) {
          resp.data.unreadMessageNumber = '99+';
        }
        $.each(resp.data.messageList, function(index, message) {
          // message.displayContent = message.body.replace(/<[^>]+>/g, "");
          switch (message.messageType) {
            case 0:
              message.className = 'site-header-sprite site-header-sprite-header-notice';
              message.showClass = 'notice';
              message.showName = 'éç¥';
              break;
            case 1:
              message.className = 'site-header-sprite site-header-sprite-header-activity';
              message.showClass = 'activity';
              message.showName = 'æ´»å¨';
              break;
            case 2:
              message.className = 'site-header-sprite site-header-sprite-header-system';
              message.showClass = 'system';
              message.showName = 'ç³»ç»';
              break;
          }
          // Disable img src for http url.
          message.body = message.body.replace(/src=/g, 'unknown=');
          message.body = $('<p>' + message.body + '</p>').text();
          // å¦æåå®¹å¤§äº38ä¸ªå­ï¼ååè¾¹æ¾ç¤ºçç¥å·
          if (message.body.length > 87) {
            message.body = message.body.substr(0, 87) + '...';
          }
          message.url = QB.domain.qbao + '/messageboard/my/message.html?messageType=' + message.messageType + '&userMessageId=' + message.id;
        });
      }
      $('.user-news').replaceWith(QB.templates['user-message'](resp.data));
    }).fail(function() {
      console.log('no message');
    });
  }

  function initMenu() {
    var siteTopId = document.getElementById('siteTopId'),
      siteNewsUpBtn = document.getElementById('siteNewsUpBtn'),
      siteNewsLayoutId = document.getElementById('siteNewsLayoutId'),
      className = siteTopId.className;

    window.setTimeout(function() {
      siteNewsLayoutId.style.top = 0 + 'px';
    }, 1);

    siteNewsUpBtn.onclick = function() {
      if (className.indexOf('site-init') >= 0) {
        siteNewsLayoutId.style.top = -800 + 'px';
      }
      window.setTimeout(function() {
        siteNewsLayoutId.removeAttribute('style');
        siteNewsLayoutId.parentNode.style.height = 0 + 'px';
        siteTopId.className = className.replace('site-init', '');
        window.setTimeout(function() {
          siteNewsLayoutId.removeAttribute('style');
          siteNewsLayoutId.parentNode.removeAttribute('style');
        }, 600);
      }, 300);
    };
  }
});

this["QB"] = this["QB"] || {};
this["QB"]["templates"] = this["QB"]["templates"] || {};
this["QB"]["templates"]["data-tab"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "  <li>\n    <span>"
    + this.escapeExpression(this.lambda(depth0, depth0))
    + "</span>\n"
    + ((stack1 = helpers.unless.call(depth0,(data && data.last),{"name":"unless","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "  </li>\n";
},"2":function(depth0,helpers,partials,data) {
    return "    <i>|</i>\n";
},"4":function(depth0,helpers,partials,data) {
    var stack1;

  return "<ul class=\"clearfix filters\">\n"
    + ((stack1 = helpers.each.call(depth0,depth0,{"name":"each","hash":{},"fn":this.program(5, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</ul>\n";
},"5":function(depth0,helpers,partials,data) {
    var stack1;

  return "    <li>\n      <span>"
    + this.escapeExpression(this.lambda(depth0, depth0))
    + "</span>\n    </li>\n"
    + ((stack1 = helpers.unless.call(depth0,(data && data.last),{"name":"unless","hash":{},"fn":this.program(6, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"6":function(depth0,helpers,partials,data) {
    return "      <i>|</i>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return "<ul class=\"clearfix tabs\">\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.tabs : depth0),{"name":"each","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "</ul>\n<div class=\"line-box\">\n  <div class=\"line\"></div>\n</div>\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.filters : depth0),{"name":"each","hash":{},"fn":this.program(4, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["data-table"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return "<ul id=\"data-table-body\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = (depth0 != null ? depth0.rows : depth0)) != null ? stack1.length : stack1),{"name":"if","hash":{},"fn":this.program(2, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "")
    + "</ul>\n";
},"2":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.rows : depth0),{"name":"each","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"3":function(depth0,helpers,partials,data) {
    return "    <li class=\"list-item\"></li>\n";
},"5":function(depth0,helpers,partials,data) {
    return "    <li id=\"data-table-no-result\">æ²¡æè®°å½</li>\n";
},"7":function(depth0,helpers,partials,data) {
    var stack1;

  return "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n  <thead>\n    <tr>\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.columns : depth0),{"name":"each","hash":{},"fn":this.program(8, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "    </tr>\n  </thead>\n  <tbody id=\"data-table-body\">\n"
    + ((stack1 = helpers['if'].call(depth0,((stack1 = (depth0 != null ? depth0.rows : depth0)) != null ? stack1.length : stack1),{"name":"if","hash":{},"fn":this.program(10, data, 0),"inverse":this.program(14, data, 0),"data":data})) != null ? stack1 : "")
    + "  </tbody>\n</table>\n";
},"8":function(depth0,helpers,partials,data) {
    var stack1;

  return "        <th>"
    + ((stack1 = this.lambda(depth0, depth0)) != null ? stack1 : "")
    + "</th>\n";
},"10":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.rows : depth0),{"name":"each","hash":{},"fn":this.program(11, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "");
},"11":function(depth0,helpers,partials,data) {
    var stack1;

  return "      <tr class="
    + ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.odd : depth0),{"name":"if","hash":{},"fn":this.program(12, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "></tr>\n";
},"12":function(depth0,helpers,partials,data) {
    return "\"odd\"";
},"14":function(depth0,helpers,partials,data) {
    var stack1;

  return "      <tr id=\"data-table-no-result\"><td colspan=\""
    + this.escapeExpression(this.lambda(((stack1 = (depth0 != null ? depth0.columns : depth0)) != null ? stack1.length : stack1), depth0))
    + "\">æ²¡æè®°å½</td></tr>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.listStyle : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.program(7, data, 0),"data":data})) != null ? stack1 : "")
    + "<div class=\"paginator-info\">\n  <div class=\"data-paginator clearfix\"></div> \n  <div class=\"data-status\"></div>\n</div>\n";
},"useData":true});
this["QB"]["templates"]["user-info"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2=this.escapeExpression, alias3="function";

  return "<!--å·²ç»å½-->\n<li class=\"menu user-name\">\n  <div class=\"menu-hd menu-light\">\n    <a href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"user",{"name":"domain","hash":{},"data":data}))
    + "/usercenter/ucIndex.html\" title=\""
    + alias2(((helper = (helper = helpers.displayName || (depth0 != null ? depth0.displayName : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"displayName","hash":{},"data":data}) : helper)))
    + "\">"
    + alias2(((helper = (helper = helpers.displayName || (depth0 != null ? depth0.displayName : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"displayName","hash":{},"data":data}) : helper)))
    + "</a>\n    <i class=\"site-header-sprite site-header-sprite-header-dropdown\"></i>\n  </div>\n  <!--ä¸ªäººä¿¡æ¯æ¶èµ·-->\n  <div class=\"menu-bd\">\n    <div class=\"user-layout\">\n      <div class=\"user-main user-box\">\n        <div class=\"user-m-top\">\n          <div class=\"user-info\">\n            <p>ä½é¢ï¼</p>\n            <p>\n              <em>"
    + alias2(((helper = (helper = helpers.balance || (depth0 != null ? depth0.balance : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"balance","hash":{},"data":data}) : helper)))
    + "</em>\n              <span>ï¼é±å®ï¼</span>\n            </p>\n          </div>\n        </div>\n        <div class=\"user-m-bottom clearfix\">\n          <span class=\"pull-left\">è¿è¡ä¸­çä»»å¡<a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/task/userTaskInProcess.html\" class=\"orange mlr5\">"
    + alias2(((helper = (helper = helpers.taskNumInProcess || (depth0 != null ? depth0.taskNumInProcess : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"taskNumInProcess","hash":{},"data":data}) : helper)))
    + "</a>ä¸ª</span>\n          <span class=\"pull-right\">å¤±è´¥ä»»å¡<a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/task/userTaskFailed.html\" class=\"orange mlr5\">"
    + alias2(((helper = (helper = helpers.taskNumFailed || (depth0 != null ? depth0.taskNumFailed : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"taskNumFailed","hash":{},"data":data}) : helper)))
    + "</a>ä¸ª</span>\n        </div>\n      </div>\n      <div class=\"user-medal clearfix\">\n        <a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/wallet/recharge.html?username="
    + alias2(((helper = (helper = helpers.username || (depth0 != null ? depth0.username : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"username","hash":{},"data":data}) : helper)))
    + "\" class=\"menu orange\" title=\"åå¼\">åå¼</a>\n        <span class=\"site-nav-pipe\"></span>\n        <a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/wallet/transfer.html\" class=\"menu orange\" title=\"æç°\">æç°</a>\n        <div class=\"pull-right\">\n          <i class=\"site-header-sprite site-header-sprite-header-logout\"></i>\n          <a href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"passport",{"name":"domain","hash":{},"data":data}))
    + "/cas/logout?service="
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"user",{"name":"domain","hash":{},"data":data}))
    + "/usercenter/logout/logout.html\" title=\"éåº\" class=\"orange\">éåº</a>\n        </div>\n      </div>\n    </div>\n  </div>\n</li>\n";
},"3":function(depth0,helpers,partials,data) {
    var alias1=helpers.helperMissing, alias2=this.escapeExpression;

  return "<!--æªç»å½-->\n<li class=\"menu menu-login\">\n  <a href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"user",{"name":"domain","hash":{},"data":data}))
    + "/usercenter/ucIndex.html\" class=\"orange\">ç»å½</a>\n  <span>-</span>\n  <a href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"user",{"name":"domain","hash":{},"data":data}))
    + "/usercenter/regist/toRegist.html\" class=\"orange\" target=\"_blank\">æ³¨å</a>\n</li>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.username : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.program(3, data, 0),"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["user-message"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2=this.escapeExpression, alias3="function";

  return "<!--ææ¶æ¯-->\n<li class=\"menu user-news\">\n  <div class=\"menu-hd hi-icon-effect\">\n    <a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/messageboard/my/message.html\" title=\"æ¶æ¯\">\n      <i class=\"site-header-sprite site-header-sprite-header-message hi-icon\"></i> æ¶æ¯\n    </a>\n    <span class=\"number-icon\">"
    + alias2(((helper = (helper = helpers.unreadMessageNumber || (depth0 != null ? depth0.unreadMessageNumber : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"unreadMessageNumber","hash":{},"data":data}) : helper)))
    + "</span>\n    <i class=\"site-header-sprite site-header-sprite-header-dropdown\"></i>\n  </div>\n  <div class=\"menu-bd\">\n    <div id=\"siteNewsLayoutId\" class=\"news-layout\">\n      <div class=\"user-main user-message\">\n        <h2>æ°æ¶æ¯<span class=\"number-icon\">"
    + alias2(((helper = (helper = helpers.unreadMessageNumber || (depth0 != null ? depth0.unreadMessageNumber : depth0)) != null ? helper : alias1),(typeof helper === alias3 ? helper.call(depth0,{"name":"unreadMessageNumber","hash":{},"data":data}) : helper)))
    + "</span></h2>\n        <a target=\"_blank\" href=\""
    + alias2((helpers.domain || (depth0 && depth0.domain) || alias1).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/messageboard/my/message.html\" title=\"æ¥çå¨é¨æ¶æ¯\" class=\"menu orange under-line\" style=\"position: absolute; top: 20px; right: 10px;\">æ¥çå¨é¨æ¶æ¯</a>\n        <ul>\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.messageList : depth0),{"name":"each","hash":{},"fn":this.program(2, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "        </ul>\n      </div>\n      <span class=\"news-up site-header-sprite site-header-sprite-header-news-up\"></span>\n    </div>\n  </div>\n</li>\n";
},"2":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "          <li>\n            <a target=\"_blank\" href=\""
    + alias3(((helper = (helper = helpers.url || (depth0 != null ? depth0.url : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"url","hash":{},"data":data}) : helper)))
    + "\">\n              <div class=\"news-main\">\n                <span>\n                  <i class=\""
    + alias3(((helper = (helper = helpers.className || (depth0 != null ? depth0.className : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"className","hash":{},"data":data}) : helper)))
    + "\"></i>\n                  <b class=\""
    + alias3(((helper = (helper = helpers.showClass || (depth0 != null ? depth0.showClass : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"showClass","hash":{},"data":data}) : helper)))
    + "-name\">"
    + alias3(((helper = (helper = helpers.showName || (depth0 != null ? depth0.showName : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"showName","hash":{},"data":data}) : helper)))
    + "</b>\n                </span>\n                <div class=\"news-info\">\n                  <h3>"
    + alias3(((helper = (helper = helpers.title || (depth0 != null ? depth0.title : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"title","hash":{},"data":data}) : helper)))
    + "</h3>\n                  <p>"
    + alias3(((helper = (helper = helpers.body || (depth0 != null ? depth0.body : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"body","hash":{},"data":data}) : helper)))
    + "</p>\n                </div>\n                <i class=\"site-header-sprite site-header-sprite-header-right\"></i>\n              </div>\n            </a>\n          </li>\n";
},"4":function(depth0,helpers,partials,data) {
    return "<!--æ²¡ææ¶æ¯-->\n<li class=\"menu user-news\">\n  <div class=\"menu-hd  hi-icon-effect\">\n    <a target=\"_blank\" href=\""
    + this.escapeExpression((helpers.domain || (depth0 && depth0.domain) || helpers.helperMissing).call(depth0,"qbao",{"name":"domain","hash":{},"data":data}))
    + "/messageboard/my/message.html\" title=\"æ¶æ¯\">\n      <i class=\"site-header-sprite site-header-sprite-header-no-message  hi-icon\"></i> æ¶æ¯\n      <i class=\"site-header-sprite site-header-sprite-header-dropdown\"></i>\n    </a>\n  </div>\n  <div class=\"menu-bd news-none\">\n    <div class=\"user-layout\">\n      <div class=\"user-main user-message\">\n        <h2>æ²¡ææ°æ¶æ¯</h2>\n        <div class=\"no-news\">\n          <i class=\"site-header-sprite site-header-sprite-header-no-message-bg\"></i>\n        </div>\n      </div>\n    </div>\n  </div>\n</li>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.unreadMessageNumber : depth0),{"name":"if","hash":{},"fn":this.program(1, data, 0),"inverse":this.program(4, data, 0),"data":data})) != null ? stack1 : "");
},"useData":true});
this["QB"]["templates"]["uc-menu"] = Handlebars.template({"1":function(depth0,helpers,partials,data) {
    var stack1;

  return ((stack1 = helpers['if'].call(depth0,(depth0 != null ? depth0.submenus : depth0),{"name":"if","hash":{},"fn":this.program(2, data, 0),"inverse":this.program(5, data, 0),"data":data})) != null ? stack1 : "");
},"2":function(depth0,helpers,partials,data) {
    var stack1, helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "    <li class=\"menu-item\" id=\""
    + alias3(((helper = (helper = helpers.id || (depth0 != null ? depth0.id : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"id","hash":{},"data":data}) : helper)))
    + "\">\n      <a href=\"javascript:void(0);\" class=\"submenu\">\n        <i class=\"menu-icon "
    + alias3(((helper = (helper = helpers.icon || (depth0 != null ? depth0.icon : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"icon","hash":{},"data":data}) : helper)))
    + "\"></i>\n        <i class=\"menu-icon nav-icon\"></i>\n        <span>"
    + alias3(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</span>\n      </a>\n      <ul class=\"dropbox\">\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.submenus : depth0),{"name":"each","hash":{},"fn":this.program(3, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "      </ul>\n    </li>\n";
},"3":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "        <li class=\"submenu-item\" id=\""
    + alias3(((helper = (helper = helpers.id || (depth0 != null ? depth0.id : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"id","hash":{},"data":data}) : helper)))
    + "\">\n          <a href=\""
    + alias3(((helper = (helper = helpers.url || (depth0 != null ? depth0.url : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"url","hash":{},"data":data}) : helper)))
    + "\">"
    + alias3(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</a>\n        </li>\n";
},"5":function(depth0,helpers,partials,data) {
    var helper, alias1=helpers.helperMissing, alias2="function", alias3=this.escapeExpression;

  return "    <li class=\"menu-item\" id=\""
    + alias3(((helper = (helper = helpers.id || (depth0 != null ? depth0.id : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"id","hash":{},"data":data}) : helper)))
    + "\">\n      <a href=\""
    + alias3(((helper = (helper = helpers.url || (depth0 != null ? depth0.url : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"url","hash":{},"data":data}) : helper)))
    + "\">\n        <i class=\"menu-icon "
    + alias3(((helper = (helper = helpers.icon || (depth0 != null ? depth0.icon : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"icon","hash":{},"data":data}) : helper)))
    + "\"></i>\n        <i class=\"menu-icon nav-icon\"></i>\n        <span>"
    + alias3(((helper = (helper = helpers.name || (depth0 != null ? depth0.name : depth0)) != null ? helper : alias1),(typeof helper === alias2 ? helper.call(depth0,{"name":"name","hash":{},"data":data}) : helper)))
    + "</span>\n      </a>\n    </li>\n";
},"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    var stack1;

  return "<div id=\"uc-menu\">\n  <div class=\"menu-title\">\n    <img src=\"../components/uc-menu/images/uc-title.png\" />\n  </div>\n  <ul>\n"
    + ((stack1 = helpers.each.call(depth0,(depth0 != null ? depth0.menus : depth0),{"name":"each","hash":{},"fn":this.program(1, data, 0),"inverse":this.noop,"data":data})) != null ? stack1 : "")
    + "  </ul>\n</div>\n";
},"useData":true});
this["QB"]["templates"]["user-crumbs"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-header"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-menu"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});
this["QB"]["templates"]["user-shop-crumbs"] = Handlebars.template({"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
    return "";
},"useData":true});

this.QB = this.QB || {};
this.QB.widget = this.QB.widget || {};

var UCMenu = this.QB.widget.UCMenu = {};

$(function() {
  'use strict';

  UCMenu.active = function(menu, submenu) {
    if (submenu) {
      $('#uc-menu').find(menu).addClass('active');
      $('#uc-menu').find(submenu).addClass('selected');
    } else {
      $('#uc-menu').find(menu).addClass('selected');
    }
  };

  var $menus = $('#uc-menu .submenu');

  $menus.click(function() {
    var $menu = $(this).parent();

    if ($menu.hasClass('active')) {
      $menu.removeClass('active');
    } else {
      $menus.parent().removeClass('active');
      $menu.addClass('active');
    }
  });
});
