describe 'Zones', ->
  beforeEach -> @zones = Tzbuddy.Test.getZones()

  describe 'all', ->
    it 'includes PST', -> expect(@zones.all()).toContain 'PST'
    it 'includes PDT', -> expect(@zones.all()).toContain 'PDT'
    it 'includes Moscow Time', -> expect(@zones.all()).toContain 'Moscow Time'

  describe 'get', ->
    it 'returns America/Vancouver for PST', -> expect(@zones.get('PST')).toBe 'America/Vancouver'
    it 'returns America/Vancouver for PDT', -> expect(@zones.get('PDT')).toBe 'America/Vancouver'
    it 'returns America/Toronto for EST', -> expect(@zones.get('EST')).toBe 'America/Toronto'
    it 'returns America/Hermosillo for MST', -> expect(@zones.get('MST')).toBe 'America/Hermosillo'
