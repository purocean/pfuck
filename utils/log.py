# coding: utf-8

import time

import configs.main

logPath = configs.main.LOG_PATH

def write(workId, log):
    log = '#' + workId + '*' + time.strftime('%Y-%m-%d %H:%M:%S >··',time.localtime(time.time())) + log

    print(log)

    with open(logPath + workId + '.log', 'a') as f:
        print(log, file=f)

def readRecent(workId, offset):
    lines = []
    with open(logPath + workId + '.log', 'r') as f:
        lines = f.readlines()

    if offset < 0:
        logs = lines[-8:]
        offset = len(lines) - len(logs)
    else:
        logs = lines[offset:]

    return {'logs': logs, 'offset': offset}
