import os
import time
import json

# from application import common as app
import utils.config
import utils.file
import utils.httplib
import utils.logger
import utils.storage
import utils.communicate
import vendors.smsvcode


APP_NAME = 'ruiyou'
APP_TITLE = '瑞优'

TPL_DIR = os.getcwd() + '/application/' + APP_NAME + '/tpl/'
LOG_DIR = os.getcwd() + '/application/' + APP_NAME + '/log/'
DATA_DIR = os.getcwd() + '/application/' + APP_NAME + '/data/'
BIN_DIR = os.getcwd() + '/bin/'
CACHE_DIR = os.getcwd() + '/cache/'
