# coding: utf-8
# cython: language_level=3, boundscheck=False

import time, os

def write(logDir, workId, log, prefix=None):
    if prefix == None:
        log = '[' + workId + '] ' + time.strftime('[%Y-%m-%d %H:%M:%S] ', time.localtime(time.time())) + log
    else:
        log = prefix + log

    print(log)

    with open(logDir + workId + '.log', 'a') as f:
        print(log, file=f)

def readRecent(logDir, workId, offset):
    file = logDir + workId + '.log'
    if not os.path.isfile(file):
        return {'logs': ['无日志文件'], 'offset': offset}

    lines = []
    with open(file, 'r') as f:
        lines = f.readlines()

    if offset < 0:
        logs = lines[-8:]
        offset = len(lines) - len(logs)
    else:
        logs = lines[offset:]

    return {'logs': logs, 'offset': offset}
