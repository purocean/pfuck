# coding: utf-8
import os
import csv
import json

import configs.communicate
import configs.custom
import utils.log

smsFile = configs.custom.get('smsFile', 'sms.txt')

def get(workId, phoneNumber):
    vcodeFromCommunicate = configs.communicate.get(workId, 'vcode')

    if vcodeFromCommunicate:
        configs.communicate.set(workId, 'lastVcode', vcodeFromCommunicate)
        return vcodeFromCommunicate;
    else:
        return getFromSmsFile(workId, phoneNumber)

def getFromSmsFile(workId, phoneNumber):
    if not os.path.isfile(smsFile):
        utils.log.write(workId, '错误：文件 ' + smsFile + ' 不存在！')
        return False

    lastVcode = configs.communicate.get(workId, 'lastVcode')

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
        configs.communicate.set(workId, 'lastVcode', vcode[0])

        return vcode[0]
    else:
        return False
