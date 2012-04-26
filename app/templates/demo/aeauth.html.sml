% extends "base.html"

% block title
  AEAuth

% block head
  link href="/static/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" /
  script type="text/javascript" src="/static/google-code-prettify/prettify.js" |

% block content
  section
    header
      h1
        a href="http://github.com/scotch/aeauth" | AEAuth
        small | Adds Multi-Provider Authentication
    .row
      .span9
        h3 | Demo
          % include "auth/login_form.html"
      .span3
        h3 | Info
        dl
          dt | Repository
          dd > a href="http://github.com/scotch/aeauth" | github.com/scotch/aeauth
        dl
          dt | Urls
          dd > a href="/auth/login" | /auth/login
  section
    hr /
    h2
      UserProfile
      small | Entity
    hr /
    % include "demo/partials/userprofile_details.html"


  script
    | require(["lib/bootstrap-tab"], function(tab) {
    |   window.prettyPrint && prettyPrint();
    | });

