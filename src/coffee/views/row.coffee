Tiger = require '/lib/tiger'
{dip} = require '/views/widgets'


class Row extends Tiger.TableViewRow
  defaults:
    height: dip 50
    backgroundColor: '#fff'
    focusable: false
    color: '#000'

  doneBackgroundColor: '#eee'
  doneColor: '#ccc'

  constructor: (args) ->
    @check = new Tiger.ImageView
      image: '/images/tick_gray_64.png'
      left: 0
      height: dip 50
      width: dip 50

    @task = new Tiger.Label
      text: args.itemText
      left: dip 50
      right: dip 50
      height: Ti.UI.SIZE
      font:
        fontSize: dip 18

    @remove = new Tiger.ImageView
      image: '/images/red_x.png'
      right: 0
      height: dip 50
      width: dip 50

    if Ti.Platform.osname isnt 'android'
      args.selectionStyle = Ti.UI.iPhone.TableViewCellSelectionStyle.NONE
    
    super args

    @add(@check)
    .add(@task)
    .add(@remove)

  displayTaskStatus: (task) ->
    return unless task
    
    if task.done
      @set backgroundColor: @doneBackgroundColor
      @check.set backgroundColor: @doneBackgroundColor
      @task.set color: @doneColor
      @check.set image: '/images/tick_64.png'
    
    else
      @set backgroundColor: @defaults.backgroundColor
      @check.set backgroundColor: @defaults.backgroundColor
      @task.set color: @defaults.color
      @check.set image: '/images/tick_gray_64.png'


module.exports = Row