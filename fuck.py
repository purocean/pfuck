# coding: utf-8

import gevent
from gevent import monkey

import bottle
import webbrowser

import routers.static
import routers.home

import routers.liuliangeasy8

monkey.patch_all()

port = '8099'

webbrowser.open("http://127.0.0.1:" + port)

bottle.debug(True)
bottle.run(port=port, server='gevent')
