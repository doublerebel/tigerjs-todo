Tiger = require '/lib/tiger'
Add   = require '/controllers/add'


class App extends Tiger.Controller
  logPrefix: '(Todo:App)'

  indicies:
    'All': 0
    'Active': 1
    'Done': 2

  addTodoItem: -> (new Add @Store).render()

  events:
    'click header.addView': 'addTodoItem'
    'click menu': 'filter'

  constructor: ->
    @debug 'Creating...'

    @Store = require '/models/todo'
    @View  = require '/views/app'
    @view  = new @View
    super

    @Store.bind('refresh change', @proxy @renderItems)
          .bind('error', @handleError)
          .bindTigerDB()

    @render()

  render: ->
    @view.open()
    @Store.fetch()

  filter: (e) ->
    return unless e.source.title

    whereIndex = @indicies[e.source.title]
    unless whereIndex
      @renderItems()
    else
      tasks = @Store.filter done: whereIndex isnt 1
      @view.renderTasks tasks

  renderItems: -> @view.renderTasks @Store.all()

  handleError: (record, msg) ->
    alert "Update failed for record #{record.id}: #{msg}"


new App()