# coding: utf-8
# cython: language_level=3, boundscheck=False

from .__init__ import *

configFile = DATA_DIR + 'config.json'

def get(key, default = None):
    return utils.config.get(configFile, key, default)

def getAll():
    return utils.config.getAll(configFile)

def set(key, value):
    return utils.config.set(configFile, key, value)
