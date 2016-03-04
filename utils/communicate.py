# coding: utf-8
# cython: language_level=3, boundscheck=False

from utils import storage

def get(dataDir, workId, key, default=None):
    file = dataDir + '/communicate_'+ workId +'.json'
    data = storage.read(file)

    if key not in data:
        return default
    else:
        return data[key]

def set(dataDir, workId, key, value):
    file = dataDir + '/communicate_'+ workId +'.json'
    data = storage.read(file)

    data[key] = value

    storage.write(file, data);

def clear(dataDir, workId):
    file = dataDir + '/communicate_'+ workId +'.json'
    data = storage.read(file)
    storage.write(file, {});
