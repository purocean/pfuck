# coding: utf-8

import json

from bottle import route, template, request

from utils import log as logger

import configs.home
import configs.common

@route('/', method='GET')
def index():
    return template('tpl/home/index.html', htmlTitle=configs.home.APP_TITLE, appName=configs.home.APP_NAME)

@route('/log', method="GET")
def log():
    appName = request.GET.get('app', '').strip()
    queryStr = request.GET.get('query', '').strip()

    query = json.loads(queryStr)

    result = {}
    for workId, offset in query.items():
        result[workId] = logger.readRecent(appName, workId, offset)

    return result

@route('/communicate', method="POST")
def communicate():
    appName = request.POST.get('app', '').strip()
    workId = request.POST.get('id', '').strip()
    key = request.POST.get('key', '').strip()
    value = request.POST.get('value', '').strip()

    configs.communicate.set(appName, workId, key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }

@route('/saveConfig', method="POST")
def saveConfig():
    args = request.POST.decode('utf-8')
    for key, value in args.items():
        configs.common.set(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }

