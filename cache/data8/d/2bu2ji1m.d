   �         �https://passport.qbao.com/cas/qianbaoLogin?service=http%3A%2F%2Fpay.qbao.com%2Fj_spring_cas_security_check%3Bjsessionid%3D4EB36ED6D713DDA69096E8CDAC02F595.8m9ep22s     %g�t��       ����          
     O K           �      Date   Sun, 28 Feb 2016 11:12:19 GMT   Content-Type   text/html;charset=UTF-8   Vary   Accept-Encoding   P3P   SCP=CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR   Expires   Sun, 28 Feb 2016 12:12:19 GMT   Content-Language   zh-CN   Content-Encoding   gzip   X-Cache   miss 



































<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户登录－钱宝网</title> 
<link rel="shortcut icon" href="/favicon4Qianbao.ico" type="image/x-icon" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/loading-overlay.min.js"></script>
<script type="text/javascript" src="/js/jquery.keyboard.js"></script>


<link href="/css/new_table.css" rel="stylesheet" type="text/css" /> 
<link href="/css/base.css" rel="stylesheet" type="text/css" /> 
<link href="/css/usercenter.css" rel="stylesheet" type="text/css" /> 
<link href="/css/keyboard.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.hyip-failed,.hyip-success{border:1px solid #FF8080;border-radius:5px;background-color:#FFF2F2;padding:10px 15px;margin:10px 0;font-size:14px;font-weight:bold;text-align:center}
</style>

<script type="text/javascript" src="/js/jquery-ui-1.8.13/development-bundle/ui/minified/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.13/development-bundle/ui/minified/jquery.effects.core.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.13/development-bundle/ui/minified/jquery.effects.blind.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.13/development-bundle/ui/minified/jquery.effects.scale.min.js"></script>
<script type="text/javascript" src="/js/sideroad-jquery.floatingmessage/src/jquery.floatingmessage.js"></script>

</head> 

<script type="text/javascript">
var lateInfoFlag = false;
var nickName = '';
	$(document).ready(function() {
		if(nickName != '' && nickName != 'anonymousUser'){
			// 如果用户已经登录，修改抢红包链接
 			$("#qhb").attr("href","http://qhb.qbao.com/home.html");
			var date = new Date();
			date.setTime(date.getTime() + (24 * 60 * 60 * 60 * 1000 ));
			$.cookie('userName', nickName, { expires: date });
			
			nickName = html_decode(nickName);
			if(nickName.length>=6){
				nickName=nickName.substring(0,3)+"******"+nickName.substring(nickName.length-2,nickName.length);
			}
			$('#headUserName').text(nickName);
			$('#islogin').show();
			$('#nologin').remove();
			$('#headUserNameDiv').mouseover(function(){
				if(!lateInfoFlag){
					lateInfoFlag = true;
					$.ajax({
						type : 'post',
						async:false,
						url : 'http://www.qbao.com/account/latestInfo.html',
						dataType : 'jsonp',
						jsonp: "jsonpCallback",
						jsonpCallback:'success_jsonpCallback',
						success : function(record){
							$('#user_info_money').html(num_split(record.balance));
							$('#user_task_in_process').html(record.taskNumInProcess);
							$('#user_task_failed').html(record.taskNumFailed);
						},
						error : function(data){
							var responseTextJson = JSON.parse(data.responseText);
							if(responseTextJson.returnCode == -1){
								window.location.href=location.protocol+"//"+location.host+"/account/loginSession.html?url="+location.href;
								return;
							}
						} 
					});
				}
			});
		}else{
			$('#nologin').show();
			$('#islogin').remove();
		}
		$('#headerTop').show();
	});
	function num_split(number){
		var reg = /(\d{1,3})(?=(\d{3})+(?:$|\.))/g; 
		return String(number).replace(reg,"$1,");
	}
	function showMoney(t){
		$(t).hide().siblings().show();
	}
	function html_decode(str)  
	{  
	    var div = document.createElement("div");
	    div.innerHTML = str;
	    return div.innerHTML;
	}
	/* 动态logo */
	$.ajax({
		type : 'post',
		async:false,
		url : 'https://www.qbao.com/account/logoUrl.html',
		dataType : 'jsonp',
		jsonp: "jsonpCallback",
		jsonpCallback:'success_jsonpCallback',
		success : function(record){
			if(record != null){
				$('#headerLogo').css('background','url("http://www.qbao.com/bannerManager1/loadBannerPic1.html?bannerId='+record.id+'") no-repeat 0 0');
			}
		},
		error : function(data){
		}
	});
</script>
	
	













<script type="text/javascript">
	//--------------Add by qiuliujun---------------
	//针对/bindcard绑卡上传资料画面，导入jquery-1.9.0.min.js
	var currentPath = window.location.pathname;
	if(currentPath != null && currentPath.indexOf('/bindcard/') != -1){
		//必须是http协议访问，不能是https
		if(window.location.protocol != 'http:'){
			alert('抱歉,访问协议不正确');
			window.location.href = 'http://www.qbao.com';
		} else {
			document.write("<script src='http://www.qbao.com/bindcard/js/jquery-1.9.0.min.js'><\/script>");
		}
	}
	//-------------------end-----------------
</script>

<script type="text/javascript" src="/js/jquery-ui-1.8.13/development-bundle/external/jquery.cookie.js"></script>
<link href="/css/qbao/header.css?v=20151022" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var lateInfoFlag = false;
var showIndex = '';
var allName = '';
	$(document).ready(function() {
		$('#hasMessage').remove(); 
		$('#noMessage').remove();
		$('#messagePipe').remove();

		$('#nologin').show();
		$('#islogin').remove();
		$('#headerTop').show();
		if($('#navigation').length == 0){
			var $top_qbIndex = $('#top_qbIndex');
			$top_qbIndex.show();
			$top_qbIndex.next().show();
		}
	});
	function num_split(number){
		var reg = /(\d{1,3})(?=(\d{3})+(?:$|\.))/g; 
		return String(number).replace(reg,"$1,");
	}
	function showMoney(t){
		$(t).hide().siblings().show();
	}
	function html_decode(str)  
	{  
	    var div = document.createElement("div");
	    div.innerHTML = str;
	    return div.innerHTML;
	}
	
	
	// 查询新消息
	function showUnReadMessage(){ 
		$.ajax({ 
			type:"get", 
			async:true, 
			url : 'https://user.qbao.com/usercenter/message/unread/jsonp.html', 
			dataType : 'jsonp', 
			jsonp: "jsonpCallback", 
			jsonpCallback:'success_jsonpCallback', 
			success : function(record){ 
				if(record != null){ 
					if(record.data.messageList != null && record.data.messageList.length > 0){
						checkPopuped(record);
						//对应消息类型和下标 
						var messageTypeMap = { 
						'0':{name:'通知',classIcon:'notice'}, 
						'1':{name:'活动',classIcon:'activity'}, 
						'2':{name:'系统',classIcon:'system'} 
						} 
						// ========== 显示未读消息条数======== 
						var unreadMessageNumber = record.data.unreadMessageNumber; 
						if(unreadMessageNumber >= 100){ 
							unreadMessageNumber = '99+'; 
						} 
						$('#messageNumber1').html(unreadMessageNumber); 
						$('#messageNumber2').html(unreadMessageNumber); 
						$('#newMessageList').html(''); 
						// ============显示未读消息列表============ 
						for(var i in record.data.messageList){ 
							var message = record.data.messageList[i]; 
							var t = messageTypeMap[message.messageType]; 
                                                        message.body = message.body.replace(/src=/g, 'unknown=');
							var content = $('<p>'+(message.body||'')+'</p>').text(); 
							// 如果内容大于38个字，则后边显示省略号 
							if(content.length > 87){ 
							content = content.substr(0,87) + '...'; 
							} 
							var tmp = '<li><a target="_blank" href="http://www.qbao.com/messageboard/my/message.html?messageType='+message.messageType+'&userMessageId='+message.id+'"><div class="news-main"><span><i class="'+t.classIcon+'-icon"></i><b class="notice-name">'+t.name+'</b></span>'; 
							tmp += '<div class="news-info">';
							if(message.messageType != '2'){
								tmp += '<h3>'+message.title+'</h3>';
							}
							tmp += '<p>'+content+'</p></div>'; 
							tmp +='</div></a></li>'; 
							$('#newMessageList').append(tmp); 
						} 
						$('#hasMessage').show(); 
						$('#noMessage').hide(); 
					}else{ 
						$('#hasMessage').hide(); 
						$('#noMessage').show(); 
					} 
				} else {
						$('#hasMessage').hide(); 
						$('#noMessage').show(); 
				}
			}, 
			error : function(data){
			} 
		}); 
	}
	function checkPopuped(record){
	    // 设置cookie，下次不再检查是否弹出消息框
	    if(record.data.popuped != null){
	        // 设置过期时间为当天的23:59:59
	        if($.cookie(allName+'-popuped') == null) {
	            var expireDate = new Date();
	            expireDate.setHours(23);
	            expireDate.setMinutes(59);
	            expireDate.setSeconds(59);
	            $.cookie(allName + '-popuped', record.data.popuped, {expires: expireDate});
	        }
	        // 弹出消息框
	        if(record.data.popuped == 0) {
	            $('#siteTopId').addClass('site-init');
	            messageAnimate();
	        }
	    }
	}
</script>
<div id="siteTopId" class="site-top">
    <!--灰色导航-->
    <div class="site-nav clearfix">
        <div class="site-nav-bd">
            <!--头部左侧菜单-->
            <ul class="site-nav-bd-l" style="display: none;" id="headerTop">
                <!--未登录-->
                <li class="menu menu-login" id="nologin" style="display: none;">
					<a href="http://user.qbao.com/usercenter/ucIndex.html" class="orange">登录</a>
					<span>-</span>
					<a href="http://user.qbao.com/usercenter/regist/toRegist.html" class="orange" target="_blank">注册</a>
				</li>
                <li id="messagePipe" class="site-nav-pipe"></li>
                <!--有消息-->
                <li id="hasMessage" class="menu user-news" style="display: none">
                    <div class="menu-hd hi-icon-effect">
                        <a href="http://www.qbao.com/messageboard/my/message.html" target="_blank" title="消息">
                            <i class="message-icon hi-icon"><!--图标--></i> 消息
                        </a>
                        <span class="number-icon" id="messageNumber1">0</span>
                        <i class="arrow-icon"><!--箭头--></i>
                    </div>
                    <!--消息main-->
                    <div class="menu-bd">
                        <div id="siteNewsLayoutId" class="news-layout">
                            <div class="user-main user-message">
                                <h2>新消息<span class="number-icon" id="messageNumber2">0</span>
                                </h2>
                                <ul id="newMessageList">
                                    
                                </ul>
                            </div>
                            <div class="user-medal">
                                <a target="_blank" href="http://www.qbao.com/messageboard/my/message.html" title="查看全部消息" class="menu orange under-line">查看全部消息</a>
								<span class="fr">
									<a target="_blank" href="http://www.qbao.com/messageboard/my/list.html" title="我的留言" class="orange under-line">我的留言</a>
								</span>
                            </div>
                            <!--收起按钮-->
                            <span id="siteNewsUpBtn" class="news-up"></span>
                        </div>
                    </div>
                </li>
                <!--没有消息-->
                <li class="menu user-news" id="noMessage">
                    <div class="menu-hd  hi-icon-effect">
                        <a href="http://www.qbao.com/messageboard/my/message.html" target="_blank" title="消息">
                            <i class="message-no-icon  hi-icon"></i>
                            	消息
                            <i class="arrow-icon"></i>
                        </a>
                    </div>
                    <div class="menu-bd news-none">
                        <div class="user-layout">
                            <div class="user-main user-message">
                                <h2>没有新消息</h2>
                                <div class="no-news"></div>
                            </div>
                            <div class="user-medal">
                                <a target="_blank" href="http://www.qbao.com/messageboard/my/message.html" title="查看全部消息" class="menu orange under-line">查看全部消息</a>
								<span class="fr">
									<a target="_blank" href="http://www.qbao.com/messageboard/my/message.html" title="我的留言" class="orange under-line">我的留言</a>
								</span>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="site-nav-pipe"></li>
                <li class="menu menu-hd hi-icon-effect">
                    <a href="http://www.qianw.com/portal/newsAndEvent.html" target="_blank" title="钱宝新闻">
                        <i class="qBaoNews-icon hi-icon"></i>
                        	钱宝新闻
                    </a>
                </li>
            </ul>
            <!--头部右侧菜单-->
            <ul class="site-nav-bd-r">
                <li class="menu menu-hd menu-home hi-icon-effect" id="top_qbIndex" style="display: none;">
                    <a href="http://www.qbao.com" title="钱宝网首页">
                        <i class="home-icon hi-icon"></i>
                        <!--图标-->
                        	钱宝网首页
                    </a>
                </li>
                <li class="site-nav-pipe" style="display: none;"></li>
                <li class="menu menu-hd userCenter-nav">
                    <a href="http://user.qbao.com/usercenter/ucIndex.html" title="用户中心">用户中心<i class="arrow-icon"></i></a>
                    <ul class="userCenter-menu">
                        <li><a target="_blank" href="https://www.qbao.com/wallet/recharge.html?username=" title="账户充值">账户充值</a></li>
                        <li class="odd"><a target="_blank" href="https://www.qbao.com/wallet/transfer.html" title="账户提现">账户提现</a></li>
                        <li><a href="http://www.qbao.com/task/userTaskInProcess.html" title="任务管理">任务管理</a></li>
                        <li class="odd"><a href="http://bizorder.qbao.com/buyerOrderQuery/buyerOrderList.htm" title="订单管理">订单管理</a></li>
                        <li><a href="http://user.qbao.com/usercenter/securityCenter.html" title="安全中心">安全中心</a></li>
						<li class="odd"><a href="http://qhb.qbao.com/usercenter/rewardsDetails.html?tabType=wait" title="领取红包收益">领取红包收益</a></li>
                    </ul>
                </li>
                <li class="site-nav-pipe"></li>
                <li class="menu menu-hd">
                    <a target="_blank" href="http://user.qbao.com/merchantUser/merchantUcIndex.html" title="商家平台">商家平台</a>
                </li>
                <li class="site-nav-pipe"></li>
                <li class="menu menu-hd">
                    <a href="http://help.qbao.com" title="帮助中心" target="_blank">帮助中心</a>
                </li>
                <li class="site-nav-pipe"></li>
                <li class="menu menu-hd hi-icon-effect">
                    <a target="_blank" href="http://www.qbao.com/appdownload.html" title="手机逛钱宝">
                        <i class="iphone-icon hi-icon"></i>
                        <!--图标-->
                        	手机逛钱宝
                    </a>
                </li>
                <li class="site-nav-pipe"></li>
                <li class="menu menu-hd">
                    <a href="http://www.qbao.com/en" target="_blank" title="English" style="color: #e77d00;" id="ut16">English</a>
                </li>
            </ul>
        </div>
    </div>
    <!--透明遮罩-->
    <div class="shadow_tran"></div>
    <!--黑色遮罩-->
    <div class="user_shadow"></div>
</div>
<script type="text/javascript">
function messageAnimate(){
        (function (window) {
            var siteTopId = document.getElementById('siteTopId'),
                    siteNewsUpBtn = document.getElementById('siteNewsUpBtn'),
                    siteNewsLayoutId = document.getElementById('siteNewsLayoutId');
            className = siteTopId.className;

            window.setTimeout(function () {
                siteNewsLayoutId.style.top = 0 + 'px';
            }, 1);

            siteNewsUpBtn.onclick = function () {
            	siteNewsUpAndDown();
            }
            window.setTimeout(function () {
            	siteNewsUpAndDown();
            },5000);
            
            function siteNewsUpAndDown(){
            	if (className.indexOf('site-init') >= 0) {
                    siteNewsLayoutId.style.top = -800 + 'px';
                }

                window.setTimeout(function () {
                    siteNewsLayoutId.removeAttribute('style');
                    siteNewsLayoutId.parentNode.style.height = 0 + 'px';
                    siteTopId.className = className.replace('site-init', '');

                    window.setTimeout(function () {
                        siteNewsLayoutId.removeAttribute('style');
                        siteNewsLayoutId.parentNode.removeAttribute('style');
                    }, 600);
                }, 300);
            }
        })(window);
}
</script>

	<script type="text/javascript"> 
	var nickName = ''; 
	</script> 
    











<script>
var isIndex = false;
</script>
<div class="site-menu" id="navigation">
    <div id="site-menu-fixed">
        <div class="transBG"></div>
        <div class="site-menu-main">
            <div class="site-navbox clearfix">
                <div class="site-logo fl">
                    <a href="http://www.qbao.com"><img id="headerLogo" src="/images/header/qb-logo.png">
                    </a>
                </div>
                <div class="site-navlist fr">
                    <ul class="nav" id="navboxLi">
                        <li id="menu_0"><a href="http://www.qbao.com">首页</a></li>
                        <li id="menu_2"><a target="_blank" href="http://www.qbao.com/ntask/home.html">任务大厅</a></li>
                        <li id="menu_7"><a target="_blank" href="http://paipai.qbao.com">雷拍</a></li>
                        <li id="menu_8"><a target="_blank" href="http://bc.qbao.com">宝购</a></li>
                        <li id="menu_9"><a target="_blank" href="http://qhb.qbao.com" id="qhbPath">抢红包</a></li>
						<li id="menu_11"><a target="_blank" href="http://store.qbao.com/market-web/market-index.html">应用市场</a></li>
                        <li id="menu_10"><a target="_blank" href="http://www.qbao.com/promote/index.html">推广</a><em class="new"></em></li>
                        <li id="menu_10"><a target="_blank" href="http://events.qbao.com/index.html">活动</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
if(undefined !== showIndex && '' !== showIndex){
	$('#menu_'+showIndex).addClass('current');
}
if(nickName != '' && nickName != 'anonymousUser'){
	$('#qhbPath').attr('href','http://qhb.qbao.com/home.html');
}
$(function(){
	if(isIndex){
		//菜单栏随滚
		window.onscroll = function() {
		    var top = document.documentElement.scrollTop || document.body.scrollTop;
		    var elementId = document.getElementById("site-menu-fixed");
		    if (top >= 134) {
		        elementId.className = "site-menu-fixed";
		    }
		    if (top < 134) {
		        elementId.className = elementId.className.replace("site-menu-fixed", "");
		    }
		};
		if((document.documentElement.scrollTop || document.body.scrollTop)>134){
    		window.onscroll();
    	}
	}
});
$.ajax({
	type : 'post',
	async:true,
	url : 'https://www.qbao.com/account/logoUrl.html',
	dataType : 'jsonp',
	jsonp: "jsonpCallback",
	success : function(record){
		if(record != null){
			$('#headerLogo').attr('src','https://www.qbao.com/bannerManager1/loadBannerPic1.html?bannerId='+record.id);
		}
	},
	error : function(data){
	}
});
</script>

<script>window.location.href='https://passport.qbao.com/cas/qianbaoLogin?service=http%3A%2F%2Fpay.qbao.com%2Fj_spring_cas_security_check';</script>