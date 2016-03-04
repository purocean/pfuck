   �         http://pay.qbao.com/js/user.js�       ����      %O 7c�              �      
     O K      Date   Sun, 28 Feb 2016 11:10:46 GMT   Content-Type   %application/javascript; charset=utf-8   Vary   Accept-Encoding   Last-Modified   Thu, 04 Feb 2016 01:00:30 GMT   Content-Encoding   gzip   X-Cache   pass // JavaScript Document
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g,"");
}

var qb_user = {};

qb_user.isEmpty = function(msg){
	return !/.+/.test(msg);
}

//关闭遮罩和弹出框
qb_user.closePop = function(popWin,shadow){
	if(popWin.length){
		popWin.hide();	
	};
	if(shadow.length){
		shadow.hide();	
	};
}

//弹出dialog
qb_user.dialog = function(option){
	var defaults={
			popBtn:"",
			shadow:1,
			popBox:"",
			closeTag:$(".u2_pbClose"),
			eventType:'click'
		};
	$.extend(defaults,option);
	
	function addShadow(){
		var shadow = '<div id="user_shadow"></div>';
		if($("#user_shadow")[0]){
			$("#user_shadow").show();	
		}else{
			$(defaults.popBox).before(shadow);	
		}
	};
	
	function popWin(){
		var obj = defaults.popBox,
			h = obj.outerHeight(),
			w = obj.outerWidth();
		obj.css({"position":"fixed","left":"50%","top":"50%","margin-left":-w/2,"margin-top":-h/2,"z-index":"100000"});
		obj.show();
	};
	
	function closeWin(){
		defaults.popBox.hide();
		$("#user_shadow").hide();
		if( defaults.closeCallback ){
			defaults.closeCallback();
		}
	};
	
	function init(){
		if(defaults.popBtn =="") return false;
		defaults.popBtn.live(defaults.eventType,function(e){
			if( defaults.login=="" || defaults.login== 'anonymousUser' ){
				if(defaults.doThing){
					defaults.doThing();
				}
			}else{
				var $this = $(this);
				if(defaults.popBox!=""){
					popWin();
					if(defaults.shadow){
						addShadow();
					}
				}
				if(defaults.callback){
					defaults.callback($this);
				}
			}
			e.preventDefault();
		});
		$(defaults.closeTag,defaults.popBox).bind('click',function(){
			closeWin();	
		});
	}
	init();
};

qb_user.dialogOption = {
	addShadow:function (obj){
		var shadow = '<div id="user_shadow"></div>';
		if($("#user_shadow")[0]){
			$("#user_shadow").show();	
		}else{
			obj.after(shadow);
		}
	},
	
	popWin:function (obj){
		var h = obj.outerHeight(),
			w = obj.outerWidth();
		obj.css({"position":"fixed","left":"50%","top":"50%","margin-left":-w/2,"margin-top":-h/2,"z-index":"100000"});
		obj.show();
	},
	
	closeWin:function (obj){
		obj.hide();
		$("#user_shadow").hide();
	}
}

qb_user.initCard = function(){
	$.ajax = ({
		type: "get",
		dataType:"json",
		url: "",
		complete:"",
		success: function(msg){//msg为返回的数据，在这里做数据绑定
			var data = "";
		}
	});
};

$(document).ready(function(){

	$(window).bind("load",function(){ 
//		if($("#username").val().length<=0){
//			$("#username").siblings(".defaultTips").show();
//			$("#password").siblings(".defaultTips").show();
//		}
	});
	/*表单提示*/ 
	$(".forms .input_text").bind({ 
		focus:function(){ $(this).siblings(".defaultTips").hide(); }, 
		blur:function(){ 
			if($(this).val() == "")
			$(this).siblings(".defaultTips").show(); 
		},
		load:function(){ 
			if($(this).val() == "")
			{$(this).siblings(".defaultTips").show(); }
		}
	}); 
	
	$(".defaultTips").click(function(){ $(this).hide();$(this).siblings("input").focus();})

  // dropdown下拉框
  $('html').click(function(){
    $(".formDdlBox").hide();
  })
  $(".formDropDown").click(function(e){
    $(this).parent().next().fadeIn();
    e.stopPropagation();
  })

  // 鼠标移至问号出现提示信息
  $(".u2_whyTipBox").hide();
  $(".u2_why").hover(function(){
		$(this).siblings(".u2_whyTipBox").toggle();
	})
})

    //CharMode函数
    //测试某个字符是属于哪一类
    function CharMode(iN) {
       if (iN>=48 && iN <=57) //数字
        return 1;
       if (iN>=65 && iN <=90) //大写字母
        return 2;
       if (iN>=97 && iN <=122) //小写
        return 4;
       else
        return 8; //特殊字符
    }

    //bitTotal函数
    //计算出当前密码当中一共有多少种模式
    function bitTotal(num) {
       modes=0;
       for (i=0;i<4;i++) {
        if (num & 1) modes++;
         num>>>=1;
        }
       return modes;
    }

    //checkStrong函数
    //返回密码的强度级别
    function checkStrong(sPW) {
       if (sPW.length<=4)
        return 0; //密码太短
        Modes=0;
        for (i=0;i<sPW.length;i++) {
         //测试每一个字符的类别并统计一共有多少种模式
         Modes|=CharMode(sPW.charCodeAt(i));
       }
       return bitTotal(Modes);
    }

	
	function checkPassword(str){
		var cpTips = document.getElementById("checkPw");
		var cpExist =  document.getElementById("checkPwExist");
		var uPw = /^([u4e00-u9fa5]|[ufe30-uffa0]|[a-za-z0-9_]){6,14}$/  //密码
		if (uPw.test(str)) {
				//alert(222);
				cpTips.innerHTML = "<span><\/span>";
				cpTips.className="tips okTips mt10 fl db ";
				cpExist.style.display="none";
				return true;
			}
		else{
				//alert(333);
				cpTips.innerHTML = "<span><\/span>密码长度或格式不正确";
				cpTips.className="tips errTips mt10 fl db";
				cpExist.style.display="none";
				return true;
		}
	}
	
	
	qb_user.money = {
			digit_check:function(price){
				 return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
			},
			digit_uppercase:function(n){  
				var fraction = ['角', '分'], 
				    digit = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'],
				    unit = [ ['元', '万', '亿'], ['', '拾', '佰', '仟']  ],  
				    head = n < 0? '欠': '';  
				var check = this.digit_check(Math.abs(n));  
			  	if(!check){
					return "输入错误！";	
				}
			  	if(n.toString().length>12){
			  		return "输入的数值过大，请重新输入！";
			  	}
				var s = '';  
				
				var j = n.toString().split(".")[1],k=new Array();
				if(j!=undefined){
					k = j.split("");
					for (var i = 0; i < fraction.length; i++) {
						if(k[i]!='0' && k[i]!=undefined){
							s += digit[k[i]] + fraction[i];
							s = s.replace(/零/, '');
						}
					}	  
				} 

				s = s || '整';  
				n = Math.floor(n);  
			  
				for (var i = 0; i < unit[0].length && n > 0; i++)   
				{  
					var p = '';  
					for (var j = 0; j < unit[1].length && n > 0; j++)   
					{  
						p = digit[n % 10] + unit[1][j] + p;  
						n = Math.floor(n / 10);  
					}  
					s = p.replace(/(零.)*零$/, '').replace(/^$/, '零')  + unit[0][i] + s;  
				}  
				
				return head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');  
		    }  
		};
	
String.prototype.trim=function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}


/**
 * 将数值四舍五入后格式化成金额形式
 *
 * @param num 数值(Number或者String)
 * @return 金额格式的字符串,如'1,234,567.45'
 * @type String
 */
 function formatCurrency(s, n)  
 {  
    n = n >= 0 && n <= 20 ? n : 2;  
    var amt = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n);
    var amtString = amt + "";
    if(amt < 0){
    	amtString = amtString.substring(1, amtString.length);
    	
    }
    s =  amtString+ "";  
    var l = s.split(".")[0].split("").reverse();
    if(n > 0){
    	 r = s.split(".")[1];  
    }
   
    var t = "";  
    for(var i = 0; i < l.length; i ++ )  
    {  
       t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
    }  
    
    var currencyAmount = "0";
    if(n > 0){
    	currencyAmount = t.split("").reverse().join("") + "." + r;
    }else{
    	
    	currencyAmount = t.split("").reverse().join("");
    }
    
    if(amt < 0){
    	
    	currencyAmount = "-" + currencyAmount;
    }
    
    return currencyAmount;  
 }
 
 
 
/**
 * 关闭当前窗口
 */
 function closeCurrentPage() {

 	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
			window.opener = null;
			window.close();
		} else {
			window.open('', '_top');
			window.top.close();
		}
	} else if (navigator.userAgent.indexOf("Firefox") > 0) {
		window.location.href = 'about:blank ';
	} else {
		window.opener = null;
		window.open('', '_self', '');
		window.close();
	}

}