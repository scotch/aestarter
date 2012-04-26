% extends "base.html"

% block title
  AECore

% block head
  link href="/static/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" /
  script type="text/javascript" src="/static/google-code-prettify/prettify.js" |

% block content
  section
    header
      h1
        a href="http://github.com/scotch/aecore" | AECore
        small | Adds Sessions, Users, UserProfiles and Datastore Config

  section.tabbable
    h5 | The following demonstrate the data stored by AECore for you (data is visialble to you only).

    hr /
    ul.nav.nav-tabs.tabs
      li.active > a href="#session" data-toggle="tab" | Session
      li > a href="#user" data-toggle="tab" | User
      li > a href="#userprofile" data-toggle="tab" | UserProfile
      li > a href="#config" data-toggle="tab" | Config

    .tab-content
      #session.tab-pane.active
        section
          header
            h3
              small | [Description]

          % if session
            pre.prettyprint
              = session.to_dict()|do_pprint()
          % else
            .alert.alert.info
              No data yet. Try connecting an account

      #user.tab-pane
        section
          header
            h3
              small | [Description]

          % if user
            pre.prettyprint
              = user.to_dict()|do_pprint()
          % else
            .alert.alert.info
              No data yet. Try connecting an account

      #userprofile.tab-pane
        section
          header
            h2
              small | [Description]

          % include "demo/partials/userprofile_details.html"

      #config.tab-pane
        section
          header
            h2
              small | [Description]

          % if config.__len__
            .tabbable.tabs-left
              ul.nav.nav-tabs.tabs
                % for c in configs
                  {# html element ids can not contain '.' #}
                  li class="{% if loop.first %}active{% endif %}" > a data-toggle="tab" href="#{{ c.key.id().replace('.', '') }}" | {{ c.key.id() }}

              .tab-content
                % for c in configs
                  {# html element ids can not contain '.' #}
                  div class="tab-pane{% if loop.first %} active{% endif %}" id="{{ c.key.id().replace('.', '') }}"
                    pre.prettyprint
                      = c.to_dict()|do_pprint()
          % else
            .alert.alert.info
              No data yet.
  script
    | require(["lib/bootstrap-tab"], function(tab) {
    |   window.prettyPrint && prettyPrint();
    | });
