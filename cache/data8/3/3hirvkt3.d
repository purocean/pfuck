   �         3https://dig.qbao.com/qb-site/js/user_tracker_dig.js     %g~/      %~� ]V�              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   application/javascript   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 11:37:04 GMT   Last-Modified   Thu, 30 Jul 2015 01:41:57 GMT   Etag   W/"55b980e5-43b3"   X-Cache   hit function s4() {
	return Math.floor(65536 * (1 + Math.random())).toString(16).substring(1);
}
function guid(){
	return (s4() + s4() + s4() + s4() + s4() + s4() + s4() + s4());
}

;(function (name, context, definition) {
  if (typeof module !== 'undefined' && module.exports) { module.exports = definition(); }
  else if (typeof define === 'function' && define.amd) { define(definition); }
  else { context[name] = definition(); }
})('Fingerprint', this, function () {
  'use strict';
  
  var Fingerprint = function (options) {
    var nativeForEach, nativeMap;
    nativeForEach = Array.prototype.forEach;
    nativeMap = Array.prototype.map;

    this.each = function (obj, iterator, context) {
      if (obj === null) {
        return;
      }
      if (nativeForEach && obj.forEach === nativeForEach) {
        obj.forEach(iterator, context);
      } else if (obj.length === +obj.length) {
        for (var i = 0, l = obj.length; i < l; i++) {
          if (iterator.call(context, obj[i], i, obj) === {}) return;
        }
      } else {
        for (var key in obj) {
          if (obj.hasOwnProperty(key)) {
            if (iterator.call(context, obj[key], key, obj) === {}) return;
          }
        }
      }
    };

    this.map = function(obj, iterator, context) {
      var results = [];
      // Not using strict equality so that this acts as a
      // shortcut to checking for `null` and `undefined`.
      if (obj == null) return results;
      if (nativeMap && obj.map === nativeMap) return obj.map(iterator, context);
      this.each(obj, function(value, index, list) {
        results[results.length] = iterator.call(context, value, index, list);
      });
      return results;
    };

    if (typeof options == 'object'){
      this.hasher = options.hasher;
      this.screen_resolution = options.screen_resolution;
      this.canvas = options.canvas;
      this.ie_activex = options.ie_activex;
    } else if(typeof options == 'function'){
      this.hasher = options;
    }
  };

  Fingerprint.prototype = {
    get: function(){
      var keys = [];
      keys.push(navigator.userAgent);
      keys.push(navigator.language);
      keys.push(screen.colorDepth);
      if (this.screen_resolution) {
        var resolution = this.getScreenResolution();
        if (typeof resolution !== 'undefined'){ // headless browsers, such as phantomjs
          keys.push(this.getScreenResolution().join('x'));
        }
      }
      keys.push(new Date().getTimezoneOffset());
      keys.push(this.hasSessionStorage());
      keys.push(this.hasLocalStorage());
      keys.push(!!window.indexedDB);
      //body might not be defined at this point or removed programmatically
      if(document.body){
        keys.push(typeof(document.body.addBehavior));
      } else {
        keys.push(typeof undefined);
      }
      keys.push(typeof(window.openDatabase));
      keys.push(navigator.cpuClass);
      keys.push(navigator.platform);
      keys.push(navigator.doNotTrack);
      keys.push(this.getPluginsString());
      if(this.canvas && this.isCanvasSupported()){
        keys.push(this.getCanvasFingerprint());
      }
      if(this.hasher){
        return this.hasher(keys.join('###'), 31);
      } else {
        return this.murmurhash3_32_gc(keys.join('###'), 31);
      }
    },

    /**
     * JS Implementation of MurmurHash3 (r136) (as of May 20, 2011)
     * 
     * @author <a href="mailto:gary.court@gmail.com">Gary Court</a>
     * @see http://github.com/garycourt/murmurhash-js
     * @author <a href="mailto:aappleby@gmail.com">Austin Appleby</a>
     * @see http://sites.google.com/site/murmurhash/
     * 
     * @param {string} key ASCII only
     * @param {number} seed Positive integer only
     * @return {number} 32-bit positive integer hash 
     */

    murmurhash3_32_gc: function(key, seed) {
      var remainder, bytes, h1, h1b, c1, c2, k1, i;
      
      remainder = key.length & 3; // key.length % 4
      bytes = key.length - remainder;
      h1 = seed;
      c1 = 0xcc9e2d51;
      c2 = 0x1b873593;
      i = 0;
      
      while (i < bytes) {
          k1 = 
            ((key.charCodeAt(i) & 0xff)) |
            ((key.charCodeAt(++i) & 0xff) << 8) |
            ((key.charCodeAt(++i) & 0xff) << 16) |
            ((key.charCodeAt(++i) & 0xff) << 24);
        ++i;
        
        k1 = ((((k1 & 0xffff) * c1) + ((((k1 >>> 16) * c1) & 0xffff) << 16))) & 0xffffffff;
        k1 = (k1 << 15) | (k1 >>> 17);
        k1 = ((((k1 & 0xffff) * c2) + ((((k1 >>> 16) * c2) & 0xffff) << 16))) & 0xffffffff;

        h1 ^= k1;
            h1 = (h1 << 13) | (h1 >>> 19);
        h1b = ((((h1 & 0xffff) * 5) + ((((h1 >>> 16) * 5) & 0xffff) << 16))) & 0xffffffff;
        h1 = (((h1b & 0xffff) + 0x6b64) + ((((h1b >>> 16) + 0xe654) & 0xffff) << 16));
      }
      
      k1 = 0;
      
      switch (remainder) {
        case 3: k1 ^= (key.charCodeAt(i + 2) & 0xff) << 16;
        case 2: k1 ^= (key.charCodeAt(i + 1) & 0xff) << 8;
        case 1: k1 ^= (key.charCodeAt(i) & 0xff);
        
        k1 = (((k1 & 0xffff) * c1) + ((((k1 >>> 16) * c1) & 0xffff) << 16)) & 0xffffffff;
        k1 = (k1 << 15) | (k1 >>> 17);
        k1 = (((k1 & 0xffff) * c2) + ((((k1 >>> 16) * c2) & 0xffff) << 16)) & 0xffffffff;
        h1 ^= k1;
      }
      
      h1 ^= key.length;

      h1 ^= h1 >>> 16;
      h1 = (((h1 & 0xffff) * 0x85ebca6b) + ((((h1 >>> 16) * 0x85ebca6b) & 0xffff) << 16)) & 0xffffffff;
      h1 ^= h1 >>> 13;
      h1 = ((((h1 & 0xffff) * 0xc2b2ae35) + ((((h1 >>> 16) * 0xc2b2ae35) & 0xffff) << 16))) & 0xffffffff;
      h1 ^= h1 >>> 16;

      return h1 >>> 0;
    },

    // https://bugzilla.mozilla.org/show_bug.cgi?id=781447
    hasLocalStorage: function () {
      try{
        return !!window.localStorage;
      } catch(e) {
        return true; // SecurityError when referencing it means it exists
      }
    },
    
    hasSessionStorage: function () {
      try{
        return !!window.sessionStorage;
      } catch(e) {
        return true; // SecurityError when referencing it means it exists
      }
    },

    isCanvasSupported: function () {
      var elem = document.createElement('canvas');
      return !!(elem.getContext && elem.getContext('2d'));
    },

    isIE: function () {
      if(navigator.appName === 'Microsoft Internet Explorer') {
        return true;
      } else if(navigator.appName === 'Netscape' && /Trident/.test(navigator.userAgent)){// IE 11
        return true;
      }
      return false;
    },

    getPluginsString: function () {
      if(this.isIE() && this.ie_activex){
        return this.getIEPluginsString();
      } else {
        return this.getRegularPluginsString();
      }
    },

    getRegularPluginsString: function () {
      return this.map(navigator.plugins, function (p) {
        var mimeTypes = this.map(p, function(mt){
          return [mt.type, mt.suffixes].join('~');
        }).join(',');
        return [p.name, p.description, mimeTypes].join('::');
      }, this).join(';');
    },

    getIEPluginsString: function () {
      if(window.ActiveXObject){
        var names = ['ShockwaveFlash.ShockwaveFlash',//flash plugin
          'AcroPDF.PDF', // Adobe PDF reader 7+
          'PDF.PdfCtrl', // Adobe PDF reader 6 and earlier, brrr
          'QuickTime.QuickTime', // QuickTime
          // 5 versions of real players
          'rmocx.RealPlayer G2 Control',
          'rmocx.RealPlayer G2 Control.1',
          'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
          'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
          'RealPlayer',
          'SWCtl.SWCtl', // ShockWave player
          'WMPlayer.OCX', // Windows media player
          'AgControl.AgControl', // Silverlight
          'Skype.Detection'];
          
        // starting to detect plugins in IE
        return this.map(names, function(name){
          try{
            new ActiveXObject(name);
            return name;
          } catch(e){
            return null;
          }
        }).join(';');
      } else {
        return ""; // behavior prior version 0.5.0, not breaking backwards compat.
      }
    },

    getScreenResolution: function () {
      return [screen.height, screen.width];
    },

    getCanvasFingerprint: function () {
      var canvas = document.createElement('canvas');
      var ctx = canvas.getContext('2d');
      // https://www.browserleaks.com/canvas#how-does-it-work
      var txt = 'http://valve.github.io';
      ctx.textBaseline = "top";
      ctx.font = "14px 'Arial'";
      ctx.textBaseline = "alphabetic";
      ctx.fillStyle = "#f60";
      ctx.fillRect(125,1,62,20);
      ctx.fillStyle = "#069";
      ctx.fillText(txt, 2, 15);
      ctx.fillStyle = "rgba(102, 204, 0, 0.7)";
      ctx.fillText(txt, 4, 17);
      return canvas.toDataURL();
    }
  };


  return Fingerprint;

});
(function(window,undefined){
	var MSG_METHOD = {
		BASE_DOMAIN:'dig.qbao.com',
		BASE_PATH:'/qb-site/images/',
		BASE_IMG:'event.jpg',
		sendMsg:function(params){
			if($.inArray(params.event, recording.records) != -1) {
				var i = new Image();		
				if('cnv' == recording.getGlobalVal('_type')){
					this.BASE_IMG = 'cnv.jpg';
				}
				i.src = '//' + this.BASE_DOMAIN + this.BASE_PATH + this.BASE_IMG + this.formatParams($.extend({},params,{loadTime:new Date().getTime()}));
			}
		},
		formatParams:function(params){
			var s = "";
			for(var p in params){
				s += (s.length > 0 ? '&' : '?') + p + '=' + params[p];
			}
			return s;
		}
	};
	var recording = {
		records:[],
		params:{},
		prevMousemoveTarget:'',
		mousemoveModel:-1,
		init:function(options){
			if(typeof(options.records) === 'undefined'){
				this.records = ['click','mousedown','mouseup','mousemove','mousemoveTrace','mouseout','mouseover',
				'keypress','keyup',
				'load','unload','error','change','submit','resize','scroll','focus','blur'];
			}
			$.extend(true, this, options);
		},
		start:function(options){
			this.init(options);
			params = {sid:this.sid(),fid:this.fid(), uid:this.getGlobalVal('_uid') || '', uname:this.getGlobalVal('_uname') || ''};
			loadParams = $.extend({},params,{title:encodeURIComponent(document.title),screen:this.screen(),ref:encodeURIComponent(document.referrer)});
			this._createIds();
			
			$(document).bind('click', function(e){
				MSG_METHOD.sendMsg($.extend({event:'click'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
			});
			$(document).bind('mousedown',function(e){
				MSG_METHOD.sendMsg($.extend({event:'mousedown'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
			});
			$(document).bind('mouseup',function(e){
				MSG_METHOD.sendMsg($.extend({event:'mouseup'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
			});
			$(document).bind('mousemove',function(e){
				if(recording.mousemoveModel === -1){
					if(e.target.id != recording.prevMousemoveTarget){
						recording.prevMousemoveTarget = e.target.id;
						MSG_METHOD.sendMsg($.extend({event:'mousemove'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
					}
				}
				else {
					if(type(recording.oldTime == 'undefined') || new Date().getTime() < recording.oldTime + mousemoveModel) {
						recording.oldTime = new Date().getTime();
						MSG_METHOD.sendMsg($.extend({event:'mousemoveTrace'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
					}
				}
			});
			$('a').bind('mouseout',function(e){
				MSG_METHOD.sendMsg($.extend({event:'mouseout'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
			});
			$('a').bind('mouseover',function(e){
				MSG_METHOD.sendMsg($.extend({event:'mouseover'},{x:e.pageX,y:e.pageY,target:e.target.id}, params));
			});		
			$('input[type="text"],textarea').bind('keypress',function(e){
				MSG_METHOD.sendMsg($.extend({event:'keypress'},{target:e.target.id}, params));
			});
			$('input[type="text"],textarea').bind('keyup',function(e){
				MSG_METHOD.sendMsg($.extend({event:'keyup'},{target:e.target.id,value:$(this).val()}, params));
			});
			$(window).bind('load',function(){
				MSG_METHOD.sendMsg($.extend({event:'load'},{x:0,y:recording._getDocHeight()}, loadParams));
			});
			$(window).bind('unload',function(){
				MSG_METHOD.sendMsg($.extend({event:'unload'},{x:0,y:recording._getDocHeight()}, params));
			});
			window.onerror = function(a,b,c){
				MSG_METHOD.sendMsg($.extend({event:'error'},{msg:0,url:b, line:c}, params));
			}
			$(':input,textarea').bind('change',function(e){
				if(e.target.type == 'password') {
					MSG_METHOD.sendMsg($.extend({event:'change'},{target:e.target.id,type:'pwd'}, params));
				} 
				else {
					MSG_METHOD.sendMsg($.extend({event:'change'},{target:e.target.id,value:$(this).val()}, params));
				}
			});
			$('form').bind('submit',function(e){
				MSG_METHOD.sendMsg($.extend({event:'submit'},{target:e.target.id}, params));
			});
			$(window).bind('resize',function(e){
				MSG_METHOD.sendMsg($.extend({event:'resize'},recording._getScreenSize(), params));
			});
			if (document.all) {
                $(window).bind("scroll", function (e) {
					MSG_METHOD.sendMsg($.extend({event:'scroll'},{x:document.documentElement.scrollLeft,y:document.documentElement.scrollTop}, params));
                });
            }
            else {
                $(document).bind("scroll", function (e) {
					MSG_METHOD.sendMsg($.extend({event:'scroll'},{x:$(document).scrollLeft(),y:$(document).scrollTop()}, params));
                })
            }
			$('input,select,textarea').bind('focus',function(e){
				MSG_METHOD.sendMsg($.extend({event:'focus'},{target:e.target.id}, params));
			});
			$('input,select,textarea').bind('blur',function(e){
				MSG_METHOD.sendMsg($.extend({event:'blur'},{target:e.target.id}, params));
			});
		},
		sid : function(){
			return navigator.cookieEnabled ? (this._getcookie('sid') || (g = guid(), this._setcookie('sid', g, 1, this._getbasedomain()), g)) : new Fingerprint().get();
		},
		fid : function(){
			return new Fingerprint().get();
		},
		getGlobalVal : function(key){
			var ret = null;
			if(window.QBAO_UT_GV && window.QBAO_UT_GV[key]){
				ret = window.QBAO_UT_GV[key];
			};
			return ret;
		},
		currTime: function(){
			return new Date().getTime();
		},
		screen: function(){
			return window.screen.width + '*' + window.screen.height;
		},
		_getbasedomain: function () {
			var a = window.location.href;
			a = a.replace(/^http(s)?\:\/\/?/i, "");
			a = a.replace(/^([^\/]+)\/.*/i, "$1");
			if(a.indexOf(":") > - 1) a = a.slice(0, a.indexOf(":"));
			if (a.indexOf('.co.') > -1 || a.indexOf('.com.') > -1) a = a.replace(/^([^\.]+\.){1,}([^\.]+\.[^\.]+\.[^\.]+)$/i, "$2");
			else a = a.replace(/^([^\.]+\.){1,}([^\.]+\.[^\.]+)$/i, "$2");
			return "." + a
		},
		_setcookie: function (a, b, c, d) {
			var e = "";
			if (c == 1) {
				var f = new Date();
				f.setTime(f.getTime() + 77760000000);
				var e = "; expires=" + f.toGMTString()
			}
			document.cookie = a + "=" + b + e + "; path=/; domain=" + d + ";"
		},
		_getcookie: function (a) {
			c_start = document.cookie.indexOf(a + "=");
			if (c_start != -1) {
				c_start = c_start + a.length + 1;
				c_end = document.cookie.indexOf(";", c_start);
				if (c_end == -1) c_end = document.cookie.length;
				return unescape(document.cookie.substring(c_start, c_end))
			}
			return ""
		},
		_createIds: function () {
			var a = 0;
			jQuery('a, input, select, textarea').each(function (i) {
				if (!this.id && this.tagName.charAt(0) != "/" && this.tagName.charAt(0) != "#" && this.tagName.charAt(0) != "!") this.id = "ut" + a++
			});
			a = 0;
			jQuery('body').find('*').each(function (i) {
				if (!this.id && this.tagName != "SCRIPT" && this.tagName != "STYLE" && this.tagName != "META" && this.tagName != "TBODY" && this.tagName != "PARAM" && this.tagName != "EMBED" && this.tagName != "FIELD" && this.tagName.charAt(0) != "/" && this.tagName.charAt(0) != "#" && this.tagName.charAt(0) != "!") this.id = "ut" + a++
			})
		},
		_getScreenSize: function () {
			var a = 0,
				height = 0;
			if (typeof window.innerWidth != 'undefined') {
				a = window.innerWidth, height = window.innerHeight
			}
			else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0) {
				a = document.documentElement.clientWidth, height = document.documentElement.clientHeight
			}
			else {
				a = document.getElementsByTagName('body')[0].clientWidth, height = document.getElementsByTagName('body')[0].clientHeight
			}
			return {
				x: a,
				y: height
			}
		},
		_getDocHeight: function () {
			var D = document;
			return Math.max(Math.max(D.body.scrollHeight, D.documentElement.scrollHeight), Math.max(D.body.offsetHeight, D.documentElement.offsetHeight), Math.max(D.body.clientHeight, D.documentElement.clientHeight))
		}
	};
	if($){
		$(function(){
			recording.start({records:['load']});
		});
	}
})(window);
