import feedparser


def google_app_engine_latest():
    feed = 'http://stackoverflow.com/feeds/tag?tagnames=google-app-engine&sort=newest'
    return feedparser.parse(feed)