Tiger = require '/lib/tiger'
Add   = require '/controllers/add'


class App extends Tiger.Controller
  # Prefix logs from this controller
  logPrefix: '(Todo:App)'

  # Instance property, specific to this Todo app
  indicies:
    'All': 0
    'Active': 1
    'Done': 2

  # Functions called from UI interactions
  addTodoItem: -> (new Add @Store).render()

  # Titanium UI event bindings
  # <event> <element from this.view>: <string name of function>
  events:
    'click header.addView': 'addTodoItem'
    'click menu': 'filter'

  # Defines Model and View for automatic event- and data-binding
  constructor: ->
    @debug 'Creating...'

    @Store = require '/models/todo'
    @View  = require '/views/app'
    # this.view is required before calling super, in order to bind event block
    @view  = new @View
    super

    # Bind controller methods to model using Spine's event system
    @Store.bind('refresh change', @proxy @renderItems)
          .bind('error', @handleError)
    # Bind SQLite adapter to this Controller context
          .bindTigerDB()

    # Because this is our root controller, it should render as soon as created
    @render()

  render: ->
    # In this case, View is an extension of Titanium Window element
    @view.open()
    # Fetch model data from any included adapter
    @Store.fetch()

  filter: (e) ->
    return unless e.source.title

    whereIndex = @indicies[e.source.title]
    unless whereIndex
      @renderItems()
    else
      tasks = @Store.filter done: whereIndex isnt 1
      @view.renderTasks tasks

  # Most basic data-binding, render all data from Store into view
  renderItems: -> @view.renderTasks @Store.all()

  # UI interaction for model record validation failure
  handleError: (record, msg) ->
    alert "Update failed for record #{record.id}: #{msg}"


# Root controller is not exported, and must initialize itself
new App()