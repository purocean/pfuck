# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *
from . import config

from bottle import route, template, static_file, request

@route('/', method='GET')
def index():
    return template(TPL_DIR + 'index.html', htmlTitle=APP_TITLE, appName=APP_NAME)

@route('/log', method='GET')
def log():
    appName = request.GET.get('app', '').strip()
    queryStr = request.GET.get('query', '').strip()

    app = __import__('application.' + appName, globals(), locals(), ['logger'], 0)

    query = json.loads(queryStr)

    result = {}
    for workId, offset in query.items():
        result[workId] = app.logger.readRecent(workId, offset)

    return result

@route('/saveConfig', method='POST')
def saveConfig():
    args = request.POST.decode('utf-8')
    for key, value in args.items():
        config.set(key, value)

    return {
        'status': 'ok',
        'info': 'ok',
    }

@route('/static/:fileTYpe/:file', method='GET')
def static(fileTYpe, file):
    return static_file('static/'+ fileTYpe +'/' + file, '.')

@route('/favicon.ico', method='GET')
def static():
    return static_file('favicon.ico', '.')

