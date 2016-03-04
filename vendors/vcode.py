# coding: utf-8
# cython: language_level=3, boundscheck=False

from .ruokuai import RClient

softId = '53089'
softKey = '1e3caa0b568b450ebd25e33526a7c294'

def get(user, password, img, type=3000):
    rc = RClient(user, password, softId, softKey)
    result = rc.rk_create(img, type)

    if 'Result' in result and 'Id' in result:
        return {
            'result': result['Result'],
            'id': result['Id'],
        }
    else:
        print(result)
        return False

def report(user, password, imgId):
    rc = RClient(user, password, softId, softKey)
    rc.rk_report_error(imgId)
