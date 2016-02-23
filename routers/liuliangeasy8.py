# coding: utf-8

import html
import json

from bottle import route, template, request

import configs.liuliangeasy8
import configs.common
import app.liuliangeasy8.Register
import app.liuliangeasy8.GetRedBag

appName = configs.liuliangeasy8.APP_NAME
tplPath = 'tpl/' + appName + '/'

@route('/' + appName + '/', method='GET')
def index():
    configsSmsFile = html.escape(configs.common.get('smsFile', ''))
    return template(tplPath + 'index.html', htmlTitle=configs.liuliangeasy8.APP_TITLE, appName=appName, configsSmsFile=configsSmsFile)

@route('/' + appName + '/getRedBag', method='GET')
def getRedBag():
    configsSmsFile = html.escape(configs.common.get('smsFile', ''))
    return template(tplPath + 'getRedBag.html', htmlTitle=configs.liuliangeasy8.APP_TITLE, appName=appName, configsSmsFile=configsSmsFile)

@route('/' + appName + '/startRedBag', method="POST")
def startRedBag():
    workId = request.POST.get('id', '').strip()
    phoneNum = request.POST.get('phoneNum', '').strip()
    links = request.POST.get('links', '').strip()

    fetchVcode = request.POST.get('fetchVcode', '').strip()

    app.liuliangeasy8.GetRedBag.GetRedBag(
        appName,
        workId,
        phoneNum,
        links.split('\n'),
        fetchVcode == 'on'
    ).run()

@route('/' + appName + '/start', method="POST")
def start():
    workId = request.POST.get('id', '').strip()
    phoneNum = request.POST.get('phoneNum', '').strip()
    reg = request.POST.get('reg', '').strip()
    getGift = request.POST.get('getGift', '').strip()
    makeRedBagLink = request.POST.get('makeRedBagLink', '').strip()
    fetchVcode = request.POST.get('fetchVcode', '').strip()

    app.liuliangeasy8.Register.Register(
        appName,
        workId,
        phoneNum,
        reg == 'on',
        getGift == 'on',
        makeRedBagLink == 'on',
        fetchVcode == 'on'
    ).run()

    return {
        'status': 'ok',
        'info': 'ok',
        'id': workId,
    }
