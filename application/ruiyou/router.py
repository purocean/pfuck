# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import html
from bottle import route, template, request

from . import main
import application.common.main

@route('/' + APP_NAME + '/index', method='GET')
def index():
    commonApp = application.common.main.Main()
    configs = {
        'smsFile': (commonApp.getConfig('smsFile', '')),
        'ruokuaiUser': html.escape(commonApp.getConfig('ruokuaiUser', '')),
        'ruokuaiPassword': html.escape(commonApp.getConfig('ruokuaiPassword', '')),
        'threadNum': html.escape(commonApp.getConfig('threadNum', '3')),
        'simulators': html.escape(main.Main().getConfig('simulators', '')),
    }

    return template(TPL_DIR + 'index.html', htmlTitle=APP_TITLE, appName=APP_NAME, configs=configs)

@route('/' + APP_NAME + '/start', method="POST")
def start():
    args = request.POST.decode('utf-8')
    workId = args['id']
    app = main.Main(workId)

    app.recordLog('------------------------------------------------------------')
    if args['data'] == '__start__':
        return workId

    data = args['data'].split('\n')
    app.setTasks(data)
    app.run()

    return workId

@route('/' + APP_NAME + '/communicate', method="POST")
def cmunte():
    workId = request.POST.get('id', '').strip()
    key = request.POST.get('key', '').strip()
    value = request.POST.get('value', '').strip()

    app = main.Main(workId)

    app.setCommunicate(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }

@route('/' + APP_NAME + '/saveConfig', method='POST')
def saveConfig():
    args = request.POST.decode('utf-8')
    for key, value in args.items():
        main.Main().setConfig(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }
