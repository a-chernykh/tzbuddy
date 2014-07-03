class Tzbuddy.Query
  constructor: (@text, @zones) -> 
    @allZones = @zones.all()
    @lowerText = @text.toLowerCase()
    @_parse()
  getDate: -> @date
  getZone: -> @zone
  getTargetZone: -> @targetZone
  _parse: ->
    @targetZone = @_parseTargetZone()
    @lowerText = @lowerText.replace(new RegExp('to ' + @targetZone, 'gi'), '') if @targetZone

    @zone = @allZones.findAll((zone) => @lowerText.indexOf(zone.toLowerCase()) != -1)[0]
    @lowerText = @lowerText.replace(new RegExp(@zone, 'gi'), '')

    date = Date.create(@lowerText)
    @date = if date.toString() == 'Invalid Date' then null else date
  _parseTargetZone: ->
    toStart = @lowerText.indexOf 'to '
    if toStart != -1
      possibleZoneStart = toStart + 3
      possibleZoneEnd = @lowerText.length
      possibleZone = @lowerText.substring(possibleZoneStart, possibleZoneEnd)
      @allZones.findAll((zone) => possibleZone.indexOf(zone.toLowerCase()) != -1)[0]
