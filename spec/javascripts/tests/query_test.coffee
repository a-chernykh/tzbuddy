describe 'Query', ->
  beforeEach ->
    Tzbuddy.Test.initTimezoneJs()
    @zones = Tzbuddy.Test.getZones()

  describe 'date parsing', ->
    it 'parses 07/01/2014 10:00 PST', ->
      query = new Tzbuddy.Query '07/01/2014 10:00 PST', @zones
      expect(query.getDate().getFullYear()).toBe 2014
      expect(query.getDate().getDate()).toBe 1
      expect(query.getDate().getMonth()).toBe 6
      expect(query.getDate().getHours()).toBe 10
      expect(query.getDate().getMinutes()).toBe 0

    it 'parses 07/01/2014 10:00 PST', ->
      query = new Tzbuddy.Query '10am PST this Tuesday', @zones
      expect(query.getDate().getFullYear()).toBe 2014
      expect(query.getDate().getDate()).toBe 1
      expect(query.getDate().getMonth()).toBe 6
      expect(query.getDate().getHours()).toBe 10
      expect(query.getDate().getMinutes()).toBe 0

    it 'parses 07/01 10am PST', ->
      query = new Tzbuddy.Query '07/01 10am PST', @zones
      expect(query.getDate().getFullYear()).toBe 2014
      expect(query.getDate().getDate()).toBe 1
      expect(query.getDate().getMonth()).toBe 6
      expect(query.getDate().getHours()).toBe 10
      expect(query.getDate().getMinutes()).toBe 0

    it 'parses 07/01 10am PST', ->
      query = new Tzbuddy.Query 'July, 1st 10am PST', @zones
      expect(query.getDate().getFullYear()).toBe 2014
      expect(query.getDate().getDate()).toBe 1
      expect(query.getDate().getMonth()).toBe 6
      expect(query.getDate().getHours()).toBe 10
      expect(query.getDate().getMinutes()).toBe 0

    it 'parses 07/01 10am Pacific time', ->
      query = new Tzbuddy.Query '07/01 10am Pacific time', @zones
      expect(query.getDate().getFullYear()).toBe 2014
      expect(query.getDate().getDate()).toBe 1
      expect(query.getDate().getMonth()).toBe 6
      expect(query.getDate().getHours()).toBe 10
      expect(query.getDate().getMinutes()).toBe 0

    it 'returns null for incorrect date', ->
      query = new Tzbuddy.Query 'some incorrect date', @zones
      expect(query.getDate()).toBe null

  describe 'source zone parsing', ->
    it 'parses Tuesday 7/1 at 10am PST', ->
      query = new Tzbuddy.Query 'Tuesday 7/1 at 10am PST', @zones
      expect(query.getZone()).toBe 'PST'

    it 'parses 2014/05/01 10am Pacific Time', ->
      query = new Tzbuddy.Query '2014/05/01 10am Pacific Time', @zones
      expect(query.getZone()).toBe 'Pacific Time'

    it 'parses last Friday 10am Pacific time', ->
      query = new Tzbuddy.Query 'last Friday 10am Pacific time', @zones
      expect(query.getZone()).toBe 'Pacific Time'

    it 'parses 2014/05/01 10am Eastern Time', ->
      query = new Tzbuddy.Query '2014/05/01 10am Eastern Time', @zones
      expect(query.getZone()).toBe 'Eastern Time'

  describe 'target zone parsing', ->
    it 'parses Tuesday 7/1 at 10am PST to Moscow Time', ->
      query = new Tzbuddy.Query 'Tuesday 7/1 10am PST to Moscow Time', @zones
      expect(query.getZone()).toBe 'PST'
      expect(query.getTargetZone()).toBe 'Moscow Time'

    it 'parses Tuesday 7/1 at 10am Moscow Time to Pacific Time', ->
      query = new Tzbuddy.Query 'Tuesday 7/1 10am Moscow Time to Pacific Time', @zones
      expect(query.getZone()).toBe 'Moscow Time'
      expect(query.getTargetZone()).toBe 'Pacific Time'
