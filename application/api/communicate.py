# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

import utils.communicate

dataDir = DATA_DIR

def get(workId, key, default = None):
    return utils.communicate.get(dataDir, workId, key, default)

def set(workId, key, value):
    return utils.communicate.set(dataDir, workId, key, value)

def clear(workId):
    return utils.communicate.clear(workId)
