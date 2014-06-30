class Tzbuddy.Query
  constructor: (@text, @zones) ->
  date: ->
    zone = @zone()
    date = @text.replace(zone, '')
    Date.create(date)
  zone: ->
    allZones = @zones.all()
    allZones.findAll((zone) => @text.toLowerCase().indexOf(zone.toLowerCase()) != -1)[0]
