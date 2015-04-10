// Generated by CoffeeScript 1.8.0
(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  this.Syphon = (function() {
    function Syphon() {
      this._excluded = [];
    }

    Syphon.prototype.get = function(selector) {
      var data, get, serialized, _i, _len;
      serialized = $(selector).serializeArray();
      get = {};
      for (_i = 0, _len = serialized.length; _i < _len; _i++) {
        data = serialized[_i];
        if (data.name in get) {
          if (typeof get[data.name] === 'string') {
            get[data.name] = [get[data.name], data.value];
          } else {
            get[data.name].push(data.value);
          }
        } else {
          get[data.name] = data.value;
        }
      }
      $(selector).find('input[type=checkbox]:not(:checked)').each(function() {
        var name;
        name = $(this).attr('name');
        if (!(name in get)) {
          return get[name] = false;
        }
      });
      $(selector).find('input[type=radio]:not(:checked)').each(function() {
        var name;
        name = $(this).attr('name');
        if (!(name in get)) {
          return get[name] = false;
        }
      });
      $(selector).find("select[multiple]:not(:checked)").each(function() {
        var name;
        name = $(this).attr('name');
        if (!(name in get)) {
          return get[name] = false;
        }
      });
      get = this._reduce(get);
      return get;
    };

    Syphon.prototype.exclude = function() {
      var data, exclude, _i, _len;
      exclude = arguments;
      if (arguments.length > 0) {
        if (this._isArray(arguments[0])) {
          exclude = arguments[0];
        }
        for (_i = 0, _len = exclude.length; _i < _len; _i++) {
          data = exclude[_i];
          this._excluded.push(data);
        }
      }
      return this;
    };

    Syphon.prototype._reduce = function(datas) {
      var data, index, reduced;
      if (this._excluded.length === 0) {
        return datas;
      }
      reduced = {};
      for (index in datas) {
        data = datas[index];
        if (__indexOf.call(this._excluded, index) < 0) {
          reduced[index] = data;
        }
      }
      this._excluded = [];
      return reduced;
    };

    Syphon.prototype._isArray = function(value) {
      return value && typeof value === 'object' && value instanceof Array && typeof value.length === 'number' && typeof value.splice === 'function' && !(value.propertyIsEnumerable('length'));
    };

    return Syphon;

  })();

}).call(this);
