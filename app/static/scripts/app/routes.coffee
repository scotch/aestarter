define [
  'lib/ember'
  'lib/ember-data'
  'plugins/cs!app/application'

], (Em, DS, App) ->

  x = Em.Object.create

    initRouter: ->
      # Em.routes.set 'wantsHistory', true
      Em.routes.add ':controller/:id',    App, @changeState
      Em.routes.add ':controller',        App, @changeState

    changeState: (params) ->
      params = { controller: 'pages', id: 'home' } unless params.controller
      console.log params
  #      App.statechart.sendAction("router", params)

    setRoute: (route) ->
      Em.routes.set "location", route

  return x
