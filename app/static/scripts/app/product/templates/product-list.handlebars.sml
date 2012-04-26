
h1 | Products

table.table.table-striped
  thead
    tr
      th | ID
      th | Name
      th | Description
  tbody
    {{#each products}}
      tr
        td | {{id}}
        td | {{name}}
        td | {{description}}
    {{/each}}

