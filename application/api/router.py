# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import html
import base64
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

    if args['data'] == '__start__':
        app.recordLog('------------------------------------------------------------')
        return workId

    if ':' + workId not in app.getConfig('simulators', ''):
        app.recordError('虚拟机(#'+ workId +')不存在，请配置')
        return workId

    data = args['data'].split('\n')
    app.setTasks(data)

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

@route('/' + APP_NAME + '/')
def api():
    args = request.GET.decode('utf-8')
    action = request.GET.get('action', '').strip()
    imei = request.GET.get('imei', '').strip()
    workId = main.Main().getWorkIdByImei(imei)

    data = ''
    if 'data' in args:
        data = args['data']

    dataStr = ''
    if 'dataStr' in args:
        dataStr = args['dataStr']

    app = main.Main(workId)

    if action == 'getVcode':
        return app.getVcode()
    if action == 'getSmsVcode':
        return app.getSmsVcode(data)
    elif action == 'reportVcodeError':
        return app.reportVcodeError()
    elif action == 'getTaskDataJson':
        return app.getTaskDataJson()
    elif action == 'log':
        return app.recordLog(data)
    elif action == 'recordError':
        return app.recordError(data, dataStr)
    elif action == 'recordRetry':
        return app.recordRetry(data, dataStr)
    elif action == 'recordSuccess':
        return app.recordSuccess(data, dataStr)
    elif action == 'clearTasks':
        return app.clearTasks()

    return ''

@route('/' + APP_NAME + '/uploadVcode', method="POST")
def uploadVcode():
    data = request.POST.get('data', '').strip().replace(' ', '+').replace('\n', '')
    imei = request.POST.get('imei', '').strip()
    workId = main.Main().getWorkIdByImei(imei)
    app = main.Main(workId)

    app.setCommunicate('vcodeImg', data)
    return 'ok'

@route('/' + APP_NAME + '/saveConfig', method='POST')
def saveConfig():
    args = request.POST.decode('utf-8')
    for key, value in args.items():
        main.Main().setConfig(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }
