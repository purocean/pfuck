# coding: utf-8
# cython: language_level=3, boundscheck=False

import re
import time
import json

from .__init__ import *

from application.common.browserdriver import Browserdriver

class Main(Browserdriver):
    def __init__(self, workId='page'):
        super(Browserdriver, self).__init__(workId);

        self.logDir = LOG_DIR
        self.dataDir = DATA_DIR
        self.cacheDir = CACHE_DIR

        self.driver = None

    def __del__(self):
        if self.driver != None:
            self.driver.quit()

    def init(self):
        self.setCommunicate('run', 'true')
        self.setCommunicate('smsvcode', None)

        self.tasks = self.getTasks()
        self.taskStr = ''
        self.task = {}

    def run(self):
        self.init()

        for x in self.tasks:
            self.taskStr = re.sub(re.compile("\s+"), ',', x)

            try:
                pool = self.taskStr.split(',')
                self.task['user'] = pool[0]
                self.task['password'] = pool[1]
            except Exception as e:
                self.recordError('请检查数据格式是否正确', self.taskStr)
                os._exit()

            # self.setupPhantomJS(BIN_DIR + 'pjs.exe')
            # self.main()
            try:
                self.recordLog('****初始化****')
                self.setupPhantomJS(BIN_DIR + 'pjs.exe')
                # self.setupFirefox()

                self.main()
                self.driver.quit()
            except Exception as e:
                self.recordRetry('意外错误：' + str(e), self.taskStr)

        self.recordLog('****任务结束****')

    def main(self):
        self.recordLog('****注册任务****')
        self.recordLog(str(self.task))
        if not self.tryDo(lambda: self.register(), '注册', 3):
            self.recordRetry('尝试三次注册失败')

    def register(self):
        driver = self.driver
        driver.get("https://reg.gome.com.cn/register/index/person")

        driver.find_element_by_id("name").clear()
        driver.save_screenshot('13.png')
        driver.find_element_by_id("name").send_keys("w" + self.task['user'])
        driver.save_screenshot('14.png')
        driver.find_element_by_id("password").clear()
        driver.save_screenshot('1.png')
        driver.find_element_by_id("password").send_keys(self.task['password'])
        driver.save_screenshot('2.png')
        driver.find_element_by_id("confirmPassword").clear()
        driver.save_screenshot('3.png')
        driver.find_element_by_id("confirmPassword").send_keys(self.task['password'])
        driver.save_screenshot('4.png')
        driver.find_element_by_id("mobile").clear()
        driver.save_screenshot('5.png')
        driver.find_element_by_id("mobile").send_keys(self.task['user'])
        driver.save_screenshot('6.png')
        driver.find_element_by_id("authenticCode").clear()
        driver.save_screenshot('7.png')

        self.recordLog('****打码中****')
        driver.find_element_by_id("authenticCode").send_keys(self.getVcodeById('codeRefreshControlCenter'))
        driver.save_screenshot('8.png')
        driver.find_element_by_id("getVerifyCode").click()
        driver.save_screenshot('9.png')

        driver.find_element_by_id("verifyCode").clear()
        driver.save_screenshot('10.png')
        driver.find_element_by_id("verifyCode").send_keys(self.waitSmsVcode(self.task['user']))
        driver.save_screenshot('11.png')
        driver.find_element_by_id("registerNow").click()
        driver.save_screenshot('12.png')

        self.recordLog('****注册中****')
        time.sleep(3)
        if 'oneActive.do' in driver.current_url:
            self.recordSuccess(self.find('.success-content').text, self.taskStr)
        else:
            self.recordError('注册失败', self.taskStr)

        return True

    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException as e: return False
        return True

    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException as e: return False
        return True

    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True

    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)
