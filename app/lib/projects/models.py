from google.appengine.ext import ndb



class Project(ndb.Model):
    title = ndb.StringProperty()
    description = ndb.StringProperty()
    repo_url = ndb.StringProperty()
    creator_id = ndb.StringProperty()

class ProjectModel(ndb.Model):
    data = ndb.LocalStructuredProperty(Project)