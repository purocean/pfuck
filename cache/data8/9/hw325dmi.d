   è         http://www.qbcdn.com/js/fork.js     %ÔWÛ      %e G6x              È      
     O K   	   Server   NWS_Appimg_HY   Date   Sun, 28 Feb 2016 11:10:30 GMT   Cache-Control   max-age=31536000   Expires   Mon, 27 Feb 2017 11:10:30 GMT   Last-Modified   Fri, 26 Feb 2016 01:17:47 GMT   Content-Type   application/x-javascript   Content-Encoding   gzip   X-Cache-Lookup   Hit From MemCache Gz   Accept-Ranges   bytes 'use strict';

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
  /**
  var registerIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACsAAAAMCAYAAAD79EROAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3NpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0MTJmYTZlMy1mNGI1LTQzMzUtYTlmMy02YzEyZDc0NDA5Y2EiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODRBMjQ5RTQ1Qjc0MTFFNTk5MjhGRDg3NDZDRDFDRTEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODRBMjQ5RTM1Qjc0MTFFNTk5MjhGRDg3NDZDRDFDRTEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZmU4YTg3ZGEtMTRhYi00YWNlLTk4ZjctMWMzNmYwZjQ5M2M2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjQxMmZhNmUzLWY0YjUtNDMzNS1hOWYzLTZjMTJkNzQ0MDljYSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pjtub9IAAADfSURBVHjaYnyuIccABR+AmJ9hEAMWbILCKzYyvI3wh7NBAMRHZqOrRwbI8vjksMmjA2T1jNhCFtmx2DyAzTJiPIfLs6SGLDMQMxEKGWyWkWsxuY4FOXQhEPNicxByqFDbYYSSAHqAgJLBMiAdiS3K8RlGTJIgJs3iyifY1IFCFuTYQCDmwOcgckIWW5qlJIZA6XQLEPsB8R98lhIKaUozD7GOBYHdQPyVUPTgcjAtHYpsHwuhUER3AL5yEpkNUgczB10cX4CQXClgKxtxyROyBJ88vhjBZi/jUKpuAQIMAP8RlVxYwMqWAAAAAElFTkSuQmCC',
    $registerPrompt = $('<a />').attr({
      href: 'http://www.qbao.com/announcement/announce-detail.htm?id=101448',
      target: '_blank'
    }).append($('<img />').attr('src', registerIcon));
  */

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
  if (!$('#auction-lucky-history-menu').length) {
    $('#auction-management-menu ul')
      .append($('<li class="submenu-item" id="auction-lucky-history-menu">' +
        '<a href="http://paipai.qbao.com/order/listUserLuckPage.html">å¹¸è¿ææ¥åè®°å½</a>' +
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
  var phoneIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAAAWCAYAAABaDmubAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjExRTBCQkYzQ0Q2NTExRTVBODM4REFCQ0FFM0VBMDc2IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjExRTBCQkY0Q0Q2NTExRTVBODM4REFCQ0FFM0VBMDc2Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTFFMEJCRjFDRDY1MTFFNUE4MzhEQUJDQUUzRUEwNzYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTFFMEJCRjJDRDY1MTFFNUE4MzhEQUJDQUUzRUEwNzYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6tuN5fAAAI2klEQVR42oRZXYiWRRSeoxtBEOzeJC2IX0p1o7Vmgj/E7ncRWRfrT3iRkKsRRES4GhFEua54I9n+dCNeqUR2UWialBCxK5EpbPrRehGBuiEuCIJrEUGxnJ4zP++cmXc++5Z335kzZ86cOXP+5rzEzEZ+0+u6jUGTCC8BkelB81U016O3GGOLMLbQYRuLC5zkRx5ctT2Obus17FvNc3huoKLl8UygYbIJ+pfBch5MGz5qk7ONUFx7HnNu430Tz48AfQq8liCsuDCbsLJAM+U3uhTvk2heRvsWALvwrMbkBz2KrEOydzLpg8Vj2+Ngrm0bNTfMt3D2MMFjJjviaQVcDn3/Z+lk62ue8rUSGmFNSsf9aSY09Fz/JzJYjWcX4LdERniLrJZmR6wE62S7Af9EoBfQXYhjGgGxS2jPAj4fTpHUGZuszeF08U8rmCGvjX6clVrFttttQlgrE8e1Sa2VaHs2ljCbTebKGiLhih5l6weNFVkYcwl4I1hvIfAuoH15em33hrJgyfTj/1kgbsf7kMiFiFLbVuZYEiopmyHFGQe+Kbfd+o+N0qFSW5t0IMxhWXKC4XbEOVGM6JKi+ib7pBQ33zDmCdohIG3H+FkIt78Sp5wyAI9j8DLmbgXsHHO6sFCSxXO3VlIIvp9PLDnk3K1lhO7na6tzrznq+ljQ6HDgXIoTXOcvoWPq66i9icZ+AfxVyy/M/hY09hOM78W6iVDVKq8D/A1A77MWmNZeTk1ba161ufj0AdZpqIbitT6qDnN6eFw6WKrFsSHO/BN7K/Km3pm7NaP5LbivykdpZVDvFT/NngP8Q6CPW9gvax5dBcARtJ+NfoqiljLvQUOc8xCgb+H9F1A+DuOmEMkptz5KA6TfuGxud00jHKMTSjN34xmQLCWJ9K7TTE0knkeQdZKZOJxOoN9Aq4l+C/0hb5kNvBuedKfnVXDman6e0uxCfhCsy67Wdk9h/I0OtLdh8ETFTWUqFPzICrx2egHuR38MzX4MnGEV4hP/63dPLr72oXcKrVbFtDDLUYBeSA3AdgI26fGacgAW3wl1GOOTQfOBc8OroWj/KbRaSfrGiraBwNgcw8AwcObYHajMWemExPfA63HMHQWBpvHC5FL6llmsDkP+dwLj2zqAvZ5c+pC6mRi5Z+NkeoRtwEM0zIyPTRq52QvbY7VEUAAdtZsUIaXeYw7tjYZSf1qIQX0mHo6O8i2vgZr1ZuzRUKJlZI6xyz9l3WEVaEWgc9oNVgdFWVBsH4fP4znSgZmLMelmZaac+kbAHgLB5XhfBextgP4QDWRuH4DCGAehsjVnEeoOQMewkV4TrXcQGnMMsN2K8R40J0SLgXZeCURo93rTbhpTOIhcy3SwcvPBg1kCsNAdAmxfJjBW2jop61TepuACCv79OgBLJXgtwnM7z/Gi8zbTaL3s6ZwG6GGbplEaHCoZU5qdAygaMOQBKzG4iZ2wxPTEjGGiXqiRw5Y3yWMcA9oAXr1VeiV+NwYZdxDMchgTnoxti0tge6DVAYjLuIdeL4lrCNmWM8HJcDnxF4Wmzj64kOHk6R187V2gdC2QayquY/OV6ddTjM/tCRvzJDRrCu1fgTFSRUWqp4qs81c3fpzET7M1tXG7aWMDiIyfBmJDB4Y8/VEJe481NbLmNqiUxh8ENf2B2MADuk0b4HBAynxb7FxTelFJMpI0C9GJQZWF6MygIIMFeO5Or+vuyjdG0TT+xvMZhvb6dOWwDz7IDEyHJy5a2J+fpBBkJ4ABr0GjXrsfQ7/LOK3FGB31exgNrkDwQXeHUhLBFdcw6S1hUiUbnd7/9kkq5wWCtg1s8jSClDiXFNwBunLIEy67sXxecRZQuLyYLEfPBpAVdIGHux2gfQ1Iy9CZMllxRKUp34uW4z0GwCCQ9gHpXfRHMPgnu8g9j+cp4B+IJmO3/pV/pObQA/hGrLExOuQYfKqoHoPRUBaRhc4OCGAAQhtWFtaJpXpNGq17Va45A9Dvsr7QlpIEJzcoq9HDHNM2OaAhpkIhhlK3x1y7UEpqel007gdgPofxKWOUg1Z5qmd0DK/9gOBNg4B+BPga4L8guSbg/2DeXuAcAOwDdZoz0YxhmkxpquKEO6GidiNPdVQFahybv4GJk94fBtPebNO5uNF9NtqndDb59G2zvkhIhsHiorJcu30VLAmE9QubO9DzIljJYQ9jdDQt51FN9QEXwb2HoRNAOYj2RbwvWl/lGNuPsVOkXIG7v4dDoj7NZCK8qAFiyi3f7gyjfv4oO4E2XIYhmsZwS9Ti9AoqPncHYDNqC+KOQobRA+KDQesxpY9ToTZ8mlYrNebX8gL4FfTf7MC9dgp+4Q6JiYupq6DD2WXbEziI5yU2Nsm+AZyvjSufGT9/Ml6LqSqOeEZ688pR4fCexmvcJ/hzNkNwdYpRcq5g2GqZ6y+BBg8nV1BHajOmiCCXqNxYgt6YcfVH5K/UtLmsuwXO2PQr8nAP7qKRaG6pdhJk7xe9uq5bZHgHycCULcIA8AReP4PAVmCfK1aQw5U1huIH0H8N85eh869N2wgZA5tDORNxLtelmtlrrYBTqNAUCyP1a3F5uF3BRhVoaoWenG7uLhzdDWh/ie4zUoQh9QWhH8CT6L0IpO/yGwblcjBtfBCZmhCpJENu85lBV7T+b72sAkWZteXBpe3HggKNcuEj+xoR2Xoe7W8B2II89kxSj8XgGRCUsuFJPO/oo0vuAqpSlTuXorZxYW7CaCzZh90xp6UsolSNWH3K0JqohUhUL6RT5ht1IS3yGANActHRBXKjeISs2H1F2BqEmgjWb1oCj+SQ8p3rCp49MI9V4tN0ZZ8KNdFca1OTTxNcfUWsGM2nUaFUqL4HlYrZNc0sOfJ25c68JqnKlslBk5WFVAT3WBmxlVUPzP+Unt2hV3OfqMw1dLaQuybKx0QpKS7zVaZEM9jU8ziqf02pkInSKn9eaOH88CJPyXr65lNF75xWuJealM+YXptabZW5/JUj41OqY9d8sNvpC0y1338CDAALr8A/TZ+CZQAAAABJRU5ErkJggg==';
  var activeIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAAAWCAYAAABaDmubAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjM4RTZCQ0EwQ0Q2NTExRTVBODM4REFCQ0FFM0VBMDc2IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjM4RTZCQ0ExQ0Q2NTExRTVBODM4REFCQ0FFM0VBMDc2Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTFFMEJCRjVDRDY1MTFFNUE4MzhEQUJDQUUzRUEwNzYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTFFMEJCRjZDRDY1MTFFNUE4MzhEQUJDQUUzRUEwNzYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4HbmntAAAKe0lEQVR42oRZC3BW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';

  $('.site-footer ul li:eq(3)')
    .replaceWith($('<li><h2 style="font-size:16px;margin-bottom:5px;">400-155-8899 <span style="font-size:12px;color:#888;font-weight:normal;font-family:\'å¾®è½¯éé»\'">(å¾å¯ç¨)</span></h2>' +
                   '<p class="foot_tips">7x24å°æ¶ éçæå¡</p>' +
                   '<img class="phone-icon mb10" style="cursor:pointer;" src="' + phoneIcon + '"/>' +
                   '<p><a href="mailto:kefu@qbao.com">å®¢æé®ç®±ï¼kefu@qbao.com</a></p></li>'));
  $('.phone-icon').hover(function() {
    $(this).attr('src', activeIcon);
  }, function() {
    $(this).attr('src', phoneIcon);
  }).click(function() {
    window.open('http://www.qbao.com/customer-service/index.htm');
  });
}
