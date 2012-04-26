define [
  "lib/ember"
  'lib/ember-data'
  "plugins/text!app/product/templates/product-list.handlebars"
  'plugins/cs!app/product/model'
], (Em, DS, pList, Product) ->
    Em.TEMPLATES["product-list"] = Em.Handlebars.compile(pList)

    x = Em.View.create(
      templateName: "product-list"
    )
    return x
