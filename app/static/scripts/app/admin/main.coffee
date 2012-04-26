App = Em.Namespace.create()
Ember.Handlebars.registerHelper "lorem", (options) ->
  opts = ptags: true
  opts.type = options.hash.type  if options.hash.type
  opts.amount = options.hash.amount  if options.hash.amount
  new Handlebars.SafeString($("<div></div>").lorem(opts).html())

App.items = []
i = 1

while i <= 10
  App.items.pushObject Em.Object.create(
    id: i
    title: "Item " + i
    url: "#route-parameters/" + i
  )
  i++

App.NavState = Em.LayoutState.extend(
  navSelector: ".navbar .nav"
  enter: (stateManager, transition) ->
    @_super stateManager, transition
    $nav = $(@get("navSelector"))
    $nav.children().removeClass "active"
    selector = @get("selector") or ("." + @get("path"))
    $nav.find(selector).addClass "active"
)
App.SubNavState = App.NavState.extend(navSelector: ".subnav .nav")
App.main = Em.LayoutView.create(templateName: "main")
App.routeManager = Em.RouteManager.create(
  rootLayout: App.main
  home: App.NavState.create(
    selector: ".home"
    viewClass: Em.View.extend(templateName: "home")
  )
  layoutNesting: App.NavState.create(
    selector: ".layout-nesting"
    path: "layout-nesting"
    viewClass: Em.LayoutView.extend(templateName: "layout-nesting")
    section1: App.SubNavState.create(
      path: "section1"
      viewClass: Em.View.extend(
        title: "Section 1"
        templateName: "section"
      )
    )
    section2: App.SubNavState.create(
      path: "section2"
      viewClass: Em.View.extend(
        title: "Section 2"
        templateName: "section"
      )
    )
    section3: App.SubNavState.create(
      path: "section3"
      viewClass: Em.View.extend(
        title: "Section 3"
        templateName: "section"
      )
    )
    section4: App.SubNavState.create(
      path: "section4"
      viewClass: Em.View.extend(
        title: "Section 4"
        templateName: "section"
      )
    )
  )
  routeParameters: App.NavState.create(
    selector: ".route-parameters"
    path: "route-parameters"
    viewClass: Em.LayoutView.extend(templateName: "route-parameters")
    items: Em.LayoutState.create(viewClass: Em.View.extend(
      templateName: "items"
      contentBinding: "App.items"
    ))
    item: Em.LayoutState.create(
      path: ":itemId"
      viewClass: Em.View.extend(templateName: "item")
      enter: (stateManager, transition) ->
        @_super stateManager, transition
        itemId = stateManager.getPath("params.itemId")
        item = App.items[itemId - 1]
        @get("view").set "content", item
    )
  )
)
App.main.appendTo "body"
