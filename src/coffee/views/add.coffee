Tiger    = require '/lib/tiger'
Elements = require '/lib/tiger.elements'
Widgets  = require '/views/widgets'


{dip} = Widgets


class AddView extends Tiger.Window
  defaults:
    modal: true
    layout: 'vertical'
    barColor: '#a00'
    backgroundColor: '#444'

  constructor: ->
    @itemField = new Tiger.TextField
      hintText: 'What do you need to do?'
      width: '90%'
      top: dip 25
      borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED
      returnKeyType: Ti.UI.RETURNKEY_DONE

    @addButton = new Widgets.AddButton
      title: 'Add Item'
    
    @cancelButton = new Widgets.AddButton
      title: 'Cancel'

    super

    @add(@itemField)
    .add(@addButton)
    .add(@cancelButton)


module.exports = AddView