import sys
from cx_Freeze import setup, Executable

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

    'data/common/.keep',
    'data/liuliangeasy8/.keep',

    'log/liuliangeasy8/.keep',

    'tpl/home/index.html',
    'tpl/liuliangeasy8/index.html',
    'tpl/liuliangeasy8/getRedBag.html',
]]

includeFiles.append(('build_extra_files/msvcr100.dll', 'msvcr100.dll'));
includeFiles.append(('favicon.ico', 'favicon.ico'));

setup(
    name = 'fuck',
    version = '0.0.2',
    author = '洋子',
    description = 'yangzi',
    options = {
        'bdist_msi' : {
            'upgrade_code': 'bce00d2e-2120-46ba-85eb-0d8b42505ecb'
        },
        'build_exe': {
            'include_files': includeFiles,
            "optimize": 1,
        },
    },
    executables = [Executable(
                        "fuck.py",
                        base = base,
                        compress = True,
                        icon="favicon.ico",
                    )],
)
