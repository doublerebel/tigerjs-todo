Tiger   = require '/lib/tiger'
TigerDB = require '/lib/tiger.db'


class Todo extends Tiger.Model
  @extend Tiger.Model.TigerDB
  @extend bindTigerDB: Tiger.Model.TigerDB.extended
  
  @configure 'Todo', 'item', 'done', 'date_completed'

  @filter: (query) ->
    return @all() unless query

    @select (item) =>
      for field, value of query
        return true if item[field] is query[field]

  validate: ->
    return 'No item!' if !@item or @item.length <= 0
    return 'No completed flag!' if @done.length <= 0


module.exports = Todo