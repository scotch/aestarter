
p | Your Datastore Values (Only visiable to you)

ul.tabs
  li > a href="#profile" data-toggle="tab" | Profiles
  li > a href="#user" data-toggle="tab" | User
  li > a href="#session" data-toggle="tab" | Session
  li > a href="#emails" data-toggle="tab" | Emails

.tab-content
  #profile.tab-pane
    h2 | Profiles
    % if profiles and profiles.__len__
      h5 | Connect aditional providers account to view the information that aeauth collects.
      % for p in profiles
        h3 | {{ p.key.id() }}
        pre.prettyprint
          = p.to_dict()
    % else
      .alert-message.block-message.info
        No data yet. Try connecting an account

  #user.tab-pane
    h2 | User
    % if user
      pre.prettyprint
        = user.to_dict()
    % else
      .alert-message.block-message.info
        No data yet. Try connecting an account

  #session.tab-pane
    h2 | Session
    % if session
      pre.prettyprint
        = session.to_dict()
    % else
      .alert-message.block-message.info
        No data yet. Try connecting an account

  #emails.tab-pane
    h2 | Emails
    % if emails and emails.__len__
      % for e in emails
        h3 | {{ e.key.id() }}
        pre.prettyprint
          = e.to_dict()
    % else
      .alert-message.block-message.info
        No data yet. Try connecting an account
script
  | $(function () {
  |   window.prettyPrint && prettyPrint();
  |   $('.tabs a:first').tab('show')
  |   $('.pills a:first').tab('show')
  | })