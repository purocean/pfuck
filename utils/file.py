# coding: utf-8
# cython: language_level=3, boundscheck=False

import os
import glob
import hashlib

def files(currDir='.', ext='*.*'):
    """当前目录下的文件"""
    for file in glob.glob(os.path.join(currDir, ext)):
        yield file

def allFiles(rootDir, ext):
    """当前目录下以及子目录的文件"""
    for name in os.listdir(rootDir):
        if os.path.isdir(os.path.join(rootDir, name)):
            try:
                for file in allFiles(os.path.join(rootDir, name), ext):
                    yield file
            except:
                pass
    for file in files(rootDir, ext):
        yield file

def remove(files, show = False):
    """删除 rootDir 目录下的符合的文件"""
    for file in files:
        if show:
            print('remove: ', file)
        os.remove(file)

def rename(name, newName, rootDir='.'):
    os.rename(os.path.join(rootDir, name), os.path.join(rootDir, newName))

def md5(file):
    hashMd5 = hashlib.md5()
    with open(file, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hashMd5.update(chunk)
    return hashMd5.hexdigest()
