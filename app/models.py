from google.appengine.ext import ndb

from aerest.resources import Resource
from aecore import types

class Image(ndb.Model):
    position = ndb.IntegerProperty()
    url = ndb.StringProperty()
    width = ndb.IntegerProperty()
    height = ndb.IntegerProperty()

class Variant(ndb.Model):
    position = ndb.IntegerProperty()
    price = ndb.StringProperty()
    title = ndb.StringProperty()

class Customer(types.Person):
    acceptsMarketing = ndb.BooleanProperty()
    orderCount = ndb.IntegerProperty()
    addresses = ndb.StructuredProperty(types.PostalAddress, repeated=True)
    notes = ndb.TextProperty()

class MyModel(ndb.Model):
    pass

class Products(types.Product):
    name = ndb.StringProperty()
    productType = ndb.StringProperty()
    title = ndb.StringProperty()
    description = ndb.StringProperty()
    vendor = ndb.StringProperty()
    tags = ndb.StringProperty(repeated=True)
    variants = ndb.StructuredProperty(Variant, repeated=True)
    images = ndb.StructuredProperty(Image, repeated=True)

class Order(ndb.Model):
    pass

class Link(ndb.Model):
    name = ndb.StringProperty()
    url = ndb.StringProperty()

class LinkList(ndb.Model):
    links = ndb.LocalStructuredProperty(Link)

class Store(ndb.Model):
    name = ndb.StringProperty()
    description = ndb.StringProperty()
    url = ndb.StringProperty()
    shop = ndb.StringProperty()

class ProductResource(Resource):
    data = ndb.JsonProperty()

    class Meta:
        resource_name = 'products'

