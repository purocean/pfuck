   �         *https://passport.qbao.com/js/qbao/adset.js     %g�WH     %��              �      
     O K      Content-Type   %application/javascript; charset=utf-8   Content-Length   209   Accept-Ranges   bytes   Last-Modified   Wed, 09 Dec 2015 18:25:28 GMT   Date   Sun, 28 Feb 2016 11:18:19 GMT   Expires   Sun, 28 Feb 2016 12:13:17 GMT   Etag   W/"209-1449685528000"   X-Cache   hit 
function adset(){
	if($(window).width()<1280){
		$(".adLeftSide").hide();
		$(".adRightSide").hide();
	}
}

$(document).ready(function(){
	adset();
	$(window).resize(function(){
		adset();
	})
})