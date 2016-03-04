/*! http://mths.be/startswith v0.2.0 by @mathias */
if (!String.prototype.startsWith) {
    (function() {
        'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
        var defineProperty = (function() {
            // IE 8 only supports `Object.defineProperty` on DOM elements
            try {
                var object = {};
                var $defineProperty = Object.defineProperty;
                var result = $defineProperty(object, object, object) && $defineProperty;
            } catch (error) {}
            return result;
        }());
        var toString = {}.toString;
        var startsWith = function(search) {
            if (this == null) {
                throw TypeError();
            }
            var string = String(this);
            if (search && toString.call(search) == '[object RegExp]') {
                throw TypeError();
            }
            var stringLength = string.length;
            var searchString = String(search);
            var searchLength = searchString.length;
            var position = arguments.length > 1 ? arguments[1] : undefined;
            // `ToInteger`
            var pos = position ? Number(position) : 0;
            if (pos != pos) { // better `isNaN`
                pos = 0;
            }
            var start = Math.min(Math.max(pos, 0), stringLength);
            // Avoid the `indexOf` call if no match is possible
            if (searchLength + start > stringLength) {
                return false;
            }
            var index = -1;
            while (++index < searchLength) {
                if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
                    return false;
                }
            }
            return true;
        };
        if (defineProperty) {
            defineProperty(String.prototype, 'startsWith', {
                'value': startsWith,
                'configurable': true,
                'writable': true
            });
        } else {
            String.prototype.startsWith = startsWith;
        }
    }());
}

/*! http://mths.be/endswith v0.2.0 by @mathias */
if (!String.prototype.endsWith) {
  (function() {
    'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
    var defineProperty = (function() {
      // IE 8 only supports `Object.defineProperty` on DOM elements
      try {
        var object = {};
        var $defineProperty = Object.defineProperty;
        var result = $defineProperty(object, object, object) && $defineProperty;
      } catch(error) {}
      return result;
    }());
    var toString = {}.toString;
    var endsWith = function(search) {
      if (this == null) {
        throw TypeError();
      }
      var string = String(this);
      if (search && toString.call(search) == '[object RegExp]') {
        throw TypeError();
      }
      var stringLength = string.length;
      var searchString = String(search);
      var searchLength = searchString.length;
      var pos = stringLength;
      if (arguments.length > 1) {
        var position = arguments[1];
        if (position !== undefined) {
          // `ToInteger`
          pos = position ? Number(position) : 0;
          if (pos != pos) { // better `isNaN`
            pos = 0;
          }
        }
      }
      var end = Math.min(Math.max(pos, 0), stringLength);
      var start = end - searchLength;
      if (start < 0) {
        return false;
      }
      var index = -1;
      while (++index < searchLength) {
        if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
          return false;
        }
      }
      return true;
    };
    if (defineProperty) {
      defineProperty(String.prototype, 'endsWith', {
        'value': endsWith,
        'configurable': true,
        'writable': true
      });
    } else {
      String.prototype.endsWith = endsWith;
    }
  }());
}

Ycom = {
    Cookie: {
        set: function(name, value, exp, domain, path) {
            document.cookie = name+"="+encodeURIComponent(value==undefined?"":value)+(exp?"; expires="+new Date(new Date().getTime()+(exp-0)*1000).toUTCString():"")+"; domain="+(domain?domain:document.domain)+"; path="+(path?path:"/");
        },

        get: function(name) {
            return document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"))==null ? null : decodeURIComponent(RegExp.$2);
        },

        remove: function(name) {
            if(this.get(name) != null) this.set(name, null, -1);
        }
    },

    formatStr: function(tpl, obj) {
        var reg = /{([^{}]+)}/gm;
        return tpl.replace(reg, function(match, name){
            return obj[name];
        });
    },

    pad: function(num, n) {
        return Array(n > num ? (n-(''+num).length+1) : 0).join(0) + num;
    },

    htmlEncode: function(str) {
        var div = document.createElement("div");
        div.appendChild(document.createTextNode(str));
        return div.innerHTML;
    },

    ajaxForm: function(form, done, fail, always) {
        var loading = this.loading;
        loading.show();
        var formObj = $(form);
        this.ajax(formObj.attr('action'), formObj.attr('method'),
            formObj.serialize(), done, fail, always);
    },

    ajax: function(url, type, data, done, fail, always) {
        var loading = this.loading;
        loading.show();
        return $.ajax({
            url: url,
            type: type,
            dataType: 'json',
            data: data,
            cache: false,
        })
        .done(function(result) {
            if (typeof(done) != "undefined") {
                done(result);
            }
        })
        .fail(function(result) {
            if (typeof(fail) != "undefined") {
                fail(result);
            }

            alert('遇到一点错误，请稍后再试 :(')
        })
        .always(function(result) {
            if (typeof(always) != "undefined") {
                always(result);
            }
            loading.hide();
        });
    },

    page: {
        reset: function(obj, offset, count, total) {
            obj = $(obj);

            var lp = parseInt(total / count);
                if(total % count){
                    ++lp;
                }
            var page = parseInt(offset / count) + 1;
                if(offset % count){
                    ++page;
                }

            if(page > 1){
                var html = '<li class="arrow"><a class="page" href="#" data-page="'+ (page - 1) +'">&laquo;</a></li>';
            }else{
                var html = '';
            }

            var count = 0;
            for(var i = page - 9; i <= lp; ++i){
                if(i < 1){
                    continue;
                }

                if(i == page){
                    html += '<li class="current"><a href="javascript:void(0)">'+ i +'</a></li>';
                }else{
                    html += '<li><a class="page" href="#" data-page="'+ i +'">'+ i +'</a></li>';
                }

                ++count;
                if(count > 9){
                    break;
                }
            }

            if(page < lp){
                html += '<li class="arrow"><a class="page" href="#" data-page="'+ (page + 1) +'">&raquo;</a></li>';
            }else{
                html += '';
            }

            obj.html(html);
        },

        bindEvent: function(obj, call) {
            $(obj).on('click', 'li a.page', function() {
                var page = $(this).data('page');
                call(page);

                return false;
            });
        },
    },

    table: function(obj, struct, data) {
        html = '<thead><tr>';
        for (var x in struct) {
            html += '<th class="th_'+ x +'"><nobr>'+ struct[x] +'</nobr></th>';
        }
        html += '</tr></thead><tbody>';
        for (var row in data) {
            html += '<tr class="row_'+ row +'">'
            for (var col in struct) {
                if (col.startsWith('_') == false) {
                    data[row][col] = Ycom.htmlEncode(data[row][col]);
                }

                html += '<td class="td_'+ x +'">'+  data[row][col] +'</td>';
            }
            html += '</tr>'
        }
        html += '</tbody>';

        $(obj).html(html);
    },

    nav: {
        bindEvent: function(nav, fun){
            $(nav).off('click', 'div').on('click', 'div', function(){
                if(fun($(this)) !== false){
                    $(this).addClass('selected');
                    $(this).siblings().removeClass('selected');
                    return false;
                }
            });
        },
    },


    loading: {
        init: function() {
            $('body').append('<div class="ycom-loading" style="position: fixed; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(255, 255, 255, .4); background-image: url(data:image/gif;base64,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); background-position: center 300px; background-repeat: no-repeat; background-size: 50px; display: none; z-index: 5000; "></div>');
        },

        show: function() {
            if ($('.ycom-loading').size() == 0) {
                this.init();
            }

            $('.ycom-loading').fadeIn();
        },

        hide: function() {
            if ($('.ycom-loading').size() == 0) {
                this.init();
            }

            $('.ycom-loading').fadeOut();
        }
    },

    fillForm: function(fo, data, eliminate) {
        for (var x in data) {
            var objs = $(fo).find('input[type=hidden][name='+x+'],\
                          input[type=email][name='+x+'],\
                          input[type=text][name='+x+'],\
                          input[type=number][name='+x+'],\
                          textarea[name='+x+'],\
                          select[name='+x+']');
            // TODO radio checked。。。

            if (eliminate) {
                objs = objs.not(eliminate);
            }

            objs.val(data[x]);
        }
    },

    fillOptionAr: function(obj, list, alias){
        var html = "";
        for(x in list){
            var selected = '';
            if(list[x].alias == alias){
                selected = ' selected';
            }
            html += '<option value="'+list[x].alias+'" '+selected+'>'+list[x].name+'</option>';
        }

       $(obj).html(html);
    },

    fillOptionArEx: function(obj, list, alias){
        var html = "";
        for(x in list){
            var selected = '';
            if(list[x].alias == alias){
                selected = ' selected';
            }
            html += '<option value="'+list[x].name+'" '+selected+'>'+list[x].name+'</option>';
        }

       $(obj).html(html);
    },

    clearForm: function(fo, eliminate) {
        var objs = $(fo).find('input[type=hidden],\
                      input[type=password],\
                      input[type=email],\
                      input[type=text],\
                      input[type=number],\
                      textarea');
            // TODO radio checked。。。

        if (eliminate) {
            objs.not(eliminate);
        }

        objs.val('');
    },

    Uploader: function() {
        return {
            configs: {
                form: 'uploader-form',
                formAction: '',
                frame: 'uploader-frame',
                input: 'uploader-input',
                inputName: 'file',
                fileType: 'image/gif, image/jpeg, image/png',
            },

            objs: {},

            set: function(key, value) {
                this.configs[key] = value;
            },

            init: function(call, callback, configs) {
                if (configs) {
                    for (x in configs) {
                        this.set(x, configs[x]);
                    }
                }

                $('body').append('\
                    <div style="z-index: -500;width: 0;height: 0;position: absolute; top: 0; left: -99999; opacity:0;">\
                        <form id="'+ this.configs.form +'" name="'+ this.configs.form +'" action="'+ this.configs.formAction +'" target="'+ this.configs.frame +'" method="post" enctype="multipart/form-data">\
                            <input id="'+ this.configs.input +'" name="'+ this.configs.inputName +'" type="file" accept="'+ this.configs.fileType +'" />\
                        </form>\
                        <iframe id="'+ this.configs.frame +'" name="'+ this.configs.frame +'" frameborder="0"></iframe>\
                    </div>\
                ');

                for (x in this.configs) {
                    if (x != 'formAction' && x != 'inputName' && x != 'fileType') {
                        this.objs[x] = $('#'+this.configs[x]);
                    }
                }

                if (call != undefined) {
                    call();
                }

                var This = this;
                this.objs.frame.load(function() {
                    This.objs.form.get(0).reset();

                    var result = $(window.frames[This.configs.frame].document.body).html();
                    if (callback != undefined) {
                        callback(result);
                    }
                });
            },

            send: function() {
                this.objs.form.submit();
            },
        };
    },

    dialog: {
        init: function(){
            $('body').append('\
                <div id="dialog-box-wrapper">\
                    <img id="dialog-box-close" src="static/img/close_d.png" alt="close" />\
                    <div id="dialog-box"></div>\
                </div>\
            ');

            this.wrapper = $('#dialog-box-wrapper');
            this.close = $('#dialog-box-close');
            this.box = $('#dialog-box');

            this.close.click(function(){
                Ycom.dialog.hide();
            });
        },

        show: function(html, flag){
            if(flag === false){
                this.close.hide();
            }else{
                this.close.show();
            }

            this.box.html(html);
            this.wrapper.fadeIn();
        },

        hide: function(){
            this.box.html('');
            this.wrapper.fadeOut();
        },

        bindEvent: function(type, target, fun){
            this.wrapper.off(type, target).on(type, target, fun);
        },
    },

    divideArray: function(inArr, start, end, count) {
        if (count <= 0) {
            return [];
        }

        var firstSize = parseInt((end - start - 1) / count) + 1;

        var first = inArr.slice(start, start + firstSize);
        var other = this.divideArray(inArr, start + firstSize, end, count - 1);

        return [first].concat(other);
    }
};

(function($){
    $.fn.serializeJson = function(){
        var serializeObj = {};
        var array = this.serializeArray();
        var str = this.serialize();
        $(array).each(function(){
            if(serializeObj[this.name]){
                if($.isArray(serializeObj[this.name])){
                    serializeObj[this.name].push(this.value);
                }else{
                    serializeObj[this.name] = [serializeObj[this.name],this.value];
                }
            }else{
                serializeObj[this.name] = this.value;
            }
        });
        return serializeObj;
    };
})($);
