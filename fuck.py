# coding: utf-8

import gevent
from gevent import monkey
monkey.patch_all()

import bottle
import webbrowser

import application.common.router
import application.api.router
import application.ruiyou.router

debug = False
# debug = True

port = '8099'

if not debug:
    webbrowser.open("http://127.0.0.1:" + port)

bottle.debug(debug)
bottle.run(port=port, server='gevent')
