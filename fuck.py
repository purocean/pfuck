# coding: utf-8

import gevent
from gevent import monkey

import bottle
import webbrowser

import configs.main
import routers.main
import routers.static

monkey.patch_all()

port = '8099'

webbrowser.open("http://127.0.0.1:" + port)

bottle.debug(configs.main.DEBUG)
bottle.run(port=port, server='gevent')
