# coding: utf-8
# cython: language_level=3, boundscheck=False

import utils.storage

def get(configFile, key, default = None):
    data = getAll(configFile)

    if key not in data:
        return default
    else:
        return data[key]

def getAll(configFile):
    return utils.storage.read(configFile)

def set(configFile, key, value):
    data = getAll(configFile)

    data[key] = value

    utils.storage.write(configFile, data);
