% extends "base.html"

% block title
  Welcome to Engine Starter

% block content
  section.tabbable
      ul.nav.nav-tabs
        li.active > a href="/projects" data-toggle="tab" | projects
        li > a href="/people" data-toggle="tab" | people
        li > a href="/resources data-toggle="tab" | resources

      .tab-content
        #auth.tab-pane.active
          section
            header
              h2 > a href="http://github.com/scotch/aeauth" | aeauth
              h4 | Adds Multi-Provider Authentication
              h3 | Demo
              % include "auth/login_form.html"
    
        #account.tab-pane
          header
            h3 > a href="http://github.com/scotch/aeaccount" | aeaccount
            h4 | Adds User Account Management
          ul
            li > a href="/auth/account/" | /auth/account/ 
            li > a href="/auth/account/recovery" | /auth/account/recovery

        #core.tab-pane
          header
            h3 > a href="http://github.com/scotch/aecore" | aecore
            h4 | Adds Sessions, Users and a Datastore Config
  section
    header
      h2 | Includes
    p | <strong>Engine Starter</strong> is bundle with the following apps:
    dl
      dt > h3 > a href="http://github.com/scotch/aecore" | aecore
      dd | Adds Sessions, Users and a Datastore Config
      dt > h3 > a href="http://github.com/scotch/aeauth" | aeauth
      dd | Adds Multi-Provider Authentication
      dt > h3 > a href="http://github.com/scotch/aeaccount" | aeaccount
      dd | Adds User Account Management
  
  script
    | $(function () {
    |   window.prettyPrint && prettyPrint();
    |   $('.tabs a:first').tab('show')
    |   $('.pills a:first').tab('show')
    | })
  

