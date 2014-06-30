Tzbuddy.Test = {}
Tzbuddy.Test.getZones = ->
  jasmine.getJSONFixtures().fixturesPath = '/base/spec/fixtures/'
  metaZones = getJSONFixture('metaZones.json')
  timeZoneNames = getJSONFixture('timeZoneNames.json')
  new Tzbuddy.Zones metaZones, timeZoneNames
Tzbuddy.Test.initTimezoneJs = ->
  timezoneJS.timezone.zoneFileBasePath = '/base/spec/tz'
  timezoneJS.timezone.init(async: false)
