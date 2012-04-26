<!DOCTYPE HTML>
html
  head
    title | {% block title %}{% endblock %} - {{ application.title }}
    meta charset="utf-8" /
    meta name="description" content="{{ application.description }}" /
    meta name="author" content="{{ application.author }}" /
    meta name="viewport" content="width=device-width, initial-scale=1.0" /
    link rel="stylesheet" href="/static/styles/css/application.css" /

    <!--[if lt IE 8]>
      script src="http://cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js" |
    <![endif]-->
    <!--[if lt IE 9]>
      script type="text/javascript" src="//html5shiv.googlecode.com/svn/trunk/html5.js" |
    <![endif]-->

    <!-- uncomment this line to server require.js locally -->
    script src="/static/scripts/lib/require.js" |
    <!--
    script src="http://cdnjs.cloudflare.com/ajax/libs/require.js/1.0.5/require.min.js" |
    -->

    script
      | require.config({
      |   baseUrl: "/static/scripts/",
      |   paths: {
      |    // uncomment this line to serve the optimized
      |    // main-build.js source file.
      |    //"main": "/static/scripts/main-built"
      |    "main": "/static/scripts/main"
      |  }
      |  });
      |  // uncomment this line to server jQuery locally
      |  // require(["plugins/order!/static/scripts/lib/jquery.min.js", "plugins/order!main"]);
      |  require(["plugins/order!https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", "plugins/order!main"]);

    {% block head %}{% endblock %}

    <!-- Load Google Analytics -->
    % include "partials/google_analytics.html"

  body
    .wrapper
      .navbar
        .navbar-inner.navbar
          .container
            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            a.btn.btn-navbar data-toggle="collapse" data-target=".nav-collapse"
              span.icon-bar |
              span.icon-bar |
              span.icon-bar |

            <!-- Be sure to leave the brand out there if you want it shown -->
            .brand
              <!-- Comment out this line to remove the aestarter logo -->
              img width=24 height=24 style="margin: 0 0 -5px;" src="/static/img/logo.png" /
              a href="/" | {{ application.title }}

            <!-- Everything you want hidden at 940px or less, place within here -->
            .nav-collapse
              % include "demo/partials/nav.html"

      .container.main-content
        % block content
          .

      .push |

    footer.footer
      .container
        p > small | <a href="https://www.aestarter.com/projects/aestarter" target="_blank">AEStarter</a> from <a href="http://www.scotchmedia.com" target="_blank">Scotch Media</a>.

    <!-- % include "partials/facebook.html" -->
