# coding: utf-8
# cython: language_level=3, boundscheck=False

import os
import time
import json

import utils.config
import utils.file
import utils.httplib
import utils.logger
import utils.storage
import utils.communicate
import vendors.smsvcode

APP_NAME = 'guomei'
APP_TITLE = '国美'

TPL_DIR = os.getcwd() + '/application/' + APP_NAME + '/tpl/'
LOG_DIR = os.getcwd() + '/application/' + APP_NAME + '/log/'
DATA_DIR = os.getcwd() + '/application/' + APP_NAME + '/data/'
BIN_DIR = os.getcwd() + '/bin/'
CACHE_DIR = os.getcwd() + '/cache/'
