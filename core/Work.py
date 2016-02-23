# coding: utf-8
#cython: language_level=3, boundscheck=False

from utils import log
import configs.communicate

def checkRun(fn):
    def wrapper(self, *args, **kwds):
        if self.isRun():
            fn(self, *args, **kwds)
    return wrapper

class Work:
    def __init__(self, appName, workId):
        self.id = workId
        self.appName = appName

        configs.communicate.set(self.appName, self.id, 'run', 'true')

    def isRun(self):
        return configs.communicate.get(self.appName, self.id, 'run') != 'false'

    def log(self, *args, **kwgs):
        buf = "".join(args)
        log.write(self.appName, self.id, buf)
