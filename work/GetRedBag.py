# coding: utf-8

import time
import json
import random
import string

import urllib.parse

import work.Work
from work.Work import checkRun

from utils.httplib import Httplib
import utils.vcode

import configs.communicate

class GetRedBag(work.Work.Work):

    def __init__(self, workId, phoneNum, links, fetchVcode = True):
        super(GetRedBag, self).__init__(workId);

        self.__phoneNum = phoneNum
        self.__formName = ''.join(random.sample(string.ascii_letters+string.digits, 5))
        self.__formPassword = '66666666'
        self.__http = Httplib();
        self.__accountId = ''

        self.__links = links
        self.__fetchVcode = fetchVcode

        self.__lastVcode = None

    @checkRun
    def run(self):
        self.log(' ')
        self.log('手机号：'+ self.__phoneNum)

        for link in self.__links:
            if not self.isRun():
                break

            link = link.strip()
            if link == '':
                continue

            self.getRedBag(link);

    @checkRun
    def getRedBag(self, link):
        # if self.__fetchVcode:
        #     self.fetchVcode()

        self.log('链接：' + link)

        params = self.parseLink(link)
        accountId = params['accountId']
        redBagId = params['redBagId']

        http = Httplib()
        self.log('****查看红包详情****')
        resultStr = http.get('http://liuliang.easy8.com.cn/wdExternal/queryRedbagDetail?getState=0&redBagId='+ redBagId +'&accountId='+ accountId);
        result = json.loads(resultStr)

        self.log('查看红包详情：' + result['desc'])

        if result['status'] == '0000' and len(result['data']) > 0:
            self.log('流量：' + result['data'][0]['FLOW_SIZE'] + 'MiB')

            getResult = self.redBag(accountId, redBagId)
            if getResult['status'] == '0005':
                self.__lastVcode = None
                self.redBag(accountId, redBagId)


            if result['status'] != '0000':
                self.saveLink(link)
        else:
            self.log('红包不存在或已被领取')

    def redBag(self, accountId, redBagId):
        self.log('****领取红包****')

        if self.__lastVcode == None or self.__lastVcode == '':
            if self.__fetchVcode:
                self.fetchVcode()

            vcode = self.getVcode()
            if vcode == False:
                return

            self.__lastVcode = vcode
        else:
            vcode = self.__lastVcode

        http = Httplib()
        getResultStr =  http.post(
            'http://liuliang.easy8.com.cn/wdExternal/getRedbag/',
            'accountId='+ accountId +'&redBagId='+ redBagId +'&phoneNumber='+ self.__phoneNum +'&randomNumber='+ vcode +'&onOpenRegister=1'
        )

        getResult = json.loads(getResultStr)
        self.log('领取红包操作：' + getResult['desc'])

        return getResult

    def parseLink(self, link):
        self.log('****解析红包链接****')
        http = Httplib()
        http.get(link)
        realLink = http.response.geturl()
        self.log('原地址：' + realLink)
        query = urllib.parse.urlparse(realLink).query
        paramsQs = urllib.parse.parse_qs(query)
        params = {'redBagId': paramsQs['redBagId'][0], 'accountId': paramsQs['accountId'][0], 'realLink': realLink}
        # self.log(str(params))

        return params

    @checkRun
    def fetchVcode(self):
        '''发送验证码'''
        self.log('****发送验证码****')
        http = Httplib()
        url = 'http://liuliang.easy8.com.cn/wdExternal/getRandom?phoneNumber='+ self.__phoneNum +'&ot=5&accountName=&flowSize=&linkUrl='
        http.get(url)

    def getVcode(self):
        '''获取验证码'''
        self.log('****提取验证码****')
        flag = False
        vcode = None
        for c in range(1, 200):
            if not self.isRun():
                break

            vcode = utils.vcode.get(self.id, self.__phoneNum)

            if vcode:
                self.log(vcode)
                break

            self.log('*')
            time.sleep(1)
        return vcode

    def saveLink(self, link):
        with open('faillink.txt', 'a') as f:
            print(link, file=f)
