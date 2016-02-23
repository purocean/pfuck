# coding: utf-8

from utils import storage

configFile = 'common/config.json'

def get(key, default = None):
    data = storage.read(configFile)

    if key not in data:
        return default
    else:
        return data[key]

def set(key, value):
    data = storage.read(configFile)

    data[key] = value

    storage.write(configFile, data);
