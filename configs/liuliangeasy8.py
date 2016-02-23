# coding: utf-8

import os

APP_NAME = 'liuliangeasy8'
APP_TITLE = '易赚流量'

CONFIG_FILE = APP_NAME + '/config.json'

def get(key, default = None):
    data = storage.read(CONFIG_FILE)

    if key not in data:
        return default
    else:
        return data[key]

def set(key, value):
    data = storage.read(CONFIG_FILE)

    data[key] = value

    storage.write(CONFIG_FILE, data);
