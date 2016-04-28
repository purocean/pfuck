import os
import sys
import glob
import time
import json
import shutil
import zipfile
import hashlib

import distutils.core
from Cython.Build import cythonize

from cx_Freeze import setup, Executable

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

def md5(file):
    hashMd5 = hashlib.md5()

    with open(file, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hashMd5.update(chunk)
    return hashMd5.hexdigest()


NAME = 'fuck'
VERSION = '0.07'
AUTHOR = '洋子'
DESCRIPTION = 'yangzi'
GUID = 'bce00d2e-2120-46ba-85eb-0d8b42505ecb'

includeFiles = [(file, file) for file in [
    'favicon.ico',
    'bin/pjs.exe',
    'bin/preload.js',
    'cache/.keep',

    'static/css/foundation.min.css',
    'static/css/style.css',
    'static/js/jquery-1.12.0.min.js',
    'static/js/foundation.min.js',
    'static/js/ycom.js',

    'application/common/data/.keep',
    'application/common/log/.keep',
    'application/common/tpl/index.html',

    'application/api/data/.keep',
    'application/api/log/.keep',
    'application/api/tpl/index.html',

    'application/ruiyou/data/.keep',
    'application/ruiyou/log/.keep',
    'application/ruiyou/tpl/index.html',
]]

includeFiles.append(('build_extra_files/msvcr100.dll', 'msvcr100.dll'))

packages = [
    'application.common',
    'application.api',
    'application.ruiyou',

    'utils',
    'vendors',

    'requests',
    'selenium',
]

# 编译文件
if len(sys.argv) < 2:
    sys.argv.append('build_ext')
    sys.argv.append('--inplace')

for package in packages:
    path = package.replace('.', '/')
    for file in files(path, '*.py'):
        if not file.endswith('__init__.py'):
            print('compile:', file)
            distutils.core.setup(
                ext_modules = cythonize(file)
            )

sys.argv[1] = 'build'
del sys.argv[2]

# 打包文件
base = None
# if sys.platform == "win32":
#     base = "Win32GUI"

setup(
    name = NAME,
    version = VERSION,
    author = AUTHOR,
    description = DESCRIPTION,
    options = {
        'bdist_msi' : {
            'upgrade_code': GUID
        },
        'build_exe': {
            'packages': packages,
            'include_files': includeFiles,
            "optimize": 1,
        },
    },
    executables = [Executable(
                        "fuck.py",
                        base = base,
                        compress = True,
                        icon = "favicon.ico",
                    )],
)

# 清理文件
for package in packages:
    remove(files(package.replace('.', '/'), '*.c'), True)
    remove(files(package.replace('.', '/'), '*.pyd'), True)
    remove(files('build/exe.win-amd64-3.4/' + package.replace('.', '/') + '/log', '*.log'), True)
    remove(files('build/exe.win-amd64-3.4/' + package.replace('.', '/') + '/log', '*.png'), True)
    remove(files('build/exe.win-amd64-3.4/' + package.replace('.', '/') + '/data', '*.json'), True)

# zip 压缩
os.chdir('build/exe.win-amd64-3.4')

checkSumJsonFile = 'checkSum.json'
checkSum = {}
lastCheckSum = {}
try:
    with open(checkSumJsonFile, 'r') as f:
        lastCheckSum = json.load(f)
except:
    open(checkSumJsonFile, 'w').write('{}')

dateTime = time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time()))
fullZipFile = '../'+ NAME +'_v'+ VERSION +'_full_'+ dateTime +'.zip'
updateZipFile = '../'+ NAME +'_v'+ VERSION +'_update_'+ dateTime +'.zip'

with zipfile.ZipFile(fullZipFile, 'w', zipfile.ZIP_DEFLATED) as fFull:
    with zipfile.ZipFile(updateZipFile, 'w', zipfile.ZIP_DEFLATED) as fUpdate:
        for file in (list(allFiles('.', '*.*')) + list(allFiles('.', '.keep'))):
            if checkSumJsonFile in file:
                continue

            md = hashlib.md5()
            md.update(file.encode())
            fileKey = md.hexdigest()
            checkSum[fileKey] = md5(file)

            print('zip full   ' + checkSum[fileKey] + ' ' + file)
            fFull.write(file)
            if fileKey not in lastCheckSum or lastCheckSum[fileKey] != checkSum[fileKey]:
                print('zip update ' + checkSum[fileKey] + ' ' + file)
                fUpdate.write(file)
        fFull.write(checkSumJsonFile)
        fUpdate.write(checkSumJsonFile)

with open(checkSumJsonFile, 'w') as f:
    json.dump(checkSum, f)

print('done')
