Tiger = require '/lib/tiger'


dip = (val) -> "#{val} dip"


Tiger.Window::defaults = backgroundColor: '#fff'
Tiger.Label::defaults = color: '#000'


class Divider extends Tiger.View
  defaults:
    height: dip 48
    width: dip 3
    top: dip 1
    right: dip 50
    backgroundGradient:
      type: "linear"
      startPoint: { x: "0%", y: "0%" }
      endPoint: { x: "100%", y: "0%" }
      colors: [
        { color: "#666", offset: 0.0 }
        { color: "#ccc", offset: 0.5 }
        { color: "#666", offset: 1.0 }
      ]

class Header extends Tiger.View
  defaults:
    top: 0
    height: dip 50
    width: Ti.UI.FILL
    backgroundGradient:
      type: "linear"
      startPoint: { x: "0%", y: "0%" }
      endPoint:   { x: "0%", y: "100%" }
      colors: [
        { color: "#a00", offset: 0.0 }
        { color: "#800", offset: 1.0 }
      ]
    
  constructor: ->
    @title = new Tiger.Label
      left: dip 10
      color: "#fff"
      font:
        fontSize: dip 24
        fontWeight: 'bold'

    @divider = new Divider

    @addView = new Tiger.View
      top: 0
      bottom: 0
      right: 0
      width: dip 50

    @addImage = new Tiger.ImageView
      height: Ti.UI.FILL
      width: Ti.UI.FILL
      color: "#fff"
      backgroundColor: "transparent"
      image: "/images/ic_menu_add.png"
      touchEnabled: false

    @addView.add @addImage

    super

    @add(@title)
    .add(@divider) 
    .add(@addView)


class AddButton extends Tiger.Button
  width: '50%'
  top: dip 20


Widgets =
  dip: dip
  Divider: Divider
  Header: Header
  AddButton: AddButton


module.exports = Widgets