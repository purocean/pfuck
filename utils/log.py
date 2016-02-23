# coding: utf-8

import os
import time

import configs.common

logPath = os.getcwd() + '/log/'

def write(appName, workId, log):
    log = '#' + workId + '*' + time.strftime('%Y-%m-%d %H:%M:%S >··',time.localtime(time.time())) + log

    print(log)

    with open(logPath + appName + '/' + workId + '.log', 'a') as f:
        print(log, file=f)

def readRecent(appName, workId, offset):
    lines = []
    with open(logPath + appName + '/' + workId + '.log', 'r') as f:
        lines = f.readlines()

    if offset < 0:
        logs = lines[-8:]
        offset = len(lines) - len(logs)
    else:
        logs = lines[offset:]

    return {'logs': logs, 'offset': offset}
