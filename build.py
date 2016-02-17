import sys
from cx_Freeze import setup, Executable

import configs.main

if len(sys.argv) < 2:
    sys.argv.append('build')
    pass

base = None
# if sys.platform == "win32":
#     base = "Win32GUI"

includeFiles = [(file, file) for file in [
    'static/css/foundation.min.css',
    'static/css/style.css',
    'static/js/jquery-1.12.0.min.js',
    'static/js/foundation.min.js',
    'static/js/ycom.js',

    'data/.keep',

    'log/.keep',

    'tpl/index.html',
    'tpl/getRedBag.html',
]]

includeFiles.append(('build_extra_files/msvcr100.dll', 'msvcr100.dll'));
includeFiles.append(('favicon.ico', 'favicon.ico'));

setup(
    name = configs.main.APP_NAME,
    version = configs.main.VERSION,
    description = configs.main.DESCRIPTION,
    options = {
        'build_exe': {
            'include_files': includeFiles
        }
    },
    executables = [Executable(
                        "fuck.py",
                        base = base,
                        compress = True,
                        icon="favicon.ico",
                    )],
)
