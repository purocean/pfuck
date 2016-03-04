# coding: utf-8
# cython: language_level=3, boundscheck=False

import re
import time
import json

from .__init__ import *

import vendors.vcode

class Main(object):
    def __init__(self, workId='page'):
        self.workId = workId

        self.logDir = LOG_DIR
        self.dataDir = DATA_DIR

    def __del__(self):
        pass

    def setTasks(self, tasks):
        self.setCommunicate('tasks', json.dumps(tasks))

    def clearTasks(self):
        self.setCommunicate('tasks', '[]')

    def getVcode(self, img):
        user = Main().getConfig('ruokuaiUser')
        password = Main().getConfig('ruokuaiPassword')

        if user == None or password == None:
            self.recordError('请配置若快账号！')
            return False
        else:
            vcode = vendors.vcode.get(user, password, img)
            if vcode == False:
                self.recordLog('打码平台出错！')

            return vcode

    def getSmsVcode(self, phoneNum):
        vcodeFromCommunicate = self.getCommunicate('smsvcode')

        if vcodeFromCommunicate:
            self.setCommunicate('smsvcode', False)
            return vcodeFromCommunicate
        else:
            smsFile = Main().getConfig('smsFile', 'sms.txt')
            lastVcode = self.getCommunicate('lastsmsvcode')
            vcode = vendors.smsvcode.get(smsFile, phoneNum, lastVcode)
            if vcode == False:
                self.recordLog('短信文件：'+smsFile+'不存在！')
                return False
            else:
                if vcode:
                    self.setCommunicate('lastsmsvcode', vcode)
                    return vcode

        return False

    def reportVcodeError(self, imgId):
        user = Main().getConfig('ruokuaiUser')
        password = Main().getConfig('ruokuaiPassword')

        if user == None or password == None:
            logger.write(workId, '请配置若快账号！')
            return False
        else:
            vendors.vcode.report(user, password, imgId)

    def isRun(self):
        return self.getCommunicate('run') != 'false'

    def wait(self, second, doing, data=None):
        for x in range(second):
            if not self.isRun():
                break

            self.recordLog('*')

            result = doing(data)
            if result != False:
                return result
                break

            time.sleep(1)
        return False

    def recordLog(self, text, workId=None, prefix=None):
        if workId == None:
            workId = self.workId

        return utils.logger.write(self.logDir, workId, text, prefix)

    def recordError(self, text, taskStr=''):
        self.recordLog(text)
        self.recordLog('\n', 'error', prefix='')
        self.recordLog('[' + self.workId +'] ' + ' <' + text + '>\n' + taskStr, 'error')

    def recordRetry(self, text, taskStr=''):
        self.recordLog(taskStr, 'retry', prefix='')
        self.recordError('<请重试此条>' + text, taskStr)

    def recordSuccess(self, text, taskStr=''):
        self.recordLog(text)
        self.recordLog(taskStr, 'success')

    def getConfig(self, key, default=None):
        return utils.config.get(self.dataDir, key, default)

    def setConfig(self, key, value):
        return utils.config.set(self.dataDir, key, value)

    def getCommunicate(self, key, default=None):
        return utils.communicate.get(self.dataDir, self.workId, key, default)

    def setCommunicate(self, key, value):
        return utils.communicate.set(self.dataDir, self.workId, key, value)

    def readRecentLog(self, offset, workId=None):
        if workId == None:
            workId = self.workId

        return utils.logger.readRecent(self.logDir, workId, offset)
