define [
  'lib/ember'
  'lib/ember-data'
], (Em, DS) ->

  x = DS.Model.extend
    name: DS.attr 'string'
    description: DS.attr 'string'

  return x
