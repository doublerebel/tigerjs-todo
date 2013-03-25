// Generated by CoffeeScript 1.6.2
(function() {
  var Tiger, TigerDB, Todo, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Tiger = require('/lib/tiger');

  TigerDB = require('/lib/tiger.db');

  Todo = (function(_super) {
    __extends(Todo, _super);

    function Todo() {
      _ref = Todo.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Todo.extend(Tiger.Model.TigerDB);

    Todo.extend({
      bindTigerDB: Tiger.Model.TigerDB.extended
    });

    Todo.configure('Todo', 'item', 'done', 'date_completed');

    Todo.filter = function(query) {
      var _this = this;

      if (!query) {
        return this.all();
      }
      return this.select(function(item) {
        var field, value;

        for (field in query) {
          value = query[field];
          if (item[field] === query[field]) {
            return true;
          }
        }
      });
    };

    Todo.prototype.validate = function() {
      if (!this.item || this.item.length <= 0) {
        return 'No item!';
      }
      if (this.done.length <= 0) {
        return 'No completed flag!';
      }
    };

    return Todo;

  })(Tiger.Model);

  module.exports = Todo;

}).call(this);