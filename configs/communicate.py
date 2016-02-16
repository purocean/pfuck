# coding: utf-8

from utils import storage

def get(workId, key):
    file = 'communicate_'+ workId +'.json'
    data = storage.read(file)

    if key not in data:
        return None
    else:
        return data[key]

def set(workId, key, value):
    file = 'communicate_'+ workId +'.json'
    data = storage.read(file)

    data[key] = value

    storage.write(file, data);

def clear(workId):
    file = 'communicate_'+ workId +'.json'
    data = storage.read(file)
    storage.write(file, {});
