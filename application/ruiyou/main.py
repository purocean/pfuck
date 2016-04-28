# coding: utf-8
# cython: language_level=3, boundscheck=False

import re
import time
import json

from .__init__ import *

from application.common.main import Main

class Main(Main):
    def __init__(self, workId='page'):
        super(Main, self).__init__(workId);

        self.logDir = LOG_DIR
        self.dataDir = DATA_DIR
        self.cacheDir = CACHE_DIR

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
                self.task['phoneNum'] = pool[0]
                self.task['code'] = pool[1]
            except Exception as e:
                self.recordError('请检查数据格式是否正确', self.taskStr)
                os._exit()

            # self.main()
            try:
                self.recordLog('****初始化****')

                self.main()
            except Exception as e:
                self.recordRetry('意外错误：' + str(e), self.taskStr)

        self.recordLog('****任务结束****')

    def main(self):
        self.http = utils.httplib.Httplib(headers=[
            ('Content-Type', 'application/json; charset=utf-8'),
            ('Host', 'app.zhshjia.com'),
            ('User-Agent', 'Dalvik/1.6.0 (Linux; U; Android 4.4.4; XXEmulator Build/KTU84Q)'),
            ('Connection', 'keep-alive'),
            ('Accept-Encoding', 'gzip, deflate'),
        ])

        self.token = ''
        self.encodeToken = ''

        self.recordLog(str(self.task))

        # self.register()
        self.login()
        # self.gift()
        self.sign()
        self.openbox()
        # self.code()

    def register(self):
        self.recordLog('*****注册*****')
        phoneNum = self.task['phoneNum']
        if not self.sendVcode(phoneNum):
            self.recordLog('发送短信验证码错误')
            return

        smsvcode = self.waitSmsVcode(phoneNum, r'\d{4,8}')
        resultStr = self.http.post('http://app.zhshjia.com/app/user/setregpwd.action', json.dumps({
            "actionCd": "A001",
            "invitationCd": self.task['code'],
            "code": smsvcode,
            "mobilePhone": phoneNum,
            "password": "wanzi2"
        }))

        self.recordLog(resultStr)
        result = json.loads(resultStr)
        if not result['success']:
            self.recordLog('注册失败！')
        else:
            self.recordLog('注册成功！')

    def login(self):
        self.recordLog('*****登录*****')
        resultStr = self.http.post('http://app.zhshjia.com/app/user/userlogin.action', json.dumps({
            "mobilePhone": self.task['phoneNum'],
            "password": "wanzi2"
        }), headers={
            'Content-Type': 'application/json; charset=utf-8',
        })

        self.recordLog(resultStr)
        result = json.loads(resultStr)
        if not result['success']:
            self.recordRetry('登录失败！')
        else:
            self.recordLog('登录成功！')
            self.token = result['data']['token']
            self.encodeToken = result['data']['encoderToken']

    def sign(self):
        self.recordLog('*****签到*****')
        self.http.get('http://mkt.zhshjia.com/prom/promNewUser.do', {
            "token": self.token,
        })

        resultStr = self.http.post('http://mkt.zhshjia.com/signIn/doSign?token=' + self.encodeToken)
        self.recordLog(resultStr)
        result = json.loads(resultStr)
        if not result['result']:
            self.recordLog('签到失败')
        else:
            self.recordLog('签到成功！')

    def openbox(self):
        self.recordLog('*****开宝箱*****')
        resultStr = self.http.get('http://mkt.zhshjia.com/grabRedPckt/toRedPcktHome.do', {
            "token": self.token,
        })

        if 'var totalChance =' in str(resultStr):
            chance = int(re.compile(r'var totalChance = (\d*?);').findall(str(resultStr))[0])
            if chance > 0:
                for x in range(chance):
                    self.recordLog('第【' + str(x + 1) + '】次开宝箱')
                    time.sleep(1)
                    resultStr = self.http.post('http://mkt.zhshjia.com/grabRedPckt/doGrabRedPack', {
                        "token": self.token,
                        "chance": '1'
                    })
                    self.recordLog(resultStr)
                    result = json.loads(resultStr)
                    if not result['success']:
                        self.recordLog('开宝箱失败')
                    else:
                        self.recordLog('开宝箱成功！')
            else:
                self.recordLog('没有开宝箱机会')
        else:
            self.recordLog('打开宝箱页面失败')


    def gift(self):
        self.recordLog('*****新手礼包*****')
        self.http.get('http://mkt.zhshjia.com/prom/promNewUser.do', {
            "token": self.token,
        })

        resultStr = self.http.post('http://mkt.zhshjia.com/prom/fillData?token=' + self.encodeToken, 'nickname=yangzi2&birthday=2016-03-23&sex=1')
        self.recordLog(resultStr)
        if 'true' not in str(resultStr):
            self.recordLog('填写资料失败')
        else:
            self.recordLog('填写资料成功！')

        resultStr = self.http.post('http://app.zhshjia.com/app/customer/getDetail.action' , json.dumps({
            'token': self.token
        }))
        self.recordLog(resultStr)
        result = json.loads(resultStr)
        if not result['success']:
            self.recordLog('获取详情失败')
        else:
            self.recordLog('获取详情成功！')

        resultStr = self.http.post('http://mkt.zhshjia.com/prom/taskDone?token=' + self.encodeToken)
        self.recordLog(resultStr)
        if 'true' not in str(resultStr):
            self.recordLog('新手任务失败')
        else:
            self.recordLog('新手任务成功！')

    def code(self):
        resultStr = self.http.get('http://mkt.zhshjia.com/userProm/userPromShare', {
            "token": self.token,
        })

        if 'var invitationCd=' in str(resultStr):
            code = re.compile(r'var invitationCd="(.*?)"').findall(str(resultStr))[0]
            self.recordSuccess('成功！', self.task['phoneNum'] + ',' + code)
        else:
            self.recordRetry('邀请码失败')

    def sendVcode(self, phoneNum):
        self.recordLog('*****发送短信验证*****')
        resultStr = self.http.post('http://app.zhshjia.com/app/user/getcode.action', json.dumps({
            "mobilePhone": phoneNum,
            "actionCd": "A001",
            "appName": "瑞优生活"
        }))

        self.recordLog(resultStr)
        result = json.loads(resultStr)
        return result['success']
