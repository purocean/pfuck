# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import re
import time
from hashlib import md5

import utils.httplib
import vendors.smsvcode

from . import func, communicate, logger

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import selenium.webdriver.support.ui as ui

class Main():
    def __init__(self, workId, tasks):
        self.workId = workId
        self.tasks = tasks
        self.task = {}
        self.taskName = 'task'
        self.taskDetail = 'taskDetail'

        self.log('------------------------------------------------------------')

    def __del__( self ):
        pass

    def init(self):
        logger.write('error', '[' + self.workId +'] <'+ self.taskName +'> ********任务开始********')
        self.log('********任务开始********')

        communicate.set(self.workId, 'run', 'true')
        communicate.set(self.workId, 'smsvcode', None)

    def run(self):
        for x in self.tasks:

            try:
                self.task =  self.parseTask()
            except Exception as e:
                self.logError('请检查数据格式是否正确')

            self.init()

            # self.main()
            try:
                self.main()
                self.log('任务结束：' + str(self.data))
            except Exception as e:
                self.recordRetry('意外错误：' + str(e))

    def main(self):
        pass

    def getVcodeBySrc(self, vcodeSrc):
        self.log('****打码****')
        http = utils.httplib.Httplib()
        img = http.get(vcodeSrc, binary=True)
        data = {'workId': self.workId, 'img': img}
        return func.wait(self.workId, 4, lambda data: func.getVcode(data['workId'], data['img']), data)

    def getSmsVcode(self, phoneNum):
        self.log('****读取短信验证码****')
        smsVcode = func.wait(self.workId, 60, lambda data: func.getSmsVcode(self.workId, phoneNum))
        if not smsVcode:
            self.recordRetry('收取短信验证码超时')
        else:
            self.log(smsVcode)

        return smsVcode

    def reportVcodeError(self, imgId):
        self.log('反馈打码错误')
        func.reportVcodeError(self.workId, imgId)

    def log(self, text):
        logger.write(self.workId, text)

    def screenshot(self, name):
        self.driver.save_screenshot(LOG_DIR + self.workId + '_' + name + '.png')

    def waitElement(self, selector):
        self.wait(lambda data: self.find(selector) != None)
        return self.find(selector)

    def wait(self, doing, data=None):
        return func.wait(self.workId, 10, doing, data)

    def execJs(self, script):
        self.driver.execute_script(script)

    def sleep(self, second=0.6):
        time.sleep(second)
        # self.screenshot(time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time())))

    def find(self, selector):
        try:
            elements = self.driver.find_elements_by_css_selector(selector)
            if len(elements) > 0:
                return elements
            else:
                return None
        except:
            return None

    def logError(self, text):
        self.log(text)
        logger.write('error', '\n')
        logger.write('error', '[' + self.workId +'] ' + ' <' + text + '>\n' + self.dataStr)
        self.screenshot(time.strftime('error_%Y-%m-%d-%H-%M-%S', time.localtime(time.time())))

    def recordRetry(self, text):
        logger.write('retry', self.dataStr, prefix='')
        self.logError('**请重试此条**' + text)

    def recordSuccess(self, text):
        self.log(text)
        logger.write('success', self.dataStr)

    def checkJs(self, condition):
        elementId = '__yang__' + md5(condition.encode()).hexdigest()

        if self.find('#' + elementId):
            return True
        else:
            self.execJs("if("+ condition +") {var __yang__node = document.createElement('div');__yang__node.id='"+ elementId +"';document.body.appendChild(__yang__node);}")
            self.sleep(0.3)
            if self.find('#' + elementId):
                return True
            else:
                return False
