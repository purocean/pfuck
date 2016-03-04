   �         8https://passport.qbao.com/css/qbao/header.css?v=20151022     %g��     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   text/css   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 12:03:01 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:26 GMT   X-Cache   hit /**
 * header.css
 * User: zhuyijiang
 * Date: 15-2-13
 * Time: 下午13:20
 */

* {
    padding: 0;
    margin: 0;
}
em, i {
    font-style: normal;
}
ul, ol {
    list-style: none;
}
img {
    border: none;
}
/*global style*/

.clearfix:after, #content:after {
    content: "\0020";
    display: block;
    clear: both;
    height: 0;
    font-size: 0;
}
.clearfix {
    zoom: 1;
}
.fl {
    float: left;
}
.fr {
    float: right;
}
.mlr5 {
    margin: 0 5px;
}
/*连接样式*/

.site-top a {
    text-decoration: none;
    color: #888;
    cursor: pointer;
    display: inline-block;
    outline: 0 none;
}
.site-top a:hover {
    text-decoration: underline;
    color: #e77d00;
}
.site-top .orange {
    color: #e77d00;
}
.site-top .orange:hover {
    text-decoration: underline;
}
/*头部导航Top*/

.site-top {
    font-size: 12px;
    line-height: 1.5;
    font-family: '微软雅黑';
    position: relative;
    z-index: 22;
}
.site-top .site-nav {
    background: #f4f4f4;
    width: 100%;
    z-index: 1000;
    color: #888;
    min-width: 1000px;
    position: relative;
}
/*用户中心顶部 边线*/

.site-top-uc .site-nav {
    background: #fff;
    border-bottom: 1px solid #eee;
}
/*帮助中心顶部 边线*/

.site-top-hc .site-nav {
    background: #f4f4f4;
    border-bottom: 1px solid #eee;
}
/*i为图标占位符，site-top内请避免用i标签*/

.site-top .site-nav i {
    background-image: url("../../images/qbao/site-nav-icon.png");
    background-repeat: no-repeat;
    display: inline-block;
}
/*图标-向下箭头*/

.site-top .arrow-icon {
    width: 6px;
    height: 4px;
    background-position: 0 0;
    overflow: hidden;
    margin-left: 3px;
    vertical-align: middle;
}
.site-top .message-icon, .message-no-icon, .redbag-icon, .spread-icon, .iphone-icon, .home-icon, .qBaoNews-icon {
    width: 16px;
    height: 16px;
    vertical-align: middle;
    margin-right: 5px;
}
/*图标-有消息*/

.site-top .message-icon {
    background-position: 0 -16px;
    margin-right: 3px;
}
/*图标-没有消息*/

.site-top .message-no-icon {
    background-position: 0 -32px;
    margin-right: 3px;
}
/*图标-红包*/

.site-top .redbag-icon {
    background-position: 0 -48px;
    width: 11px;
}
/*图标-推广*/

.site-top .spread-icon {
    background-position: 0 -64px;
}
/*图标-手机*/

.site-top .iphone-icon {
    background-position: 0 -96px;
    margin-right: 1px;
}
/*图标-NEW*/

.site-top .new-icon {
    /*background-position: 0 -112px;*/
    
    width: 20px;
    height: 11px;
    position: relative;
    left: -4px;
    top: -9px;
}
/*图标-退出*/

.site-top .exit-icon {
    background-position: 0 -80px;
    width: 12px;
    height: 12px;
    vertical-align: middle;
    margin-right: 3px;
}
/*图标-首页*/

.site-top .home-icon {
    background-position: 0 -192px;
    width: 13px;
    margin-right: 2px;
}
.site-top .notice-icon, .site-top .system-icon, .site-top .activity-icon {
    width: 15px;
    height: 15px;
    vertical-align: middle;
    margin-right: 10px;
}
/*图标-消息（通知）*/

.site-top .notice-icon {
    background-position: 0 -128px;
}
/*图标-消息（系统）*/

.site-top .system-icon {
    background-position: 0 -144px;
}
/*图标-消息（活动）*/

.site-top .activity-icon {
    background-position: 0 -160px;
}
/*图标-消息（条数显示）*/

.site-top .number-icon {
    height: 15px;
    vertical-align: middle;
    margin-left: 5px;
    text-align: center;
    color: #fff;
    font-size: 12px;
    line-height: 15px;
    overflow: hidden;
    background: #d03a24;
    border-radius: 10px;
    padding: 0 5px;
    font-weight: normal;
    display: inline-block;
    margin-top: -4px;
}
.site-top .site-nav-bd {
    position: relative;
    height: 34px;
    width: 1000px;
    margin: 0 auto;
}
.site-top .site-nav-bd-l, .site-top .site-nav-bd-l .menu, .site-top .site-nav-bd-r .menu, .site-top .site-nav-pipe {
    display: inline;
    float: left;
}
.site-top .site-nav-pipe {
    color: #c5c5c5;
    height: 14px;
    width: 0;
    border-right: #c5c5c5 1px dotted;
    margin-top: 10px;
}
.site-top .site-nav-bd-r {
    display: inline;
    float: right;
}
.site-top .site-nav .menu-hd {
    height: 34px;
    line-height: 34px;
    overflow: hidden;
    padding: 0 12px;
    position: relative;
    z-index: 10001;
}
.site-top .site-nav .menu-light a {
    color: #666;
}
.site-top .site-nav .menu-light a:hover {
    text-decoration: underline;
    color: #e77d00;
}
.site-top .site-nav .menu-home a {
    color: #e77d00;
}
.site-top .site-nav .menu-bd {
    margin-top: -1px;
    position: relative;
    z-index: 1001;
}
.site-top .user-news .menu-bd {
    position: absolute;
    top: 34px;
    width: 760px;
    overflow: hidden;
}
.site-top .user-name .menu-hd, .site-top .user-news .menu-hd {
    border-left: transparent 1px solid;
    border-right: transparent 1px solid;
}
.site-top .user-name:hover .menu-bd .user-layout, .site-top .user-news:hover .menu-bd .news-layout, .site-top .user-news:hover .menu-bd .user-layout {
    top: 0;
}
.site-top .user-news:hover .menu-bd {
    height: 610px;
}
.site-top .user-news:hover .news-none {
    position: relative;
    top: 0;
    width: auto;
    height: auto;
    overflow: visible;
    zoom: 1;
}
.site-top .user-name:hover > .menu-hd, .site-top .user-news:hover > .menu-hd {
    background: #fff;
    border-left: #f0f0f0 1px solid;
    border-right: #f0f0f0 1px solid;
    height: 34px;
}
.site-top .menu-login {
    line-height: 34px;
    color: #c5c5c5;
    margin-right: 10px;
}
.site-top .menu-login span {
    margin: 0 3px;
}
/*用户个人信息*/

.site-top .user-layout {
    width: 285px;
    position: absolute;
    top: -999px;
    left: 0;
    border-bottom: #cbcbcb 1px solid;
}
.site-top .news-layout {
    width: 760px;
    position: absolute;
    top: -800px;
    left: 0;
    border-bottom: #cbcbcb 1px solid;
    transition: top .3s ease-in;
    -webkit-transition: top .3s ease-in;
    -moz-transition: top .3s ease-in;
    -o-transition: top .3s ease-in;
    z-index: 1100;
}
.site-top .user-box {
    width: 263px;
    padding: 10px;
}
.site-top .user-main {
    background: #fff;
    border-width: 1px;
    border-style: solid;
    border-color: #f6f6f6 #f6f6f6 #e7e7e7 #f6f6f6;
}
.site-top .user-m-top {
    height: 80px;
}
.site-top .user-avatar {
    display: inline;
    float: left;
    margin-right: 15px;
    width: 65px;
    height: 65px;
}
.site-top .user-avatar img {
    width: 65px;
    height: 65px;
    overflow: hidden;
    border-radius: 50%;
    display: block;
}
.site-top .user-info {
    height: 80px;
    overflow: hidden;
    text-align: left;
}
.site-top .user-info p {
    line-height: 30px;
}
.site-top .user-info p span {
    color: #bbb;
}
.site-top .user-info p em {
    font-size: 26px;
    color: #d03a24;
}
.site-top .user-info a.user-info-a {
    background: #fcf6ef;
    border: #f0e3d3 1px solid;
    padding: 5px 20px;
    color: #e77d00;
}
.site-top .user-m-bottom {
    border-top: #e5e5e5 1px dashed;
    height: 20px;
    line-height: 20px;
    padding-top: 14px;
}
.site-top .user-m-bottom em {
    color: #e77d00;
    padding: 0 5px;
}
.site-top .user-medal {
    line-height: 35px;
    height: 35px;
    padding: 2px 12px;
    background: #f6f6f6;
}
.site-top .user-medal .site-nav-pipe {
    margin: 10px 12px;
}
/*消息*/

.site-top .no-news {
    background: url("../../images/qbao/nonews.png") no-repeat center center;
    width: 100%;
    height: 180px;
}
.site-top .user-message h2 {
    font-size: 16px;
    color: #333;
    text-align: center;
    padding: 10px 0;
    line-height: 35px;
    border-bottom: #eee 1px solid;
}
.user-message ul li a {
    height: 95px;
    width: 100%;
    overflow: hidden;
    display: block;
}
.user-message ul li a:hover {
    background: #f1f1f0;
    cursor: pointer;
    text-decoration: none;
}
.user-message ul li a:hover .news-info {
    color: #888;
}
.user-message .news-main {
    margin: 0 10px;
    padding: 10px 110px 10px 0;
    height: 75px;
    border-top: #c1c1c1 1px dashed;
    background: url(../images/header/news-icon.png) 690px center no-repeat;
}
.user-message li:first-child .news-main {
    border-top: none;
}
.user-message .news-main span {
    display: inline-block;
    float: left;
    line-height: 25px;
    height: 25px;
    padding-left: 25px;
    overflow: hidden;
    font-size: 12px;
}
.user-message .news-main .news-info {
    padding: 0 0 0 20px;
    overflow: hidden;
}
.user-message .news-main .news-info h3 {
    margin-bottom: 3px;
    line-height: 25px;
    height: 25px;
    color: #666;
    font-weight: normal;
    font-size: 14px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.user-message .news-main .news-info p {
    margin-top: 2px;
    height: 40px;
    line-height: 20px;
    overflow: hidden;
    word-break: break-all;
    text-align: left;
}
.notice-name {
    color: #e77d00;
}
.system-name {
    color: #47b6e1;
}
.activity-name {
    color: #98c13d;
}
.news-up {
    width: 117px;
    height: 33px;
    margin: 0 auto;
    background: url(../images/header/news-up.png) 0 0 no-repeat;
    position: absolute;
    bottom: -34px;
    left: 50%;
    margin-left: -58px;
    cursor: pointer;
    display: none;
}
.site-top a:hover .number-icon {
    text-decoration: none;
}
a.under-line {
    text-decoration: underline;
}
/* 弹出层通用阴影 */

.user_shadow {
    display: none;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 3000px;
    background: #000;
    z-index: 999;
    opacity: 0.7;
    filter: alpha(opacity=70);
}
.shadow_tran {
    display: none;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 34px;
    line-height: 34px;
    background: #fff;
    z-index: 1005;
    opacity: 0;
    filter: alpha(opacity=0);
}
/*CSS3动画--图标上下翻转*/

.hi-icon-effect:hover .hi-icon {
    animation: toTopFromBottom 0.3s forwards;
    -webkit-animation: toTopFromBottom 0.3s forwards;
    -moz-animation: toTopFromBottom 0.3s forwards;
}
@keyframes toTopFromBottom {
    49% {
        transform: translateY(-100%);
    }
    50% {
        opacity: 0;
        transform: translateY(100%);
    }
    51% {
        opacity: 1;
    }
}
@-webkit-keyframes toTopFromBottom {
    49% {
        -webkit-transform: translateY(-100%);
    }
    50% {
        opacity: 0;
        -webkit-transform: translateY(100%);
    }
    51% {
        opacity: 1;
    }
}
@-moz-keyframes toTopFromBottom {
    49% {
        -moz-transform: translateY(-100%);
    }
    50% {
        opacity: 0;
        -moz-transform: translateY(100%);
    }
    51% {
        opacity: 1;
    }
}
/*header init style*/

.site-init {
    /*namespace*/
}
.site-init .site-nav {
    position: relative;
    z-index: 1000;
}
.site-init .user-news .menu-hd {
    border-left: #f0f0f0 1px solid;
    border-right: #f0f0f0 1px solid;
    background: #fff;
}
.site-init .user-news .menu-bd {
    height: 610px;
}
.site-init .user-news .news-none {
    position: relative;
    top: 0;
    width: auto;
    height: auto;
    overflow: visible;
}
.site-init .user_shadow, .site-init .shadow_tran {
    display: block;
}
.site-init .news-up {
    display: block;
}
.site-top .site-nav i.qBaoNews-icon {
    background: url(../../images/qbao/site-nav-icon-add.png) no-repeat;
    background-position: -5px -32px;
    width: 14px;
}
.site-top .site-nav li.userCenter-nav {
    overflow: visible;
    padding: 0;
    width: 78px;
    text-align: center;
}
.site-top .site-nav li.userCenter-nav >a {
    display: block;
    width: 100%;
}
.site-top .site-nav li.userCenter-nav>a>i {
    margin-left: 5px;
}
.site-top .site-nav li.userCenter-nav:hover >a {
    width: 76px;
    border-style:solid;
    border-width: 1px 1px 0;
    border-color:#ddd;
    background-color: #fff;
    position: relative;
    height: 36px;
    z-index: 22;
}
ul.userCenter-menu {
    display: none;
    width: 164px;
    position: absolute;
    left: 0;
    top: 36px;
    border: #dddddd 1px solid;

}
li.userCenter-nav:hover >ul.userCenter-menu {
    display: block;
}
ul.userCenter-menu> li {
    float: left;width: 50%;
    height: 30px;
    line-height: 30px;
    background-color: #fff;
    text-align: left;
}
ul.userCenter-menu> li a{display: block;padding-left: 9px;}

ul.userCenter-menu> li.odd{text-align: left}
ul.userCenter-menu> li.odd a{padding-left: 0}
.nav-more {
    position: relative;
}
.nav-more:hover {
    background-color: #b4200a;
}
.site-top .header-bd .nav li.nav-more>a {
    float: none;
}
ul.more-list {
    display: none;
}
.nav-more:hover>ul.more-list {
    display: block;
}
.site-top .header-bd .nav li.nav-more>ul.more-list >li>a {
    background: none;
    float: none;
}
.site-top .header-bd .nav li.nav-more>ul.more-list >li {
    line-height: 50px;
    float: none;
    background-color: #b4200a;
}
.site-top .header-bd .nav li.nav-more>ul.more-list >li:hover {
    background-color: #000;
}
/*菜单栏*/

.site-menu {
    position: relative;
    z-index: 21;
    height: 99px;
    border-bottom: #d03a24 3px solid;
    background-color: #fff;
}
/*默认样式*/

.site-navbox {
    width: 1000px;
    height: 99px;
    margin: 0 auto;
    font-family: 微软雅黑, Arial, Helvetica, sans-serif;
}
.site-navbox a {
    text-decoration: none;
    color: #333;
}
.site-navbox >.site-logo {
    float: left;
}
.site-navbox >.site-logo>a {
    display: block;
    width: 173px;
    height: 99px;
}
.site-navbox >.site-logo>a>img {
    vertical-align: top;
    margin-top: 22px;
    width: 173px;
    height: 64px;
}
.site-navbox >.site-navlist {
    float: right;
    margin-top: 32px;
}
.site-navbox >.site-navlist>.nav {
    display: block;
}
.site-navbox >.site-navlist>.nav >li {
    float: left;
    margin-right: 5px;
    height: 36px;
    line-height: 36px;
    text-align: center;
    position: relative;
}
.site-navbox >.site-navlist>.nav >li>a {
    display: block;
    padding: 0 18px;
    font-size: 18px;
}
.site-navbox >.site-navlist>.nav >li>a.more {
    padding-right: 12px;
}
.site-navbox >.site-navlist>.nav >li>a.more i {
    vertical-align: middle;
    display: inline-block;
    width: 8px;
    height: 5px;
    margin-left: 5px;
    background: url(../../images/qbao/site-nav-icon-add.png) no-repeat;
    background-position: -5px -5px;
}
.site-navbox >.site-navlist>.nav >li:hover>a.more i {
    background-position: -5px -19px;
}
.site-navbox >.site-navlist>.nav >li.current {
    background-color: #d03a24;
    border-radius: 3px;
}
.site-navbox >.site-navlist>.nav >li:hover {
    background-color: #474e5d;
    border-radius: 3px;
}
.site-navbox >.site-navlist>.nav >li.current > a, .site-navbox >.site-navlist>.nav >li:hover>a {
    color: #fff;
}
.site-navbox >.site-navlist>.nav >li>.dropbox {
    display: none;
    width: 100%;
    position: absolute;
    top: 32px;
    background-color: #474e5d;
    padding-top: 6px;
}
.site-navbox >.site-navlist>.nav >li:hover>.dropbox {
    display: block;
}
.site-navbox >.site-navlist>.nav >li>.dropbox>li {} .site-navbox >.site-navlist>.nav >li>.dropbox>li a {
    display: block;
    color: #bababa;
    font-size: 14px;
    padding: 5px 0;
}
.site-navbox >.site-navlist>.nav >li>.dropbox>li a:hover {
    color: #fff;
    background-color: #303643;
}
.site-navbox >.site-navlist>.nav >li >em.new {
    position: absolute;
    top: -10px;
    left: 50px;
    display: block;
    width: 53px;
    height: 22px;
    background: url(../../images/qbao/new-hd.gif) no-repeat;
	z-index: 1;
}
/*默认样式  End*/
/*滚屏菜单样式*/

.site-menu-fixed {
    position: fixed;
    width: 100%;
    height: 60px;
    -moz-box-shadow: 0 0 11px rgba(0, 0, 0, 0.22);
    -webkit-box-shadow: 0 0 11px rgba(0, 0, 0, 0.22);
    box-shadow: 0 0 11px rgba(0, 0, 0, 0.22);
    -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(strength=11, direction=180, color='#cccccc')";
    filter: progid: DXImageTransform.Microsoft.Shadow(strength=11, direction=180, color='#cccccc');
    z-index: 50;
    top: 0px;
}
.site-menu-fixed>.transBG {
    height: 60px;
    background-color: #fff;
    filter: alpha(opacity=95);
    -moz-opacity: 0.95;
    -khtml-opacity: 0.95;
    opacity: 0.95;
}
.site-menu-fixed>.site-menu-main {
    position: relative;
    width: 1000px;
    margin: 0 auto;
}
.site-menu-fixed >.site-menu-main>.site-navbox {
    height: 60px;
    position: absolute;
    top: -60px;
}
.site-menu-fixed>.site-menu-main>.site-navbox >.site-logo>a {
    display: block;
    width: 122px;
    height: 60px;
}
.site-menu-fixed>.site-menu-main>.site-navbox >.site-logo>a>img {
    margin-top: 12px;
    width: 122px;
    height: 45px;
}
.site-menu-fixed>.site-menu-main>.site-navbox >.site-navlist {
    margin-top: 12px;
}
.site-menu-fixed>.site-menu-main>.site-navbox >.site-navlist>.nav >li>a {
    padding: 0 18px;
    font-size: 16px;
}
/*滚屏菜单样式    End*/
