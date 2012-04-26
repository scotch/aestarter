
h1 | Products

table.table.table-striped
  thead
    tr
      th | ID
      th | Name

  tbody
    {{#each products}}
      tr
        td | {{id}}
        td | {{name}}
    {{/each}}

