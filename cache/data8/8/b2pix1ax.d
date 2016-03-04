   �         &https://passport.qbao.com/css/base.css     %gz�     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   text/css   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 11:33:30 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:28 GMT   X-Cache   hit @charset "UTF-8";

html, body, div, span, applet, object, iframe, table, caption,tbody, tfoot, thead, tr, th, td, del, dfn, em, font, img, ins,kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,       h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr,acronym, address, big, cite, code, dl, dt, dd, ol, ul, li,fieldset, form, label, legend 
{vertical-align:baselinebaseline;font-weight:inherit;font-style:inherit;font-size:100%;outline:0;padding:0;margin:0;border:0;}       
:focus {outline:0;}       
body {font-size:12px; font-family:Arial, Helvetica, sans-serif, '微软雅黑'; color:#666; background:#f3f3f3;}       
ol, ul {list-style: none;}       
table {border-collapse: separate;border-spacing: 0;}       
caption, th, td {font-weight: normal;}       
blockquote:before, blockquote:after, q:before, q:after {content:"";}       
blockquote, q{quotes: "" "";} 

address,caption,cite,code,dfn,em,strong,th,var{ font-style:normal; font-weight:normal;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;}
q:before,q:after{ content:'';}
abbr,acronym{ border:0;}
html{ -webkit-text-size-adjust:none;}
button{ cursor:pointer;}
input{ outline: none;}
input:focus{ outline: none;}
button::-moz-focus-inner,
    input[type="reset"]::-moz-focus-inner,
    input[type="button"]::-moz-focus-inner,
    input[type="submit"]::-moz-focus-inner,
    input[type="file"] > input[type="button"]::-moz-focus-inner {
        border: none;
    } 

/*Global Elements*/
a{color:#666;text-decoration:none;}
a:hover{text-decoration:none; color:#f60;}
/*去除链接的虚线框*/
a{blr: expression(this.onFocus=this.close());} /* 只支持IE，过多使用效率低 */
a{blr: expression(this.onFocus=this.blur());} /* 只支持IE，过多使用效率低 */
a:focus {-moz-outline-style: none;} /* IE不支持 */ 

/* Clearfix */
.clearfix:after, #content:after{ content:"\0020"; display:block; clear:both; height:0; font-size:0;}
.clearfix{ zoom:1;}
.clear{ clear:both;}

/*width*/
.pct10{width: 10%;} 
.pct20{width: 20%;} 
.pct30{width: 30%;}
.pct33{width: 33%;}
.pct40{width: 40%;}
.pct50{width:49.9%} 
.pct60{width:59.9%} 
.pct70{width:69.9%} 
.pct80{width:79.9%} 
.pct90{width:89.9%} 
.pct100{width:100%} 
.w60{width:60px; }
.w63{width:63px;}
.w70{width: 70px;}
.w80{width:80px;}
.w130{width:130px;}
.w135{width:135px;}
.w140{width:140px;}
.w160{width: 159px;}
.w178{width:178px;}
.w180{width:180px;}
.w210{width:210px;}
.w215{width:215px;}
.w220{width:220px;}
.w230{width:230px;}
.w240{width:240px;}
.w255{width:255px;}
.w270{width:270px;}
.w288{width:288px;}
.w290{width:290px;}
.w320{width:320px;}
.w380{width:380px;}
.w430{width:430px;}
.w440{width:440px;}
.w490{width:490px;}
.w530{width:530px;}
.w620{width:620px;}
.w660{width:660px;}
.w720{ width:720px; padding:20px 30px; overflow:hidden;}
.w820{width:820px;}
/*height*/
.h20{height: 20px;line-height: 20px;}
.lineH26{line-height: 26px;}
.lineH30{line-height: 30px;}
.lh_28{ line-height:28px}
.h30{ height:30px; line-height:30px;}
.h140{height: 140px;}
.h160{height: 160px;}
.h110{height: 110px;}
/* position */
.abs{ position:absolute}
.rel{ position:relative}
/* A link */
a.brown{color: #846c47;}
a.brown:hover{ text-decoration: underline;}
a.redLine{color: #e97c7c; text-decoration: underline;}
a.redLine:hover{color: #f60;}
a.orange{ color:#e77d00;}
a.orange:hover{text-decoration: underline;}

/*float*/
.fl{ float:left}
.fr{ float:right}
/*font-size*/
.f12{ font-size:12px;}
.f14{font-size: 14px;}
.f15{ font-size:15px;}
.f16{font-size: 16px;}
.f18{font-size: 18px;}
.f22{font-size: 22px;}
.f28{font-size: 28px;}
.f30{font-size: 30px;}
.f40{font-size: 40px;}
.f50{ font-size:50px;}
.f60{font-size: 60px;}

.fs14{font-size: 14px;}
.fs16{font-size: 16px;}
.fs12{font-size: 12px;}
.fs18{font-size: 18px;}
.fs22{font-size: 22px;}
.fs24{font-size: 24px;}
.fs28{font-size: 28px; font-family:Arial, Helvetica, sans-serif}
.fs30{font-size: 30px;}
/*font-family*/
.fontFsong{font-family: '宋体';}
.Yahei{ font-family:"微软雅黑"}
.Arial{ font-family:Arial, Helvetica, sans-serif}
.segoeWp{font-family: "segoe_wp_lightregular","微软雅黑","Arial"}
@font-face {
    font-family: 'segoe_wp_lightregular';
    src: url('../font/segoewp-light-webfont.eot');
    src: url('../font/segoewp-light-webfont.eot?#iefix') format('embedded-opentype'),
         url('../font/segoewp-light-webfont.woff') format('woff'),
         url('../font/segoewp-light-webfont.ttf') format('truetype'),
         url('../font/segoewp-light-webfont.svg#segoe_wp_lightregular') format('svg');
    font-weight: normal;
    font-style: normal;

}
/* text-decorationt */
.tdn{text-decoration: none;}
.uL{text-decoration:underline;}
.cPointer{cursor: pointer;}
/*color*/
.cb{color: #0d8bc5;}
.cb4{color: #b4b4b4;}
.c666{color: #666;}
.c888{color: #888;}
.c999{color: #999;}
.c33 { color:#333; }
.c88 { color:#888; }
.c99{color:#999;}
.cdd { color:#ddd; }
.cbbb{color: #bbb;}
.cfff{color: #fff;}
.cAAA { color:#aaa}
.c000{ color:#000;}
.gold { color:#e77d00; }
.red { color:#ff0000; }
.cr{ color:#d48888}
.cr2{color:#e97c7c}
.cgl{ color:#dfb26c}/*金色字，golden*/
.cgl3{color: #e77d00;}
.cgl2{ color:#ffd07f}
.c4a{color: #4a3939;}
.cbule{color: #6fbbcb;}
.ccf{color: #cf3128;/*红色金额*/}
.cg{color:#666}
.cs{color: #cab18a;}
.c66{color: #666;}
.cw{color: #fff;}
.cgf{color: #fde2d0;}
.ax{ color:#e7ba73; font-size:12px; font-family:Arial, Helvetica, sans-serif}/*附随文字*/
.cbule2{color: #77c2dd;}
.cgl2{ color:#ffd07f}
.cY{color: #fffd32;}
a.cgrown{ color:#9b7051}
.org{color: #ff9c00;}
.org2{color: #ff7e00;}
/*background*/
.bgR{ background:#d48888;}
.bgGL{ background:#d7bc92;}
.bgFA{ background:#fafafa;}
.bgFFF{ background:#fff;}
.bgEA{background: #eaeaea;}
.bgDE{background: #dedede;}
.bgFF{ background:#fff;}
.bgButtonR{ background:#d03a24;}
.bgButtonR:hover{ background:#c6190f}
.bgButtonG{ background:#98c13d;}
.bgButtonG:hover{ background:#83b11d;}
.bgButtonB{ background:#47b6e0;}
.bgButtonB:hover{ background:#129acd;}
.bgButtonGr{ background:#d7bc92;}
/*font-weight*/
.b{ font-weight:bold}
.fwB{ font-weight:bold}
/*margin*/
.mt2{margin-top: 2px;}
.mt5{ margin-top:5px;}
.mt10{ margin-top:10px;}
.mt12{ margin-top:12px;}
.mt15{margin-top: 15px;}
.mt20{ margin-top:20px;}
.mt25{ margin-top:25px;}
.mt30{margin-top:30px;}
.mt35{ margin-top:35px;}
.mt45{margin-top: 45px;}
.mt50{margin-top: 50px;}

.mr5{margin-right: 5px;}
.mr10{margin-right: 10px;}
.mr15{margin-right: 15px;}
.mr20{margin-right: 20px;}
.mr25{margin-right: 25px;}
.mr30 { margin-right:30px; }
.mr40{margin-right: 40px;}

.mb5{margin-bottom: 5px;}
.mb10{ margin-bottom:10px;}
.mb20{ margin-bottom:20px;}
.mb25{margin-bottom: 25px;}
.mb30{margin-bottom: 30px;}
.mb40{ margin-bottom:40px;}

.ml5{margin-left: 5px;}
.ml10{margin-left: 10px;}
.ml15{margin-left: 15px;}
.ml20{margin-left: 20px;}
.ml30 { margin-left:30px; }
.ml45{margin-left:45px;}
.ml70{margin-left: 70px;}
.ml90{ margin-left:90px}
.ml110{margin-left: 110px;}

.mlr5{margin:0 5px;}
.mlr10{margin:0 10px;}

/*padding*/
.p5{ padding:5px;}
.p10{ padding:10px;}
.p15{padding: 15px;}
.p20{ padding:20px;}
.p30{padding: 30px;}

.pt5{padding-top: 5px;}
.pt10{padding-top: 10px;}
.pt15{padding-top: 15px;}
.pt20{padding-top: 20px;}

.pr5{padding-right: 5px;}
.pr10{padding-right: 10px;}
.pr20{padding-right: 20px;}
.pr30{padding-right: 30px;}
.pr50{padding-right: 50px;}

.pb5{padding-bottom: 5px;}
.pb10{padding-bottom: 10px;}
.pb20{ padding-bottom:20px;}
.pb0{padding-bottom: 0;}

.pl5{ padding-left:5px;}
.pl10{ padding-left:10px;}
.pl15{ padding-left:15px;}
.pl20{ padding-left:20px;}
.pl30{padding-left: 30px;}

.ptb5{padding:5px 0; }
.ptb10{padding:10px 0; }
.ptb15{padding:15px 0; }
.ptb20{padding:20px 0; }
.ptb25{padding: 25px 0;}

.plr5{padding:0 5px;}
.plr10{padding:0 10px;}
.plr25{padding:0 25px;}
.plr40{padding: 0 40px;}

.ptb20lr25{padding: 20px 25px 23px 25px;}
/*display*/
.db{display: block;}
.dn,.none{display: none;}
.dib{display: inline-block;}
/*text-align*/
.tr{ text-align:right}
.tl{ text-align:left}
.tc{ text-align:center}
/*vertical-align*/
.vaM{ vertical-align:middle}
.vaT{ vertical-align:top}
.vaB{ vertical-align:bottom}
/*border*/
.bte{ border-top:1px dashed #e4dcd0;}
.bbe{ border-bottom:1px dashed #e4dcd0;}
.ble{ border-left:1px dashed #e4dcd0;}
.bre{ border-right:1px dashed #e4dcd0;}
.bbse {border-bottom:1px solid #e4dccf;}
.blse {border-left:1px solid #e4dccf;}
.brse {border-right:1px solid #e4dccf;}
.brF{border-right: 1px solid #fff;}
.btsF3{border-top: 1px solid #f3f3f3;}
.bl { border-left:1px solid #f5f5f5; } 
/*z-index*/
.z10{z-index: 10;}
.z100{z-index: 100;}
.z80{ z-index:80; position:relative}
.z100{ z-index:100; position:relative}
.z120{ z-index:120; position:relative}