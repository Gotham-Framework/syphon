// Generated by CoffeeScript 1.8.0
(function() {
  this.Syphon = (function() {
    function Syphon() {}

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
      return get;
    };

    return Syphon;

  })();

}).call(this);
