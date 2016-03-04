# coding: utf-8
# cython: language_level=3, boundscheck=False

import os
import json

def read(file):
    data = {};

    if os.path.isfile(file):
        with open(file, 'r') as f:
            data = json.load(f)
    else:
        write(file, data)

    return data

def write(file, data):
    with open(file, 'w') as f:
        json.dump(data, f)
