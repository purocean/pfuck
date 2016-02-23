# coding: utf-8

from utils import storage

def get(appName, workId, key):
    file = appName + '/communicate_'+ workId +'.json'
    data = storage.read(file)

    if key not in data:
        return None
    else:
        return data[key]

def set(appName, workId, key, value):
    file = appName + '/communicate_'+ workId +'.json'
    data = storage.read(file)

    data[key] = value

    storage.write(file, data);

def clear(appName, workId):
    file = appName + '/communicate_'+ workId +'.json'
    data = storage.read(file)
    storage.write(file, {});
