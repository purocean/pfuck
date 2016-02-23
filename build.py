import os
import sys
import glob

import distutils.core
from Cython.Build import cythonize

from cx_Freeze import setup, Executable

def files(currDir='.', ext='*.*'):
    """当前目录下的文件"""
    for file in glob.glob(os.path.join(currDir, ext)):
        yield file

def remove(files, show = False):
    """删除 rootDir 目录下的符合的文件"""
    for file in files:
        if show:
            print('remove: ', file)
        os.remove(file)

NAME = 'fuck'
VERSION = '0.03'
AUTHOR = '洋子'
DESCRIPTION = 'yangzi'
GUID = 'bce00d2e-2120-46ba-85eb-0d8b42505ecb'

includeFiles = [(file, file) for file in [
    'static/css/foundation.min.css',
    'static/css/style.css',
    'static/js/jquery-1.12.0.min.js',
    'static/js/foundation.min.js',
    'static/js/ycom.js',

    'data/common/.keep',
    'data/liuliangeasy8/.keep',

    'log/liuliangeasy8/.keep',

    'tpl/home/index.html',
    'tpl/liuliangeasy8/index.html',
    'tpl/liuliangeasy8/getRedBag.html',
]]

includeFiles.append(('build_extra_files/msvcr100.dll', 'msvcr100.dll'))
includeFiles.append(('favicon.ico', 'favicon.ico'))

packages = [
    'app.liuliangeasy8',

    'app',
    'configs',
    'core',
    'routers',
    'utils',
    'vendors',
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
