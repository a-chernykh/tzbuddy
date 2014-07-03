(function() {
  Tzbuddy.Converter.init('tz', 'cldr', function() {
    return $(function() {
      var process;
      process = (function() {
        var converted, converter, text;
        text = $('#tzinput').val();
        if (text.length > 0) {
          converter = new Tzbuddy.Converter;
          converted = converter.convert(text);
          if (converted) {
            return $('#result').text(converted.toDateString() + ', ' + converted.toTimeString());
          } else {
            return $('#result').text('Invalid Date');
          }
        } else {
          return $('#result').text('');
        }
      }).debounce(100);
      $('#tzinput').on('keyup', process);
      return $('a').on('click', function(e) {
        e.preventDefault();
        $('#tzinput').val($(this).text());
        return $('#tzinput').trigger('keyup');
      });
    });
  });

}).call(this);
