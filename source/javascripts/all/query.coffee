class Tzbuddy.Query
  constructor: (@text, @zones) ->
  date: ->
    zone = @zone()
    date = @text.replace(new RegExp(zone, 'ig'), '')
    date = Date.create(date)
    if date.toString() == 'Invalid Date' then null else date
  zone: ->
    allZones = @zones.all()
    allZones.findAll((zone) => @text.toLowerCase().indexOf(zone.toLowerCase()) != -1)[0]
