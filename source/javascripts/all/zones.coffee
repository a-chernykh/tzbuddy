class Tzbuddy.Zones
  constructor: (metaZones, timeZoneNames) ->
    @zones = {}
    mapZone = parseMetaZones(metaZones)
    @zones = parseTimeZoneNames(timeZoneNames, mapZone)

  all: -> Object.keys(@zones)

  get: (name) -> @zones[name]

  parseMetaZones = (metaZones) ->
    mapZone = {}
    metaZones['supplemental']['metaZones']['metazones'].map('mapZone').each (mz) -> mapZone[mz['_other']] = mz['_type']
    mapZone

  parseTimeZoneNames = (timeZoneNames, mapZone) ->
    tzNames = {}
    Object.extended(timeZoneNames['main']['en']['dates']['timeZoneNames']['metazone']).each (name, aliases) =>
      parseAliases = (aliases) -> Object.extended(aliases).each (k, v) -> tzNames[v] = mapZone[name]
      parseAliases(aliases['long']) if aliases['long']
      parseAliases(aliases['short']) if aliases['short']
    tzNames
