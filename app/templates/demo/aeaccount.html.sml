% extends "base.html"

% block title
  AEAccount

% block content
  section
    header
      h1
        a href="http://github.com/scotch/aeaccount" | AEAccount
        small | Adds User Account Management
    h3 | Info
    dl
      dt | Repository
      dd > a href="http://github.com/scotch/aeaccount" | github.com/scotch/aeaccount
    dl
      dt | Urls
      dd
        p > a href="/account/" | /account/
        p > a href="/account/recovery" | /account/recovery
    h3 | Demo
