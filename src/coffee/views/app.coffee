Tiger    = require '/lib/tiger'
Elements = require '/lib/tiger.elements'
Widgets  = require '/views/widgets'
Row      = require '/controllers/row'


{dip} = Widgets


class App extends Tiger.Window
  defaults:
    fullscreen: false
    navBarHidden: true
    exitOnClose: true

  createMenu: ->
    @menu = new Tiger.View
      layout: 'horizontal'
      bottom: 0
      height: dip 46
      width: Ti.UI.FILL
      backgroundGradient:
        type: "linear"
        startPoint: { x: "0%", y:"0%" }
        endPoint:   { x: "0%", y:"100%" }
        colors: [
          { color: "#a00", offset: 0.0 }
          { color: "#400", offset: 1.0 }
        ]

    @allButton = new Tiger.Button title: 'All'
    @activeButton = new Tiger.Button title: 'Active'
    @doneButton = new Tiger.Button title: 'Done'

    @menu.add(@allButton)
         .add(@activeButton)
         .add(@doneButton)

  constructor: ->
    @header = new Widgets.Header
    @header.title.set text: 'TigerJS Todo'

    @todoTable = new Tiger.TableView
      top: dip 50
      bottom: dip 46

    @createMenu()

    super

    @add(@header)
    .add(@todoTable)
    .add(@menu)

  renderTasks: (tasks) ->
    rows = []
    for task in tasks
      row = new Row(task.id)
      rows.push row.view.element
    
    @todoTable.set data: rows


module.exports = App