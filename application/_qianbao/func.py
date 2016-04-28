# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import time

from . import communicate, logger, config

import vendors.smsvcode
import vendors.vcode

import application.common.config

def getSmsVcode(workId, phoneNumber):
    vcodeFromCommunicate = communicate.get(workId, 'smsvcode')

    if vcodeFromCommunicate:
        communicate.set(workId, 'smsvcode', False)
        return vcodeFromCommunicate
    else:
        smsFile = application.common.config.get('smsFile', 'sms.txt')
        lastVcode = communicate.get(workId, 'lastsmsvcode')
        vcode = vendors.smsvcode.get(smsFile, phoneNumber, lastVcode)
        if vcode == False:
            logger.write(workId, '短信文件：'+smsFile+'不存在！')
            return False
        else:
            if vcode:
                communicate.set(workId, 'lastsmsvcode', vcode)
                logger.write(workId, vcode)
                return vcode
            else:
                return False

def getVcode(workId, img):
    user = application.common.config.get('ruokuaiUser')
    password = application.common.config.get('ruokuaiPassword')

    if user == None or password == None:
        logger.write(workId, '请配置若快账号！')
        return False
    else:
        vcode = vendors.vcode.get(user, password, img)
        if vcode == False:
            logger.write(workId, '识别验证码出错！')
        else:
            logger.write(workId, '识别结果：' + vcode['result'])

        return vcode

def reportVcodeError(workId, imgId):
    user = application.common.config.get('ruokuaiUser')
    password = application.common.config.get('ruokuaiPassword')

    if user == None or password == None:
        logger.write(workId, '请配置若快账号！')
        return False
    else:
        vendors.vcode.report(user, password, imgId)

def isRun(workId):
    return communicate.get(workId, 'run') != 'false'

def wait(workId, second, doing, data=None):
    for x in range(second):
        if not isRun(workId):
            break
        logger.write(workId, '*')

        result = doing(data)
        if result != False:
            return result
            break

        time.sleep(1)
    return False
