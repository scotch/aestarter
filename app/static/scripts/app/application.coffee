define [
  'lib/ember'
  'lib/ember-data'
  'plugins/cs!lib/ember-storeski'

], (Em, DS, StoreskiAdapt) ->

  App = Em.Application.create
    VERSION: "0.0.1"

  App.store = DS.Store.create
    adapter: StoreskiAdapt

  return App
