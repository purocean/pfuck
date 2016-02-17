# coding: utf-8

import configs.communicate

from utils import log

def checkRun(fn):
    def wrapper(self, *args, **kwds):
        if self.isRun():
            fn(self, *args, **kwds)
    return wrapper

class Work:
    def __init__(self, workId):
        self.id = workId

        configs.communicate.set(self.id, 'run', 'true')
        configs.communicate.set(self.id, 'vcode', None)

    def isRun(self):
        return configs.communicate.get(self.id, 'run') != 'false'

    def log(self, *args, **kwgs):
        buf = "".join(args)
        log.write(self.id, buf)
