# coding: utf-8
#cython: language_level=3, boundscheck=False

import time
import json
import random
import string

import core.Work
from core.Work import checkRun

from utils.httplib import Httplib
import utils.vcode

import configs.communicate

class Register(core.Work.Work):

    def __init__(self, appName, workId, phoneNum, reg = True, getGift = True, makeRedBagLink = True, fetchVcode = True):
        super(Register, self).__init__(appName, workId)

        configs.communicate.set(self.appName, self.id, 'vcode', None)

        self.__phoneNum = phoneNum
        self.__formName = ''.join(random.sample(string.ascii_letters+string.digits, 5))
        self.__formPassword = '66666666'
        self.__http = Httplib();
        self.__accountId = ''

        self.__reg = reg
        self.__getGift = getGift
        self.__makeRedBagLink = makeRedBagLink
        self.__fetchVcode = fetchVcode

    @checkRun
    def run(self):
        self.log(' ')
        self.log('手机号：'+ self.__phoneNum)

        if self.__reg:
            self.reg()

        if self.__getGift:
            self.getGift()

        if self.__makeRedBagLink:
            self.makeRedBagLink()

    @checkRun
    def reg(self):
        if self.__fetchVcode:
            self.fetchVcode()

        self.log('****开始注册****')

        vcode = self.getVcode()
        print(vcode)

        http = Httplib()

        vResult = http.post(
            'http://liuliang.easy8.com.cn/wdExternal/registerAccountInfo',
            'phoneNumber='+ self.__phoneNum +'&randomNumber='+ vcode +'&ot=1&accountName='+ self.__formName +'&accountPwd=' + self.__formPassword
        )

        if vResult:
            try:
                result = json.loads(vResult)
            except:
                self.log('注册出错')
                self.log(vResult)

                return False;
            else:
                self.log(result['desc'])
                return result['status'] == '0000'
        else:
            self.log('注册出错')
            self.log(vResult)

            return False

    @checkRun
    def fetchVcode(self):
        '''发送验证码'''
        self.log('****发送验证码****')
        http = Httplib()
        url = 'http://liuliang.easy8.com.cn/wdExternal/getRandom?phoneNumber='+ self.__phoneNum +'&ot=1&accountName=&flowSize=&linkUrl='
        http.get(url)

    def getVcode(self):
        '''获取验证码'''
        self.log('****提取验证码****')
        flag = False
        vcode = None
        for c in range(1, 200):
            if not self.isRun():
                break

            vcode = utils.vcode.get(self.appName, self.id, self.__phoneNum)

            if vcode:
                self.log(vcode)
                break

            self.log('*')
            time.sleep(1)
        return vcode

    @checkRun
    def login(self):
        self.log('****登录账户****')

        resultStr = self.__http.post('http://liuliang.easy8.com.cn/wdExternal/login/'+ self.__phoneNum +'/'+ self.__formPassword +'?randomCode=&count=0')
        result = json.loads(resultStr)

        self.log(result['desc'])

        if result['status'] == '0000':
            self.__accountId = result['data'][0]['ACCOUNT_ID']

            self.log('ACCOUNT_ID: ' + self.__accountId)

            return True
        else:
            return False

    @checkRun
    def getGift(self):
        self.log('****兑换积分500=>50MiB****')
        url = 'http://liuliang.easy8.com.cn/flowGasStn/saveAccountGift/Q00484528/10005/500.jsonp'

        self.login()
        if self.__http != None:
            resultStr = self.__http.get(url);
            result = json.loads(resultStr)

            self.log(result['desc'])

    @checkRun
    def makeRedBagLink(self):
        self.login()
        http = self.__http
        if http != False and http != None:
            self.log('****创建红包链接****')

            if self.__fetchVcode:
                self.fetchVcode()

            resultStr = http.post(
                'http://liuliang.easy8.com.cn/wdExternal/madeRedBagLink/',
                {
                    'accountId': self.__accountId,
                    'levelId': 'G00100',
                    'count': '1',
                    'price': '0',
                    'sendType': '1',
                    'phoneNum': '',
                }
            )
            result = json.loads(resultStr)

            self.log(result['desc']);
            if result['status'] == '0000':

                vResultStr = http.post(
                    'http://liuliang.easy8.com.cn/wdExternal/issueRedbag',
                    {
                        'accountId': self.__accountId,
                        'levelId': 'G00100',
                        'count': '1',
                        'price': '0',
                        'sendType': '1',
                        'phoneNum': '',
                        'shortLink': result['data']['suffix'],
                        'sendQd': '2',
                    }
                )
                vResult = json.loads(vResultStr)
                self.log(vResult['desc'])
                if vResult['status'] == '0000':
                    link = result['data']['shortLink']
                    self.log(link)
                    self.saveLink(link)

    def saveLink(self, link):
        file = 'data/'+ self.appName +'/link.txt';
        with open(file, 'a') as f:
            print(link, file=f)
