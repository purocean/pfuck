# coding: utf-8

import json

from bottle import route, template, request

from utils import log as logger

import configs.main
import configs.communicate
import work.Register


@route('/', method='GET')
def index():
    return template('tpl/index.html', htmlTitle=configs.main.APP_NAME)

@route('/start', method="POST")
def start():
    workId = request.POST.get('id', '').strip()
    phoneNum = request.POST.get('phoneNum', '').strip()

    work.Register.Register(workId, phoneNum).run()

    return {
        'status': 'ok',
        'info': 'ok',
    }

@route('/log', method="GET")
def log():
    queryStr = request.GET.get('query', '').strip()

    query = json.loads(queryStr)
    print(query)

    result = {}
    for workId, offset in query.items():
        result[workId] = logger.readRecent(workId, offset)

    return result

@route('/communicate', method="POST")
def communicate():
    workId = request.POST.get('id', '').strip()
    key = request.POST.get('key', '').strip()
    value = request.POST.get('value', '').strip()

    configs.communicate.set(workId, key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }
