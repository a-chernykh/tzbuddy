# timezoneJS.timezone.zoneFileBasePath = 'http://localhost:4567/tz'
# timezoneJS.timezone.init()

# $ ->
#   $('#tzinput').on 'change', ->
#     query = new Query $('#tzinput').val()
#     dt1 = new timezoneJS.Date query.date(), query.zone()
#     dt1.setTimezone 'America/Los_Angeles'
#     console.log dt1

$.get '/cldr/supplemental/metaZones.json', (metaZones) ->
  $.get '/cldr/main/en/timeZoneNames.json', (timeZoneNames) ->
    zones = new Tzbuddy.Zones metaZones, timeZoneNames
    console.log zones.get('PST')
