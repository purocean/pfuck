   �          https://www.qbao.com/js/adset.js     %hUx     %�	P              �      
     O K      Date   Sun, 28 Feb 2016 11:10:46 GMT   Content-Type   %application/javascript; charset=utf-8   Content-Length   209   Accept-Ranges   bytes   Expires   Mon, 29 Feb 2016 10:52:11 GMT   Last-Modified   Tue, 24 Nov 2015 07:23:30 GMT   Etag   W/"209-1448349810000"   X-Cache   hit 
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