# coding: utf-8
# cython: language_level=3, boundscheck=False
import base64, re
import time, json

from .__init__ import *

from . import communicate, func, logger, config

class Main():
    def __init__(self, workId):
        self.workId = workId

    def parseData(self, dataStr):
        dataStr = re.sub(re.compile("\s+"), ',', dataStr)
        pool = dataStr.split(',')

        return {
            'phoneNum': pool[0],
            'password': pool[1],
            'dataStr': dataStr,
        }

    def setTaskData(self, dataStrList):
        data = []
        for dataStr in dataStrList:
            try:
                data.append(self.parseData(dataStr))
            except:
                self.recordError('数据格式错误', dataStr)

        communicate.set(self.workId, 'taskData', json.dumps(data))

    def clearTasks(self):
        communicate.set(self.workId, 'taskData', '[]')


    def getTaskDataJson(self):
        return communicate.get(self.workId, 'taskData', '[]')

    def getVcode(self):
        vcodeImg = communicate.get(self.workId, 'vcodeImg')
        lastVcodeImg = communicate.get(self.workId, 'lastVcodeImg')
        if vcodeImg != lastVcodeImg:
            vcode = func.getVcode(self.workId, base64.b64decode(vcodeImg))
            communicate.set(self.workId, 'lastVcodeImg', vcodeImg)
            if 'result' in vcode and 'id' in vcode:
                communicate.set(self.workId, 'lastVcodeImgId', vcode['id'])

                return vcode['result']
            else:
                return ''
        else:
            return ''

    def getSmsVcode(self, phoneNum):
        smsVcode = func.getSmsVcode(self.workId, phoneNum)
        if smsVcode:
            return smsVcode

        return ''

    def reportVcodeError(self):
        lastVcodeImgId = communicate.get(self.workId, 'lastVcodeImgId')
        if lastVcodeImgId:
            func.reportVcodeError(self.workId, lastVcodeImgId)

        return '反馈完成'

    def log(self, text):
        logger.write(self.workId, '[app] ' + text)
        return ''

    def recordError(self, text, dataStr=''):
        self.log(text)
        logger.write('error', '\n', prefix="")
        logger.write('error', '[' + self.workId +'] ' + ' <' + text + '>\n' + dataStr)
        return ''

    def recordRetry(self, text, dataStr=''):
        logger.write('retry', dataStr, prefix='')
        self.recordError('**请重试此条**' + text, dataStr)
        return ''

    def recordSuccess(self, text, dataStr=''):
        self.log(text)
        logger.write('success', dataStr)
        return ''
