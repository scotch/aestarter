% if userprofiles.__len__
  h3 | Connect additional provider account to view the information that AEAuth collects.

  .tabbable.tabs-left
    ul.nav.nav-tabs.tabs
      % if userprofiles
        % for p in userprofiles
          li class="{% if loop.first %}active{% endif %}" > a data-toggle="tab" href="#{{ p.key.id().replace(':', '').replace('.', '').replace('#', '').replace('@', '') }}" | {{ p.key.id() }}

    .tab-content
      % if userprofiles
        % for p in userprofiles
          div class="tab-pane{% if loop.first %} active{% endif %}" id="{{ p.key.id().replace(':', '').replace('.', '').replace('#', '').replace('@', '') }}"
            pre.prettyprint
              = p.to_dict()|do_pprint()
% else
  .alert.alert.info
    No data yet. Try connecting an account