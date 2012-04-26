from aerest.api import Api
from models import Product
from webapp2_extras.routes import PathPrefixRoute
import webapp2



v1_api = Api(api_name='v1')
v1_api.register(Product)


routes = [
    PathPrefixRoute(r'/api/v1', v1_api.get_routes()),
    ]

application = webapp2.WSGIApplication(routes)