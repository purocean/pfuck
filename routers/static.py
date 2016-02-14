# coding: utf-8

from bottle import route, static_file

@route('/static/:fileTYpe/:file', method='GET')
def static(fileTYpe, file):
    return static_file('static/'+ fileTYpe +'/' + file, '.')

@route('/favicon.ico', method='GET')
def static():
    return static_file('favicon.ico', '.')
