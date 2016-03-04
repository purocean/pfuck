# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import html, base64
from bottle import route, template, request

from . import config, communicate, main, func, logger
import application.common.config

@route('/' + APP_NAME + '/index', method='GET')
def index():
    configs = {
        'smsFile': (application.common.config.get('smsFile', '')),
        'ruokuaiUser': html.escape(application.common.config.get('ruokuaiUser', '')),
        'ruokuaiPassword': html.escape(application.common.config.get('ruokuaiPassword', '')),
        'threadNum': html.escape(application.common.config.get('threadNum', '3')),
        'simulators': html.escape(config.get('simulators', '')),
    }

    return template(TPL_DIR + 'index.html', htmlTitle=APP_TITLE, appName=APP_NAME, configs=configs)

@route('/' + APP_NAME + '/start', method="POST")
def start():
    args = request.POST.decode('utf-8')
    workId = args['id']

    if args['data'] == '__start__':
        logger.write(workId, '------------------------------------------------------------')
        return workId

    if ':' + workId not in config.get('simulators', ''):
        logger.write("error", '虚拟机(#'+ workId +')不存在，请配置')
        return workId

    data = args['data'].split('\n')
    main.Main(workId).setTaskData(data)

    return workId

@route('/' + APP_NAME + '/communicate', method="POST")
def cmunte():
    workId = request.POST.get('id', '').strip()
    key = request.POST.get('key', '').strip()
    value = request.POST.get('value', '').strip()

    communicate.set(workId, key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }

@route('/' + APP_NAME + '/')
def api():
    args = request.GET.decode('utf-8')
    action = request.GET.get('action', '').strip()
    imei = request.GET.get('imei', '').strip()
    workId = func.getWorkIdByImei(imei)

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
        return app.log(data)
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
    workId = func.getWorkIdByImei(imei)

    communicate.set(workId, 'vcodeImg', data)
    return 'ok'

@route('/' + APP_NAME + '/saveConfig', method='POST')
def saveConfig():
    args = request.POST.decode('utf-8')
    for key, value in args.items():
        config.set(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }
