# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import utils.logger

logDir = LOG_DIR

def write(workId, log, prefix=None):
    return utils.logger.write(logDir, workId, log, prefix)

def readRecent(workId, offset):
    return utils.logger.readRecent(logDir, workId, offset)
