# coding: utf-8

from bottle import route, template

import configs.main

@route('/', method='GET')
def index():
    return template('tpl/index.html', htmlTitle=configs.main.APP_NAME)
