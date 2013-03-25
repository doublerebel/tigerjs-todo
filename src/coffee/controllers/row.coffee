Tiger = require '/lib/tiger'


class Row extends Tiger.Controller
  logPrefix: '(Todo:Row)'
  
  toggleStatus: ->
    @store.done = !@store.done
    @store.date_completed = (new Date).getTime()
    @store.save()

  deleteTask: (e) ->
    e.cancelBubble = true
    @store.destroy()

  events:
    'click check': 'toggleStatus'
    'click remove': 'deleteTask'

  constructor: (@id) ->
    @debug 'Creating...'
    
    @Store = require '/models/todo'
    @View  = require '/views/row'
    
    @store = @Store.find(@id)
    @view  = new @View itemText: "[#{@store.item}]"
    
    super

    @view.displayTaskStatus @store


module.exports = Row