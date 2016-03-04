# coding: utf-8
# cython: language_level=3, boundscheck=False
import re
import base64
import time
import json

from .__init__ import *

import application.common.main

class Main(application.common.main.Main):
    def __init__(self, workId='page'):
        super(Main, self).__init__(workId);

        self.logDir = LOG_DIR
        self.dataDir = DATA_DIR

    def setTasks(self, tasks):
        data = []
        for task in tasks:
            dataStr = re.sub(re.compile("\s+"), ',', task)
            data.append(dataStr)

        super(Main, self).setTasks(data);

    def getTaskDataJson(self):
        return self.getCommunicate('tasks', '[]')

    def getVcode(self):
        vcodeImg = self.getCommunicate('vcodeImg')
        lastVcodeImg = self.getCommunicate('lastVcodeImg')
        if vcodeImg != lastVcodeImg:
            vcode = super(Main, self).getVcode(base64.b64decode(vcodeImg));
            self.setCommunicate('lastVcodeImg', vcodeImg)
            if vcode != False and 'result' in vcode and 'id' in vcode:
                self.setCommunicate('lastVcodeImgId', vcode['id'])

                return vcode['result']
            else:
                return ''
        else:
            return ''

    def getSmsVcode(self, phoneNum):
        smsVcode = super(Main, self).getSmsVcode(phoneNum)
        if smsVcode:
            return smsVcode

        return ''

    def reportVcodeError(self):
        lastVcodeImgId = self.getCommunicate('lastVcodeImgId')
        if lastVcodeImgId:
            super(Main, self).reportVcodeError(lastVcodeImgId)

        return '反馈完成'

    def recordLog(self, text, workId=None, prefix=''):
        super(Main, self).recordLog('[app] ' + text, workId, prefix)
        return ''

    def recordError(self, text, dataStr=''):
        super(Main, self).recordError('[app] ' + text, dataStr)
        return ''

    def recordRetry(self, text, dataStr=''):
        super(Main, self).recordRetry(text, dataStr)
        return ''

    def recordSuccess(self, text, dataStr=''):
        super(Main, self).recordSuccess(text, dataStr)
        return ''

    def getWorkIdByImei(self, imei):
        simulators = self.getConfig('simulators', '').split('\n')
        for x in simulators:
            simulator = x.split(':')
            if simulator[0] == imei:
                return simulator[1].strip()

        return '0'
