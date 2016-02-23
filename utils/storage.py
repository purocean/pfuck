# coding: utf-8

import os
import json

import configs.common

dataPath = os.getcwd() + '/data/'

def read(fileName):
    file = dataPath + fileName
    data = {};

    if os.path.isfile(file):
        with open(file, 'r') as f:
            data = json.load(f)
    else:
        write(fileName, data)

    return data

def write(fileName, data):
    file = dataPath + fileName

    with open(file, 'w') as f:
        json.dump(data, f)
