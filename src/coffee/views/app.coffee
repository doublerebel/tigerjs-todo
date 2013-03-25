Tiger    = require '/lib/tiger'
# Must require Tiger.Elements in the first loaded View, then they are usable
# throughout the app.  This allows Elements to be altered at a Global level.
Elements = require '/lib/tiger.elements'
# Widgets are generally simple views, often without Controller or Model logic
Widgets  = require '/views/widgets'
# The Row is a more complex widget, we address it by its Controller
Row      = require '/controllers/row'


# I don't like repeatedly typing quotes, and
# I prefer my numbers syntax-hilighted.
{dip} = Widgets


class App extends Tiger.Window
  # Default properties are applied to every instance unless overridden
  defaults:
    fullscreen: false
    navBarHidden: true
    exitOnClose: true

  # Complex view creation should be factored into clear chunks
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

    # Creating elements as instance properties allows them to be
    # accessed by the Controller.
    @allButton = new Tiger.Button title: 'All'
    @activeButton = new Tiger.Button title: 'Active'
    @doneButton = new Tiger.Button title: 'Done'

    # Like jQuery, most Element methods return 'this' and can be chained.
    @menu.add(@allButton)
         .add(@activeButton)
         .add(@doneButton)

  constructor: ->
    # We factored out the View components, to make the constructor overview
    # clear and easy to understand
    @header = new Widgets.Header
    @header.title.set text: 'TigerJS Todo'

    @todoTable = new Tiger.TableView
      top: dip 50
      bottom: dip 46

    @createMenu()

    # Calling super without arguments in CoffeeScript passes all arguments
    # through to the superclass.
    super

    @add(@header)
    .add(@todoTable)
    .add(@menu)

  # Take JSON data, and display it in human-readable form.
  renderTasks: (tasks) ->
    rows = []
    for task in tasks
      row = new Row(task.id)
      rows.push row.view.element
    
    @todoTable.set data: rows


# CommonJS export of the View class
module.exports = App