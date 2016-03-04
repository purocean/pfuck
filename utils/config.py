# coding: utf-8
# cython: language_level=3, boundscheck=False

import utils.storage

def get(dataDir, key, default = None):
    data = getAll(dataDir)

    if key not in data:
        return default
    else:
        return data[key]

def getAll(dataDir):
    return utils.storage.read(dataDir + 'config.json')

def set(dataDir, key, value):
    data = getAll(dataDir)

    data[key] = value

    utils.storage.write(dataDir + 'config.json', data);
