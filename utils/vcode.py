# coding: utf-8
#cython: language_level=3, boundscheck=False

import os
import re
import csv
import json

import configs.communicate
import configs.common
import utils.log

smsFile = configs.common.get('smsFile', 'sms.txt')

def get(appName, workId, phoneNumber):
    vcodeFromCommunicate = configs.communicate.get(appName, workId, 'vcode')

    if vcodeFromCommunicate != None and vcodeFromCommunicate != '':
        configs.communicate.set(appName, workId, 'vcode', None)
        return vcodeFromCommunicate;
    else:
        return getFromSmsFile(appName, workId, phoneNumber)

def getFromSmsFile(appName, workId, phoneNumber):
    if not os.path.isfile(smsFile):
        utils.log.write(appName, workId, '错误：文件 ' + smsFile + ' 不存在！')
        return False

    lastVcode = configs.communicate.get(appName, workId, 'lastVcode')

    with open(smsFile, 'r') as f:
        reader = list(csv.reader(f))

    flag = False
    for x in reader[:-50:-1]:
        if x[3] != phoneNumber:
            continue

        vcode = re.findall(r'\d{4,8}', x[4])
        if vcode:
            if vcode[0] != lastVcode:
                flag = True
            break

    if flag:
        configs.communicate.set(appName, workId, 'lastVcode', vcode[0])

        return vcode[0]
    else:
        return False
