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

class Book():
    def __init__(self, workId, mdata):
        self.workId = workId
        self.mdata = mdata
        self.data = {}
        self.dataStr = ''

        self.driverEngine = 'PhantomJS'
        # self.driverEngine = 'Chrome'

        self.pjsBin = BIN_DIR + 'pjs.exe'
        self.chromeBin = BIN_DIR + 'chromedriver.exe'

        self.driver = None
        self.orderPassword = 'wanzi1'
        self.log('------------------------------------------------------------')

    def __del__( self ):
         self.driver.quit()

    def init(self):
        logger.write('error', '[' + self.workId +'] <'+ self.data['user'] +'> ********任务开始********')
        self.log('****初始化****')

        communicate.set(self.workId, 'run', 'true')
        communicate.set(self.workId, 'smsvcode', None)

        dcap = dict(DesiredCapabilities.PHANTOMJS)
        dcap["phantomjs.page.settings.loadImages"] = False
        dcap["phantomjs.page.settings.userAgent"] = (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2633.3 Safari/537.36"
        )

        serviceArgs = [
            # '--disk-cache=true',
            # '--disk-cache-path=' + CACHE_DIR,
        ]

        if self.driverEngine == 'PhantomJS':
            self.driver = webdriver.PhantomJS(executable_path=self.pjsBin, desired_capabilities=dcap, service_args=serviceArgs)
            self.driver.command_executor._commands['executePhantomScript'] = ('POST', '/session/$sessionId/phantom/execute')
            self.driver.execute('executePhantomScript', {'script': open(BIN_DIR + 'preload.js').read(), 'args': []})

        if self.driverEngine == 'Chrome':
            self.driver = webdriver.Chrome(executable_path=self.chromeBin, desired_capabilities=dcap, service_args=serviceArgs)

        self.driver.set_window_size(1920, 1920);
        self.driver.set_page_load_timeout(15);

    def run(self):
        for x in self.mdata:
            self.dataStr = re.sub(re.compile("\s+"), ',', x)

            self.data = {}

            try:
                pool = self.dataStr.split(',')
                self.data['user'] = pool[0]
                self.data['pwd'] = pool[1]
                self.data['spuId'] = pool[2]
                self.data['typeId'] = pool[3]
                self.data['addressP'] = pool[4]
                self.data['addressC'] = pool[5]
                self.data['addressA'] = pool[6]
                self.data['address'] = pool[7]
                self.data['addressPhone'] = pool[0]
                self.data['addressConsignee'] = pool[8]
                self.data['orderPassword'] = pool[9]
            except Exception as e:
                self.recordError('请检查数据格式是否正确')

            self.init()

            # self.main()
            try:
                self.main()
                self.log(str(self.data))
            except Exception as e:
                self.recordRetry('意外错误：' + str(e))

            self.driver.quit()

    def main(self):
        isLogin = func.wait(self.workId, 3, lambda data: self.login())
        if isLogin == False:
            self.recordRetry('三次尝试登录失败，放弃')
            self.driver.quit()
        else:
            if self.data['orderPassword'] == '__empty__':
                self.setOrderPassword()

            self.addAddress()
            self.book()

    def book(self):
        self.log('****开始下单****')
        self.driver.get('http://goods.qbao.com/info/product-detail.htm?spuId='+ self.data['spuId'])
        self.waitElement('#buynow')
        self.wait(lambda data: self.checkJs('$'))
        self.execJs('$(".proinfo-buytype ul li:eq('+str(int(self.data['typeId']) - 1)+')").click()')
        self.sleep()
        self.execJs('$("#buynow").click()')
        self.wait(lambda data: self.checkJs('$'))
        self.sleep(2)
        self.execJs('$("#creatOrder").click()')
        self.wait(lambda data: self.checkJs('$'))
        self.sleep(3)
        self.execJs('$(".pay_form_inf>*").click()')
        self.sleep(2)
        self.execJs('$("#getCode").click()')
        self.execJs('$("#pwd").val("'+ self.data['orderPassword'] +'")')

        smsvcode = self.getSmsVcode(self.data['user'])
        if not smsvcode:
            return False

        self.execJs('$("#mobileCode").val("'+ smsvcode +'")')
        self.execJs('$("#payButton").click()')
        self.log('支付中……')
        self.sleep(0.7)
        errtipElement = self.find('#error_tip')
        if errtipElement and errtipElement[0].text:
            text = errtipElement[0].text
            if '没有设置支付密码' in text:
                self.setOrderPassword()
                self.book()
            elif '宝币余额不足' in text:
                self.log(text)
                if self.closeTask() != False:
                    self.book()
            else:
                self.recordError(text)
        else:
            self.sleep(3)
            self.screenshot(time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time())))
            text = self.find('.pay_result_inf h2')[0].text
            if '成功':
                self.recordSuccess(text)

    def addAddress(self):
        self.log('****增加地址****')
        self.driver.get('http://oc.qbao.com/portle/address/add.html')
        self.sleep(1)
        self.execJs('$("#p .input").click()')
        self.sleep(1)
        self.execJs('$(".qb-options:visible li:contains('+ self.data['addressP'] +')").click()')
        self.sleep(1)
        self.execJs('$("#c .input").click()')
        self.sleep(1)
        self.execJs('$(".qb-options:visible li:contains('+ self.data['addressC'] +')").click()')
        self.sleep(1)
        self.execJs('$("#a .input").click()')
        self.sleep(1)
        self.execJs('$(".qb-options:visible li:contains('+ self.data['addressA'] +')").click()')
        self.execJs('$("#address").val("'+ self.data['address'] +'")')
        self.execJs('$("#consignee").val("'+ self.data['addressConsignee'] +'")')
        self.execJs('$("#phoneNum").val("'+ self.data['addressPhone'] +'")')
        self.sleep()
        self.execJs('$("#isDefault").click()')
        self.sleep()
        self.execJs('$(".btn-r").click()')
        self.sleep()

    def login(self):
        self.driver.get("https://passport.qbao.com/cas/qianbaoLogin?service=http%3A%2F%2Fuser.qbao.com%2Fj_spring_cas_security_check")
        self.execJs('updateImage()')
        self.log('****登录账户****')
        user = self.data['user']
        pwd = self.data['pwd']
        self.log(user + ' : ' + pwd)

        vcodeSrc = self.driver.find_element_by_id('identifyImage').get_attribute('src')
        vcode = self.getVcode(vcodeSrc)
        if 'result' not in vcode:
            return False

        self.log('登录中……')
        self.sleep()
        self.driver.find_element_by_id('username').send_keys(user)
        self.driver.find_element_by_id('password').send_keys(pwd)
        self.driver.find_element_by_id('captcha').send_keys(vcode['result'])
        self.driver.find_element_by_id('submitForm').click()
        self.sleep()
        if self.find('#common_errors'):
            text = self.find('#common_errors')[0].text
            self.log(text)
            if '密码错误' in text:
                self.recordError(text)
                return None
            if '验证码不正确' in text:
                self.reportVcodeError(vcode['id'])
            return False
        elif self.find('#__success__'):
            self.log('登录成功！')
            return True
        else:
            self.log('登录错误！')
            return False

    def setOrderPassword(self):
        self.log('****设置交易密码****')
        self.driver.get("https://user.qbao.com/usercenter/setOrChangeTradePwd.html")
        self.log('*')
        self.sleep(1)
        self.execJs('$("#getVCode").click()')
        self.sleep()
        vcodeSrc = self.find('#img_security_code_4_rebing')[0].get_attribute('src')
        vcode = self.getVcode(vcodeSrc)
        if not vcode:
            self.log('打码失败！')
            return False

        self.find('#img_security_code')[0].send_keys(vcode['result'])
        self.sleep(1)

        text = self.find('#img_vcode_msg')[0].text
        self.log(text)
        if '验证码错误' in text:
            self.reportVcodeError(vcode['id'])
            return False

        self.execJs('$("#tool-btn").click()')
        smsVcode = self.getSmsVcode(self.data['user'])
        if not smsVcode:
            return False

        self.find('#user_vCode')[0].send_keys(smsVcode)
        self.execJs('gotoNextStep()')
        self.sleep(2)

        self.find('#newPwd')[0].send_keys(self.orderPassword)
        self.find('#confirmNewPwd')[0].send_keys(self.orderPassword)
        self.execJs('$("#setPwdBtn").click()')
        self.sleep(2)
        self.log(self.find('.tipBig h2')[0].text)
        self.data['orderPassword'] = self.orderPassword

    def closeTask(self):
        self.log('****关闭任务****')
        self.driver.get("http://www.qbao.com/task/userTaskInProcess.html")
        self.log('*')
        self.sleep(1)
        if not self.find('.stoptaskBtn'):
            self.recordError('宝币不足，没有可以关闭的任务')
            return False

        self.find('.stoptaskBtn')[0].click()
        self.sleep(1)
        if '尚未设置交易密码' in self.find('.stopTask-desc')[0].text:
            self.setOrderPassword()
            return self.closeTask()

        self.find('#tradePwd')[0].send_keys(self.data['orderPassword'])

        self.execJs('confirmCloseAdvUserTask()')
        self.log('关闭中……')
        self.sleep(2)
        self.log(self.find('.u2_tipsOk')[0].text)

    def getVcode(self, vcodeSrc):
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

    def recordError(self, text):
        self.log(text)
        logger.write('error', '\n')
        logger.write('error', '[' + self.workId +'] ' + ' <' + text + '>\n' + self.dataStr)
        self.screenshot(time.strftime('error_%Y-%m-%d-%H-%M-%S', time.localtime(time.time())))

    def recordRetry(self, text):
        logger.write('retry', self.dataStr, prefix='')
        self.recordError('**请重试此条**' + text)

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
