# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import html
from bottle import route, template, request

from . import config, book, communicate, logger
import application.common.config

@route('/' + APP_NAME + '/', method='GET')
def index():
    configs = {
        'smsFile': (application.common.config.get('smsFile', '')),
        'ruokuaiUser': html.escape(application.common.config.get('ruokuaiUser', '')),
        'ruokuaiPassword': html.escape(application.common.config.get('ruokuaiPassword', '')),
        'threadNum': html.escape(application.common.config.get('threadNum', '3')),
    }

    return template(TPL_DIR + 'index.html', htmlTitle=APP_TITLE, appName=APP_NAME, configs=configs)

@route('/' + APP_NAME + '/start', method="POST")
def start():
    args = request.POST.decode('utf-8')
    workId = args['id']

    if args['data'] == '__start__':
        logger.write(workId, '------------------------------------------------------------')
        return workId

    data = args['data'].split('\n')

    book.Book(
        workId,
        data
    ).run()

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
