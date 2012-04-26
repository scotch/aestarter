define [
  'lib/ember'
  'lib/ember-data'
  'plugins/cs!app/application'
  'plugins/cs!app/routes'
  'plugins/cs!app/product/model'
  "plugins/text!app/product/templates/product-list.handlebars"

], (Em, DS, App, Routes, Product, ProductListView) ->

  App.router = Routes

  App.Product = Product
  App.router.initRouter()
  #eggs = App.store.createRecord(App.Product,  { name: "Eggs" })
  App.products = App.store.findAll(App.Product)

  console.log "App.products: "

  Em.TEMPLATES["product-list"] = Em.Handlebars.compile(ProductListView)
  App.productList = Em.View.create(
    templateName: "product-list"
    products: App.products
  )
  App.productList.appendTo("#content")
  #App.store.commit()


  return App

#view_port = $(window).width()

# Statechart
#  App.statechart = SC.Statechart.create(
#    suppressStatechartWarnings: true
#    rootState: SC.State.extend(
#      # initialSubstate: 'home'
#
#      enterState: ->
#        App.GlobalHeaderView.appendTo('body')
#        App.GlobalContentView.appendTo('body')
#        App.GlobalFooterView.appendTo('body')
#
#      router: (params) ->
#        console.log params
#        # App.router.setRoute controller: params.controller, id: params.id
#        switch params.controller
#          when 'pages'
#            switch params.id
#              when 'home' then @statechart.gotoState 'home'
#              when 'about' then @statechart.gotoState 'about'
#              when 'rules' then @statechart.gotoState 'rules'
#          when 'members'
#            if params.id
#              App.Members.detailController.set 'content',
#                App.Members.store.find(App.Member, params.id)
#              @statechart.gotoState 'membersDetail'
#            else
#              App.Members.listController.set 'content',
#                App.Members.store.find(App.Member)
#              @statechart.gotoState 'membersList'
#
#      home: SC.State.extend
#          enterState: ->
#            @set 'globalContent', App.Pages.HomeView.appendTo('#global-content')
#
#          exitState: ->
#            @get('globalContent').remove()
#
#
#      about: SC.State.extend
#          enterState: ->
#            @set 'globalContent', App.Pages.AboutView.appendTo('#global-content')
#
#          exitState: ->
#            @get('globalContent').remove()
#
#      rules: SC.State.extend
#          enterState: ->
#            @set 'globalContent', App.Pages.RulesView.appendTo('#global-content')
#
#          exitState: ->
#            @get('globalContent').remove()
#
#      membersList: SC.State.extend
#          enterState: ->
#            @set 'globalContent', App.Members.ListView.appendTo('#global-content')
#
#          exitState: ->
#            @get('globalContent').remove()
#
#      membersDetail: SC.State.extend
#          enterState: ->
#            @set 'globalContent', App.Members.DetailView.appendTo('#global-content')
#
#          exitState: ->
#            @get('globalContent').remove()
