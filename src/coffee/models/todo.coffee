Tiger   = require '/lib/tiger'
TigerDB = require '/lib/tiger.db'


class Todo extends Tiger.Model
  # Extend this model with the SQLite database adapter
  @extend Tiger.Model.TigerDB
  # Shim to bind events in Controller context
  @extend bindTigerDB: Tiger.Model.TigerDB.extended

  # All models must be configured with model name and properties.
  # In the adapter, Model name corresponds to SQLite table.
  @configure 'Todo', 'item', 'done', 'date_completed'

  # Return a subset of records filtered by property
  @filter: (query) ->
    return @all() unless query

    # Select takes a function which returns true if item/record
    # matches the requirements.
    @select (item) =>
      for field, value of query
        return true if item[field] is query[field]

  # Validation is performed before save, and fires an error event
  # with String message if record does not pass validation.
  validate: ->
    return 'No item!' if !@item or @item.length <= 0
    return 'No completed flag!' if @done.length <= 0


module.exports = Todo