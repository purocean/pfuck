   �         !https://www.qbao.com/js/md.pop.js     %hUx     %�	P              �      
     O K      Date   Sun, 28 Feb 2016 11:10:46 GMT   Content-Type   %application/javascript; charset=utf-8   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Mon, 29 Feb 2016 10:52:11 GMT   Last-Modified   Tue, 24 Nov 2015 07:23:30 GMT   X-Cache   hit /**
 * Created with JetBrains WebStorm.
 * User: Administrator
 * Date: 14-7-14
 * Time: 上午9:42
 * The pop-up layer interaction component
 */
(function (window) {
    "use strict";

    var popTag = null;
    var Pop = function () {

    };

    var tool = {

        gl: {
            bindFn: null
        },

        /**
         * obtain HTML tag's object for DOM.
         * ID must be of type string
         * @param {string} id
         * @returns {HTMLObjectElement}
         */
        byId: function (id) {
            var dom = null;

            //Compatible method of low version of the browser to get the DOM object.
            if (document.all) {
                var doms = document.all[id];
				
				if (!doms.length) {
					return doms;
				}

                for (var i = 0, len = doms.length; i < len; i++) {
                    if (doms[i].id === id) {
                        dom = doms[i];
                    }
                }
            } else {
                dom = document.getElementById(id);
            }


            if (dom === null) {
                throw new Error(id + " was not found in the page");
            }

            return dom;
        },

        /**
         * The sub array directly obtain the DOM object nodes
         * The parameter's type must be DOM object
         * @param {HTMLObjectElement} dom
         * @returns {Array}
         */
        children: function (dom) {
            var nodes = [];

            //Judging whether the DOM object can have child nodes
            if (dom.hasChildNodes()) {
                var items = dom.childNodes;

                for (var i = 0, len = items.length; i < len; i++) {

                    //To determine the child node is a DOM object
                    if (Number(items[i].nodeType) === 1) {
                        nodes.push(items[i]);
                    }
                }
            }

            return nodes;
        },

        bindEvent: function (type, dom, fn) {
            var self = this;
            var ary = [];

            if (arguments.length > 3) {

                for (var i = 3, len = arguments.length; i < len; i++) {
                    ary.push(arguments[i]);
                }
            }
            self.gl.bindfn = function () {
                fn.apply(dom, ary);
            };

            if (window.addEventListener) {
                dom.addEventListener(type, self.gl.bindfn, false);
            } else {
                dom.attachEvent('on' + type, self.gl.bindfn);
            }
        }
    };

    Pop.fn = Pop.prototype = {

        /**
         *
         * @param {Object} id/html/width/height/scroll/fn
         */
        load: function (options) {
            var self = this;
            var dom = null;
            var popCon = null, popColse = null, popMain = null;
            var left = 0, top = 0;

            //Judge DOM property exists if there is no default is body
            if (options.id) {
                dom = tool.byId(options.id);
            } else {
                dom = window.document.body;
            }

            //The HTML attribute must be present
            popTag = dom.appendChild(popDom({

                title: (function () {
                    var str = 'title';

                    if (options.title) {
                        str = options.title;
                    }

                    return str;
                })(),

                html: (function () {
                    var html = '';

                    if (options.html) {
                        html = options.html;
                    }

                    return html;
                })()
            }));

            //set pop's class attribute
            popTag.className = "md_pop";
            popCon = child(child(popTag, 1), 0);
            popColse = child(child(popCon, 0), 0);
            popMain = child(popCon, 1);

            //colse pop layout
            tool.bindEvent('click', popColse, function () {
                self.close();
            });

            //set popMain's height
            if (options.height) {
                popMain.style.height = options.height + 'px';
            }

            if (options.width) {
                popCon.style.width = options.width + 'px';
            }

            if (options.scroll && Boolean(options.scroll)) {
                popMain.style.overflowY = 'scroll';
            }

            left = -Math.floor(Number(popCon.offsetWidth) / 2);
            top = -Math.floor(Number(popCon.offsetHeight) / 2);
            popCon.style.left = left + 'px';
            popCon.style.top = top + 'px';

            if (options.fn) {
                options.fn.apply(popMain, [popTag, child(popTag, 0), arguments]);
            }
        },

        close: function () {
            var dom = null;

            if (popTag !== null && popTag.className === 'md_pop') {
                dom = popTag.parentNode;
                dom.removeChild(popTag);
            } else {
                return null;
            }
        }
    };

    /**
     * The child node single sequence obtained in DOM
     * @param dom {HTMLObjectElement}
     * @param index {Number}
     * @returns {HTMLObjectElement}
     */
    function child(dom, index) {
        var children = tool.children(dom);
        var len = children.length;

        if (index >= len) {
            return null;
        } else {
            return children[index];
        }
    }

    /**
     * Add tags content
     * @param options title/html
     * @returns {HTMLElement}
     */
    function popDom(options) {
        var tagArr = [];
        var dom = document.createElement('div');

        tagArr.push('<div class="md_pop_layout"><!--layout--></div>');
        tagArr.push('<div class="md_pop_frame">');
        tagArr.push('<div class="md_pop_con">');
        tagArr.push('<div class="md_pop_title">');
        tagArr.push('<span>X</span>');
        tagArr.push('<strong>' + options.title + '</strong>');
        tagArr.push('</div>');
        tagArr.push('<div class="md_pop_main">');
        tagArr.push(options.html);
        tagArr.push('</div>');
        tagArr.push('</div>');
        tagArr.push('</div>');
        dom.innerHTML = tagArr.join('');

        return dom;
    }

    window.pop = new Pop();
})(window);


