   �         1http://www.qbcdn.com/csc/web/js/product-buycar.js     %��      %^ �=8              �      
     O K      Server   NWS_Appimg_HY   Date   Sun, 28 Feb 2016 11:10:42 GMT   Cache-Control   max-age=7776000   Expires   Sat, 28 May 2016 11:10:42 GMT   Last-Modified   Fri, 19 Feb 2016 02:41:55 GMT   Content-Type   application/x-javascript   Content-Encoding   gzip   X-Cache-Lookup   Hit From Disktank Gz ﻿$(function(){

  $.ajax({
     url: "http://csc.qbao.com/cart2/show.html?timestamp="+getSeconds(),
     type: "post",
     dataType: "json",
     contentType: "application/json; charset=utf-8",
     //data: {"aa":window.location.href},
     success: function(data, status, jqXHR) {
     //初始化值
     if(data.success){
        var h=data.data;
		    var detail=h.listSettleDetail;  //商品信息
		    var address=h.consignee;  //地址
		    var length=detail.length;
		    var cartNumber=h.cartNumber;  //车号
		    var shops=$('#shops');
        if(request("buyCar")!=1) $('#buycar').css({'display':'inline-block'});
		    if(length <= 0) return;
        if(address!=null && address!=''){
          if(address.consigneeAddr==null ||address.consigneeAddr=='' ||!address.consigneeAddr){
            shua();
          }else{
            $("#name").text(address.consigneeName);  
            $("#tel").text(address.consigneeMob);
            $("#address").text(address.consigneeAddr);
            $('.selectadress-now-user').find('strong').hide();
          }
        } else{
          shua();
        }
		  
		  //console.log(detail[0].shopId); 
		    var str="<div class='good-list-con' name='";
		    var str0="'><div class='td-h good-name-td'><div class='good-pic'><a href='http://goods.qbao.com/info/product-detail.htm?spuId=";
		    var str1="' target='_blank' name='icart1_goods_pic'><img onerror=\"this.src='http://csc.qbao.com/web/images/logo.png'\" src='";
		    var str2="' alt=''></a></div><div class='good-info'><a href='http://goods.qbao.com/info/product-detail.htm?spuId=";
		    var str3="' target='_blank' class='good-title'> <span>";
		    var str5="</em>钱宝币</div><div class='td-h good-num-td  proinfo-num'>";
		    var str6="</div><div class='td-h good-allprize-td  goodallprize'>";
		    var str7="</div></div>";
		    var strs1="<div class='busess-mes' name='";
		    var strs2="'><div class='buessLy'><span>给商家留言</span><textarea class='c-store-message content' placeholder='选填：对本次交易的补充说明，限100字'></textarea></div><div class='exp-way'><span>邮费</span><select class='mode'></select></div></div>";
		    var strId=[];
		    var stra='';
        var numm=h.payAmount;
        var numms=h.salesAmount;
        var pris=0;
        var desc='';
		    for(var i=0;i<length;i++){
          if(detail[i].skuDesc==null || detail[i].skuDesc==''){
              desc='默认型号';
             }else{
              desc=detail[i].skuDesc;
             }
			    if(detail[i].cer[2]==1){
			      var str4="</span><span>型号："+desc+"</span><span><em>罚</em>假一罚十</span></a></div></div><div class='td-h good-prize-td goodprize'><em id='unit-price'>";
			    }else{
			      var str4="</span><span>型号："+desc+"</span></a></div></div><div class='td-h good-prize-td goodprize'><em id='unit-price'>";
			    }
			  var stra=str+detail[i].shopId+str0+detail[i].goodsId+str1+detail[i].mainImg+str2+detail[i].goodsId+'&channel=&bizId=&refId='+str3+detail[i].goodsName+str4+detail[i].listPrice+str5+detail[i].quantity+str6+detail[i].payAmount+str7;
			  strId.push(detail[i].shopId);
			  shops.append(stra);
        pris+=detail[i].quantity;
		    }
      
		    var shops=strId;
		    $.unique(shops);
		    var len=shops.length;
		    var stri='';
		    var lens=h.listPostage.length;
		    for(var j=0;j<len;j++){
			    var div=$(".good-list-con[name="+shops[j]+"]").last();
		      stri+='&shopIds='+shops[j];
			    div.after(strs1+shops[j]+strs2);
          //console.log(h.listPostage[0].postage)
          var mode=$(".busess-mes[name="+shops[j]+"]").find('.mode');
        
          if(lens>0){
            if(h.listPostage[0].postage==0 ||h.listPostage[0].postage==''){
              mode.html("<option value=''>包邮</option>");
            }else{
              mode.html("<option value=''>"+h.listPostage[0].postage+"钱宝币</option>");
            }
            var x=numms+h.listPostage[0].postage;
            $('#totalPrice em').text(_formatPrice(x));
            $('.paydetail-prize dd').eq(0).text(_formatPrice(numm));
          }else{
            mode.html("<option value=''>包邮</option>");
            $('#totalPrice').hide();
            $('#totalPrice em').text(numms);
            $('.paydetail-prize dd').eq(0).text(numm);
          }  
		    }
		    $('#total em').text(pris);  
		    $('#shops').attr('name',cartNumber)
		  
		    //console.log(string);
		    shop(stri,cartNumber,detail[0].sellerId);
        discount();
        getStoreAddr();
		    return;   
        }else{
          if(data.returnCode==1004){
                  location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
                  return;
          }
          location.href="http://csc.qbao.com/web/buycar.htm";
          //$('.ordercon').html('<div class="nothisgoods"><p>'+data.message+'</p></div>')
		      return;
        }
               
      },
     error: function(){
        loginstatus=false;
     }
   });
 
  $('#refreshAddr').on('click',function() {
      loading();
      getStoreAddr();

  })
   
  
  //立即付款（创建订单页）
  $('#creatOrder').click(function() {
    var sellerId = $('#sellerId').attr('value'),
      $selectadress = $('.selectadress-now-user'),
      consignee = $selectadress.find('span:eq(0)').text(),
      phoneNum = $selectadress.find('span:eq(1)').text(),
      address = $selectadress.find('dd:eq(1)').text(),
	    shopId=$('.busess-mes').attr('name'),
	    text=$('.content').val(),
	    cartNumber=$('#shops').attr('name'),
      name=$('#shopname').text();
    if(consignee=="" || phoneNum=="" || address=="" ){
        APP.tips('warn','请先添加收货地址',2000);
       return false;
    }
    var display =$('.orderadress-more').css('display');
    if(display != 'none'){
      APP.tips('warn','请保存收货地址！',2000);
      return;
    }
	var aa =[    
	          {
                  "buyerMessage":text,
                  "shopId":shopId
				 } 
	]; 
  
    $.ajax({
      url: "http://csc.qbao.com/cart2/orderSubmit.html?&cartNumber="+cartNumber+"&shopName="+name+"&timestamp="+getSeconds(),
      type: "post",
      data: JSON.stringify(aa),
	    dataType: "json",
      contentType: "text/json; charset=utf-8",
      success: function(data) {
        if(data.success){
            $('#orderForm').html(data.data);
            $('#orderForm').find('form').submit()
        }
        else{   
           APP.tips("warn", data.message, 2e3);
          return;
              
        }
      },
      error: function() {loginstatus=false;}
    });
  })

  chageadress.init();
  chageadress.updown();
  chageadress.chosetype();
  $(".orderadress-more").delegate("input:radio[name='fare54']","click",function(){
       var $loopitem=$(this).parent().parent();
       $loopitem.addClass('selectadress').siblings().removeClass('selectadress');
       
   })

  //优惠劵点击
 /** $('#pitch').on('click',function(){
     if($('.pitchs').length==0){
        $(this).addClass('pitchs');
     }else{
        $(this).removeClass('pitchs');
     }
  })
  //切换
  $('#select').on('click',function(){
     if($('.qie').length==0){
        $('#qie').addClass('qie');
        var w=$('.paydetail-juan dd').width();
        $('#option').css({
          'width':w+'px'
        })
        $('#option').show();
     }else{
        $('#qie').removeClass('qie');
        $('#option').hide();
     }
  })
  //点击选择
  $('#option').find('li').on('click',function(){
    var text=$(this).text();
    $('.select span').text(text);
    $('#qie').removeClass('qie');
    $('#option').hide();
    $(this).addClass('opt').siblings().removeClass('opt');
  })**/

  
})
/*
 * 2015/10/04 huanglihuan
 *
 * */
var chageadress = chageadress || {};
chageadress.init = function() {
  $(".orderadress-more").hide();
  $("input[name=fare54][checked]").val(); //È¡µÃÑ¡ÖÐµÄÖµ
};

chageadress.updown = function() {
  $(".moreadress").unbind().click(function() {
    $(".orderadress-more").slideToggle();
    $(this).hasClass() || $(this).addClass();
    if($(".orderadress-more").size()<=0){
      APP.tips("warn", "您还没有收货地址，请添加！", 2e3);
      return;
    }
	if($(this).attr('name')==1){
    loading();
	  preservation($(this));
	  return;
	}else{
    $(this).attr('name',1);
    $('.moreadress').text('确认配送信息');
	  return;
	}
	
  })
};

chageadress.chosetype = function() {
 // $("input:radio[name='fare54']").change(function() {
    //$(this).parent().parent().addClass('selectadress ').siblings().removeClass('selectadress');
 // });
};
  //请求收货地址
var getStoreAddr=function() {
    $.ajax({
      url: "http://csc.qbao.com/cart2/consignee/query.html?timestamp="+getSeconds(),
      type: "post",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      success: function(data, status, jqXHR) {
        if(data.success){
              $('.orderadress-more').empty();
              var len=data.data.length
              for (var i = 0; i <len; i++) {
                var pointer = data.data[i];
                var consignee = pointer.consignee;
                var phoneNum = pointer.phoneNum;
                //var province = pointer.provinceName == pointer.cityName ? pointer.provinceName : pointer.provinceName + pointer.cityName;
                //var address = province + pointer.countyName + pointer.address;
                var address=pointer.provinceName + pointer.cityName+pointer.countyName + pointer.address;
                var mod = $('.addrmod').clone();
                mod.find('.selectadress-now').find('span:eq(0)').text(consignee);
                mod.find('.selectadress-now').find('span:eq(1)').text(phoneNum);
                mod.find('.selectadress-now').find('dd:eq(1)').text(address);
                mod.find('input').attr('cityId',pointer.cityId);
                mod.find('input').attr('consigneeId',pointer.id);
                //if (pointer.isDefault == 'y') {
                if (i==0) {
                   mod.find('>div:eq(1)').addClass('selectadress');
                   mod.find('input').attr('checked','checked');
                }
                $('.orderadress-more').append(mod.html());
              }
         }else{          
            if(data.returnCode==1004){
                  location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
                  return;
            }

            //APP.tips("warn","您还没有收货地址，请添加！", 2e3);
            
         }
         unloading();
         return;
      },
      error: function() {loginstatus=false;}
    });
  };
//订单
var shop=function(stri,cartNumber,sellerID){
  $.ajax({
     url: "http://csc.qbao.com/shop/query.html?timestamp="+getSeconds()+stri,
     type: "post",
     dataType: "json",
     contentType: "application/json; charset=utf-8",
     //data: {"aa":window.location.href},
     success: function(data, status, jqXHR) {
     //初始化值
       if(data.success){
          var h=data.data;
		      var len=h.length;
		      var shop=$('#shops');
		      var str="<div class='good-list-title'><div class='td good-name-td good-name'><img onerror=\"this.src='http://csc.qbao.com/web/images/logo.png'\" src='http://csc.qbao.com/web/images/enter_icon.png";
		      var str1="' height='15' width='17' /><a id='shopname' href='http://enterprise.qbao.com/merchant/shop/qry/toWebShopHome.html?shopUserId=";
		      var str2="' target='_blank'>";
		      var str3="</a></div><div class='td good-prize-td good-prize'>单价（钱宝币）</div><div class='td good-num-td good-num'>购买数量</div><div class='td good-allprize-td good-allprize'>小计（钱宝币)</div></div><div id='shopCon'></div>";
		  
		      for(var i=0;i<len;i++){
			      var div=$(".good-list-con[name="+h[i].id+"]").first();
			      //var strs=str+h[i].logoPath+str1+h[i].id+str2+h[i].shopName+str3;
            var strs=str+str1+sellerID+str2+h[i].shopName+str3;
			      //console.log(div)
		        div.before(strs);
		      }
		 
        }else{
          //APP.tips("warn", data.message, 2e3);
	        if(data.returnCode==1004){
                  location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
                  return;
          }
	      }
               
     },
     error: function(){
        loginstatus=false;
     }
   });

}



//保存
var preservation=function(_this){
	var cartNumber=$('#shops').attr('name');
	var cityId=$('.selectadress').find('input').attr('cityid');
  var consigneeId=$('.selectadress').find('input').attr('consigneeId');
	var consigneeName=$('.selectadress').find('.selectadress-now').find('span').eq(0).text();
	var consigneeMob=$('.selectadress').find('.selectadress-now').find('span').eq(1).text();
	var consigneeAddr=$('.selectadress').find('.selectadress-now').find('dd').eq(1).text();
	//var str="{'cartNumber':"+cartNumber+", 'consigneeInfo': {'cityId':"+ consigneeName+", 'consigneeName': "+consigneeName+", 'consigneeMob':"+consigneeMob+",'consigneeAddr':"+consigneeAddr+"}}";
	var aa = {                  
                "cartNumber": cartNumber,
                "consigneeInfo": {
                  "cityId":cityId,
                  "consigneeName":consigneeName,
                  "consigneeMob":consigneeMob,
                  "consigneeAddr":consigneeAddr,
                  "consigneeId":consigneeId
                },
				"timestamp":getSeconds()
            };
              
  $.ajax({
            url: "http://csc.qbao.com/cart2/consignee/save.html",
            type: "post",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(aa),
            success: function(data, status, jqXHR) {
              unloading();
              //初始化值
              if(data.success){
                var h=data.data;
				        var loopitem=$('.selectadress div.selectadress-now'); 
				        var name=loopitem.find('span:eq(0)').text();
                var phone=loopitem.find('span:eq(1)').text();
                var addr=loopitem.find('dd:eq(1)').text();
                $('.selectadress-now-user span:eq(0)').text(name);
                $('.selectadress-now-user span:eq(1)').text(phone);
                $('.selectadress-now-user dd:eq(1)').text(addr);
                _this.attr('name','');
                $('.moreadress').text('切换地址');
                var n=h.payAmount;
                var x=h.saleAmount+h.listPostageResData[0].postage;
                var mode=$(".busess-mes").find('.mode');
                if(h.listPostageResData[0].postage==0 ||h.listPostageResData[0].postage==''){
                  mode.html("<option value=''>包邮</option>");
                }else{
                  mode.html("<option value=''>"+h.listPostageResData[0].postage+"钱宝币</option>");
                }
                $('#totalPrice').show();
                $('#totalPrice em').text(_formatPrice(x));
                $('.paydetail-prize dd').eq(0).text(_formatPrice(n));
              }else{
                 //location.href="http://events.qbao.com/user/loginSession.html?urlAdd="+window.location.href;
				         if(data.returnCode==1004){
                  location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
                  return;
                }
                if(data.data==null || data.data==''){
                  APP.tips("warn", '您还没有收货地址，请点击管理收货地址去添加！', 2e3);
                  return;
                }
                _this.attr('name','');
                $('.moreadress').text('切换地址');
                 APP.tips("warn", data.message, 2e3);
                
                 
              }
             
			       return;
               
            },
            error: function(){
                loginstatus=false;
            }
        });

}



var shua=function(){
  $.ajax({
     url: "http://csc.qbao.com/cart2/consignee/defaultSet.html?timestamp="+getSeconds(),
     type: "post",
     dataType: "json",
     contentType: "application/json; charset=utf-8",
     //data: {"aa":window.location.href},
     success: function(data, status, jqXHR) {
      unloading(); 
     //初始化值
       if(data.success){
          
          var h=data.data;
          var mode=$(".busess-mes").find('.mode');
          if(h!=null && h!=''){
            var address=h.consigneeInfo;  //地址
            var length=address.length;
            if(address.consigneeAddr==null ||address.consigneeAddr=='' ||!address.consigneeAddr){
              //$('.moreadress').hide();
              if($('.selectadress-now-user').find('strong').size()<=0){
                $('.selectadress-now-user').html('<strong style="font-weight:normal;font-size:14px;color:#888">您还没有收货地址，请添加。</strong>')
              }
              $('.selectadress-now-user span').text('');
              $('.selectadress-now-user dd:eq(1)').text('');
            }else{
              $("#name").text(address.consigneeName);  
              $("#tel").text(address.consigneeMob);
              $("#address").text(address.consigneeAddr);
              $('.selectadress-now-user').find('strong').hide();
            }
          } else{
            $('.selectadress-now-user').html('<strong style="font-weight:normal;font-size:14px;color:#888">您还没有收货地址，请添加。</strong>')
          }
          var lens=h.listPostageResData.length;
          var numm=h.payAmount;
          var numms=h.saleAmount;
          if(lens>0){
            if(h.listPostageResData[0].postage==0 ||h.listPostageResData[0].postage==''){
              mode.html("<option value=''>包邮</option>");
            }else{
              mode.html("<option value=''>"+h.listPostageResData[0].postage+"钱宝币</option>");
            }
            $('#totalPrice').show();
            var x=numms+h.listPostageResData[0].postage;
            $('#totalPrice em').text(_formatPrice(x));
            $('.paydetail-prize dd').eq(0).text(_formatPrice(numm));
          }else{
            mode.html("<option value=''>包邮</option>");
            $('#totalPrice').hide();
            $('#totalPrice em').text(numms);
            $('.paydetail-prize dd').eq(0).text(numm);
          } 
		  
       }else{
         if(data.returnCode==1004){
              location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
              return;
         }
        //APP.tips("warn", data.message, 2e3);
        $('.selectadress-now-user').html('<strong style="font-weight:normal;font-size:14px;color:#888">您还没有收货地址，请添加。</strong>');
		    return;
       }
              
     },
     error: function(){
        loginstatus=false;
     }
   });
}

//优惠链接
  var discount=function(){
    $.ajax({
            url: "http://csc.qbao.com/active/buyer/query.html?cartType=2",
            type: "post",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            //data: {"aa":window.location.href},
            success: function(data, status, jqXHR) {
              unloading();
              //初始化值
              if(data.success){
                var h=data.data;
                var len=h[0].detailViewList.length;
                var str="<dt>";
                var str0="</dt><dd>";
                var str2="</p><i></i></div></div>";
                var id=h[0].shopId;
                if(h[0].shopId!=null && h[0].shopId!='' && h[0].shopId!=undefined){
                  var div=$('.paydetail-back');
                  var lens=h[0].detailViewList.length;
                    
                   // console.log(descArr);
                    
                    if(h[0].limitDesc!=null && h[0].limitDesc!='' ){
                      
                      var descArr = JSON.parse(h[0].limitDesc);
                      var srcs='';
                      var str1="</dd><div class='cut-dian' style='display:inline;'><img src='http://csc.qbao.com/web/images/icon_warn.png' width='15' height='15'/></div><div class='cut-dis'><p>满返活动规则：<br/>";
                      for(var j=0;j<descArr.length;j++){
                        var a=j+1;
                        srcs+="<em>"+a+"."+descArr[j]+"</em><br/>";

                      }
                    }else{
                      var str1="</dd><div class='cut-dian'><img src='http://csc.qbao.com/web/images/icon_warn.png' width='15' height='15'/></div><div class='cut-dis'><p>满返活动规则：<br/>";
                      srcs='';
                    }
                    if(lens>0){
                      div.html(str+h[0].detailViewList[0].label+"："+str0+h[0].detailViewList[0].desc+str1+srcs+str2);
                      $('.paydetail-back').show();
                    } 

                  }
                   
                  cuts();
              }else{
                if(data.returnCode==1004){
                  location.href="http://passport.qbao.com/cas/qianbaoLogin?service=http://csc.qbao.com/j_spring_cas_security_check";
                  return;
                }
                APP.tips("warn", data.message, 2e3);
          
              }
               
               return;
            },
            error: function(){
                loginstatus=false;
            }
        });
  }

var request=function(str) {
  var href = window.location.href;
  var p = str + '=';
  var array = href.split(p);
  if (array.length > 1) {
    var b = array[1].split('&').length;
    if (b > 1) {
      return array[1].split('&')[0];
    } else {
      return array[1];
    }
  } else {
    return "";
  }
};
var getSeconds=function(){
      var date=new Date();
      var seconds=date.getTime();
      return seconds;
}
 // 设置价格格式

  // 格式化价格
  var _formatPrice=function(price) {
    var x = price;
    return String(x).replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
  }
  //loading
  var loading=function(){
    float('','loading');
  }
  
  //unloading
  var unloading=function(){
  $('.loading').hide();
  $('.float').hide();
  }
  
  //浮窗
  var float=function(m,clas){
      var width=$(window).width();
      var height=$(window).height();
      var width1=$('.'+clas).width();
      var height1=$('.'+clas).height();
      var h=$(document.body).height();
      var heights=0;
       var top=(height-height1)/2;
       var left=(width-width1)/2;
       $('.'+clas).css({
         'top':top+'px',
         'left':left+'px'
       });
       heights=height>h? height:h;
       $('.float').css({
          'height':heights+'px'
       });
       
       $('#dialog-tit').text(m);
      $('.float').show();
      $('.'+clas).show();
  }
  var cuts=function(){
    var cut=$('.cut-dian');
    cut.on('click',function(){
      var _this=$(this);  
      if(_this.attr('name')==1){
          _this.next().hide();
          _this.attr('name',0);
      }else{
        _this.next().show();
        var h=_this.next().find('p').height();
        _this.next().find('p').css({
        'margin-top':-(h+30)
        })
        _this.next().find('i').css({
        'margin-top':-9,
        'margin-left':65
        })
        _this.attr('name',1);
      }
      
    })
  }