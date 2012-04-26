# -*- coding: utf-8 -*-
from google.appengine.ext import ndb
from aecore.handlers import Jinja2Handler
from aecore.models import Config

class PageHandler(Jinja2Handler):

    def overview(self):
        self.render_template('demo/overview.html')

class DemoPageHandler(Jinja2Handler):

    def aecore(self):
        if self.request.user is not None and self.request.user.auth_ids:
            userprofiles = self.request.user.get_profiles()
        else:
            userprofiles = None
        configs = Config.query().fetch(100)
        self.render_template('demo/aecore.html', {
            "session": self.request.session,
            "user": self.request.user,
            "userprofiles": userprofiles,
            "configs": configs,
        })

    def aeauth(self):
        if self.request.user is not None and self.request.user.auth_ids:
            userprofiles = self.request.user.get_profiles()
        else:
            userprofiles = None
        self.render_template('demo/aeauth.html', {
            "providers": Config.get('aeauth').providers,
            "userprofiles": userprofiles,
            })

    def aerest(self):
        self.render_template('demo/aerest.html')

    def aeaccount(self):
        self.render_template('demo/aeaccount.html')

