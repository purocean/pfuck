# coding: utf-8

import time

import configs.communicate

from utils import log

class Work:
    def __init__(self, workId):
        self.id = workId

        configs.communicate.clear(self.id)

    def checkRun(self):
        return configs.communicate.get(self.id, 'run') == 'false';

    def log(self, *args, **kwgs):
        buf = "".join(args)
        if 'prefix' not in kwgs:
            buf = '#' + self.id + '*' + time.strftime('%Y-%m-%d %H:%M:%S >··',time.localtime(time.time())) + buf
        else:
            del kwgs['prefix']

        log.write(self.id, buf)
