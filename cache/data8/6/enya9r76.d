   �         8https://passport.qbao.com/css/qbao/md_pop.css?v=20151022     %gz��     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   text/css   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 11:33:14 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:26 GMT   X-Cache   hit /**
 * Created with JetBrains WebStorm.
 * User: wangqz
 * Date: 14-7-13
 * Time: 下午12:43
 * Namespace: md_pop
 * Popup component style sheet.
 */

.md_pop {
    position: fixed;
    margin: 0 auto;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    z-index: 10000;
}

.md_pop > .md_pop_layout {
    position: absolute;
    width: 100%;
    height: 100%;
    background: #000;
    opacity: 0.5;
    filter: Alpha(opacity=50);
    left: 0;
    top: 0;
    z-index: 9999;
}

.md_pop > .md_pop_frame {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 10000;
}

.md_pop > .md_pop_frame > .md_pop_con {
    position: relative;
    width: 700px;
  
    min-height: 380px;
    top: -190px;
    left: -350px;
    background: #fff;
    overflow: hidden;
}

.md_pop .md_pop_con > .md_pop_title {
    margin: 0 30px;
    height: 100px;
    border-bottom: 1px #e4dcd0 dashed;
    overflow: hidden;
    *zoom: 1;
}

.md_pop .md_pop_con > .md_pop_title:after {
    display: block;
    content: ".";
    height: 0;
    visibility: hidden;
    overflow: hidden;
    clear: both;
}

.md_pop .md_pop_title > span:first-child {
    float: right;
    margin: 23px 0 23px 20px;
    width: 24px;
    height: 24px;
    font-size: 24px;
    color: #dfdfdf;
    background: url("http://www.qbcdn.com/images/newFooter/md_pop_closebtn.png") no-repeat;
    font-size: 0;
    text-indent: -9999px;
    cursor: pointer;
}

.md_pop .md_pop_title > strong {
    float: left;
    margin: 35px 0;
    height: 40px;
    line-height: 40px;
    font-size: 30px;
    font-weight: 100;
}

.md_pop .md_pop_con > .md_pop_main {
    margin: 10px 30px 50px;
    height: 384px;
    overflow: hidden;
    text-align: left;
    *zoom:1;
}