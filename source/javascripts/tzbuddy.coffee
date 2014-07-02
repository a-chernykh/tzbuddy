Tzbuddy.Converter.init 'tz', 'cldr', ->
  $ ->
    process = (->
      text = $('#tzinput').val()
      if text.length > 0
        converter = new Tzbuddy.Converter
        converted = converter.convert(text)
        if converted
          local = Date.create(converted.getTime())
          $('#result').text local.format()
        else
          $('#result').text 'Invalid Date'
      else
        $('#result').text ''

    ).debounce 100
    $('#tzinput').on 'keyup', process
