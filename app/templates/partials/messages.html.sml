% if messages
  div data-dismiss="alert" class="alert alert-{{ messages[0]['level'] }}"
    a.close href="#" | &times;
    ul.unstyled
      % for message in messages
        li | {{ message['message']|safe }}
