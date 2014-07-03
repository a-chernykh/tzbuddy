Tzbuddy.Converter.init 'tz', 'cldr', ->
  $ ->
    process = (->
      text = $('#tzinput').val()
      if text.length > 0
        converter = new Tzbuddy.Converter
        converted = converter.convert(text)
        if converted
          $('#result').text converted.toDateString() + ', ' + converted.toTimeString()
        else
          $('#result').text 'Invalid Date'
      else
        $('#result').text ''

    ).debounce 100
    $('#tzinput').on 'keyup', process
    $('a').on 'click', (e) ->
      e.preventDefault()
      $('#tzinput').val $(this).text()
      $('#tzinput').trigger 'keyup'
