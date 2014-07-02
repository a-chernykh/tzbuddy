Tzbuddy.Converter.init 'tz', 'cldr', ->
  $ ->
    process = (->
      text = $('#tzinput').val()
      if text.length > 0
        converter = new Tzbuddy.Converter
        local = Date.create(converter.convert(text).getTime())
        $('#result').text local.format()
      else
        $('#result').text ''

    ).debounce 100
    $('#tzinput').on 'keyup', process
