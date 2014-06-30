timezoneJS.timezone.zoneFileBasePath = '/tz'
timezoneJS.timezone.init()

zones = null

$.get '/cldr/supplemental/metaZones.json', (metaZones) ->
  $.get '/cldr/main/en/timeZoneNames.json', (timeZoneNames) ->
    zones = new Tzbuddy.Zones metaZones, timeZoneNames

$ ->
  process = (->
    text = $('#tzinput').val()
    if text.length > 0
      query = new Tzbuddy.Query text, zones
      date = query.date()
      zone = zones.get(query.zone())
      tzDate = new timezoneJS.Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), zone)
      local = Date.create(tzDate.getTime())
      $('#result').text local.format()
    else
      $('#result').text ''

  ).debounce 100
  $('#tzinput').on 'keyup', process
