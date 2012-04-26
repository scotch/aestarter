# -*- coding: utf-8 -*-
import os
import webapp2
from webapp2_extras import jinja2
from jinja2.filters import do_pprint
from aecore.models import Config

DEBUG = os.environ.get('SERVER_SOFTWARE', '').startswith('Dev')

routes = [
    webapp2.Route('/', handler='handlers.PageHandler:overview', name='page-overview'),
    webapp2.Route('/demo/aeaccount/', handler='handlers.DemoPageHandler:aeaccount', name='page-aeaccount'),
    webapp2.Route('/demo/aecore/', handler='handlers.DemoPageHandler:aecore', name='page-aecore'),
    webapp2.Route('/demo/aeauth/', handler='handlers.DemoPageHandler:aeauth', name='page-aeauth'),
    webapp2.Route('/demo/aerest/', handler='handlers.DemoPageHandler:aerest', name='page-aerest'),
    ]


template_paths = [
    'templates',
    # add aeauth templates
    'lib/dist/aeauth/templates',
    ]

config = {
    'webapp2_extras.jinja2': {
        'template_path': template_paths,
        'filters': {
            # this filter is used for the demo. You may remove it.
            'do_pprint': do_pprint,
            },
        },
    }

application = webapp2.WSGIApplication(routes, config=config)


def handle_404(request, response, exception):
    t = jinja2.get_jinja2(app=application).render_template(
        'errors/404.html', **{
            'exception': exception.status,
            'application': Config.get('application'),
        })
    response.write(t)
    response.set_status(exception.status_int)


def handle_500(request, response, exception):
    t = jinja2.get_jinja2(app=application).render_template(
        'errors/500.html', **{
            'exception': exception.message,
#            'application': Config.get('application'),
        })
    response.write(t)


application.error_handlers[404] = handle_404

if not DEBUG:
    # Only add the 500 page on production, because it stops traces that
    # are helpful when developing.
    application.error_handlers[500] = handle_500