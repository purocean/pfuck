#coding: utf-8
"""
Httplib
一个 HTTP 通讯库
@author: 洋子
@license: MIT License
@email: work.purocean@outlook.com
"""

import gzip
import socket
import urllib.request, urllib.parse, urllib.error
import http.cookiejar
import http.client

class Httplib:
    def __init__(self, timeout = 30, addDefHeaders = True, debug = False):
        self.response = None

        socket.setdefaulttimeout(timeout)
        self.cj = http.cookiejar.CookieJar()
        self.__opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(self.cj))
        urllib.request.install_opener(self.__opener)

        if debug:
            http.client.HTTPConnection.debuglevel = 1
        if addDefHeaders:
            self.__addDefHeaders()

    def __error(self, e):
        '''错误处理'''
        print(e)

    def __addDefHeaders(self):
        '''添加默认的 headers.'''
        self.__opener.addheaders = [('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2503.0 Safari/537.36'),
                                    ('Connection', 'keep-alive'),
                                    ('Cache-Control', 'no-cache'),
                                    ('Accept-Language:', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3'),
                                    ('Accept-Encoding', 'gzip, deflate'),
                                    ('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')]

    def __decode(self, webPage, charset):
        '''gzip解压，并根据指定的编码解码网页'''
        if webPage.startswith(b'\x1f\x8b'):
            result = gzip.decompress(webPage)
            result.decode(charset, 'ignore')
        else:
            result = webPage.decode(charset, 'ignore')
        return result

    def __send(self, request, headers, charset):
        '''发送一个请求'''
        for k, v in headers.items():
            request.add_header(k, v)

        try:
            self.response = self.__opener.open(request)
        except urllib.error.HTTPError as e:
            self.__error(e)
        else:
            return self.__decode(self.response.read(), charset)

    def get(self, url, params={}, headers={}, charset='UTF-8'):
        '''HTTP GET 方法'''
        if params:
            url += '?' + urllib.parse.urlencode(params)
        request = urllib.request.Request(url)
        return self.__send(request, headers, charset)

    def post(self, url, params={}, headers={}, charset='UTF-8'):
        '''HTTP POST 方法'''
        if type(params) != type(''):
            params = urllib.parse.urlencode(params)
        request = urllib.request.Request(url, data=params.encode(charset))
        return self.__send(request, headers, charset)
