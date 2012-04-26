# -*- coding: utf-8 -*-
import os
import sys

# Add lib as primary libraries directory, with fallback to lib/dist
# and optionally to lib/dist.zip, loaded using zipimport.
lib_path = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'lib')
if lib_path not in sys.path:
    sys.path[0:0] = [
        lib_path,
        os.path.join(lib_path, 'dist'),
        os.path.join(lib_path, 'dist.zip'),
        ]


def webapp_add_wsgi_middleware(app):
    from aecore.middleware import AECoreMiddleware
    return AECoreMiddleware(app)