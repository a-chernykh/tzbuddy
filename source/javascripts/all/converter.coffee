class Tzbuddy.Converter
  @_zones: null
  @getZones: -> @_zones
  @init: (tzdataPath, cldrPath, readyCallback) ->
    timezoneJS.timezone.zoneFileBasePath = tzdataPath
    timezoneJS.timezone.init()

    metaZonesReq = $.get "#{cldrPath}/supplemental/metaZones.json"
    timeZoneNamesReq = $.get "#{cldrPath}/main/en/timeZoneNames.json"
    $.when(metaZonesReq, timeZoneNamesReq).then (metaZonesJson, timeZoneNamesJson) ->
      Converter._zones = new Tzbuddy.Zones metaZonesJson[0], timeZoneNamesJson[0]
      readyCallback()

  convert: (input, toZone) ->
    query = new Tzbuddy.Query input, Converter._zones
    date = query.date()
    fromZone = Converter._zones.get(query.zone())
    tzDate = new timezoneJS.Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), fromZone)
    if toZone
      toZone = Converter._zones.get(toZone)
      new timezoneJS.Date(tzDate, toZone)
    else
      tzDate
