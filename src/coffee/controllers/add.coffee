Tiger = require '/lib/tiger'


class Add extends Tiger.Controller
  logPrefix: '(Todo:Add)'

  elements: ['itemField']
  
  addItem: ->
    item = new @Store
      item: @itemField.get 'value'
      done: false

    item.save()
    @close()

  closeKeyboard: (e) -> e.source.blur()

  focusTextField: -> @itemField.focus()

  events:
    'click addButton': 'addItem'
    'click cancelButton': 'close'
    'return itemField': 'closeKeyboard'
    'open': 'focusTextField'

  constructor: (@Store) ->
    @debug 'Creating...'
    
    @View  = require '/views/add'
    @view = new @View

    super

  render: -> @view.open()

  close: -> @view.close()


module.exports = Add