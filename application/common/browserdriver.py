# coding: utf-8
# cython: language_level=3, boundscheck=False
import re
import base64
import time
import json

from .__init__ import *

from . import main

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

class Browserdriver(main.Main):
    def __init__(self, workId='page'):
        super(main.Main, self).__init__(workId)

        self.logDir = LOG_DIR
        self.dataDir = DATA_DIR
        self.cacheDir = CACHE_DIR

        self.driver = None

    def setupPhantomJS(self, pjsBin, serviceArgs=None):
        dcap = dict(DesiredCapabilities.PHANTOMJS)
        # dcap["phantomjs.page.settings.loadImages"] = False
        dcap["phantomjs.page.settings.userAgent"] = (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2633.3 Safari/537.36"
        )

        if serviceArgs == None:
            serviceArgs = [
                '--disk-cache=true',
                '--disk-cache-path=' + self.cacheDir,
                '--web-security=false',
            ]

        self.driver = webdriver.PhantomJS(executable_path=pjsBin, desired_capabilities=dcap, service_args=serviceArgs)
        self.driver.command_executor._commands['executePhantomScript'] = ('POST', '/session/$sessionId/phantom/execute')
        self.driver.set_window_size(1920, 1920);
        self.driver.set_page_load_timeout(30);

        self.driver.implicitly_wait(30)
        self.verificationErrors = []
        self.accept_next_alert = True

    def executePhantomScript(self, script):
        self.driver.execute('executePhantomScript', {'script': script, 'args': []})

    def setupFirefox(self):
        self.driver = webdriver.Firefox()
        self.driver.implicitly_wait(30)
        self.verificationErrors = []
        self.accept_next_alert = True

    def getVcodeBySrc(self, vcodeSrc):
        self.recordLog('****打码****')
        http = utils.httplib.Httplib()
        img = http.get(vcodeSrc, binary=True)
        return self.getVcode(img)

    def getVcodeById(self, elementId):
        img = self.getImgByte(
            'document.getElementById("'+ elementId +'")',
            self.driver.find_element_by_id(elementId)
        )

        vcode = self.getVcode(img)
        if 'result' in vcode:
            self.recordLog('打码结果：' + vcode['result'])
            return vcode['result']
        else:
            self.recordLog('验证码错误' + str(vcode))
            return False

    def getImgByte(self, getimg, img):
        self.driver.execute_script('''
           var img = '''+ getimg +''';
           var canvas = document.createElement('canvas');
           canvas.width = img.width;
           canvas.height = img.height;
           canvas.getContext('2d').drawImage(img, 0, 0);
           img.src = canvas.toDataURL('image/png|gif|jpg');
        ''')

        base64Data = img.get_attribute('src').split(',', 1)[-1].strip()
        return base64.b64decode(base64Data.encode())

    def find(self, selector):
        try:
            elements = self.driver.find_elements_by_css_selector(selector)
            if len(elements) > 0:
                return elements[-1]
            else:
                return None
        except:
            return None
