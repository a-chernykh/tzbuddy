describe 'Query', ->
  beforeEach ->
    Tzbuddy.Test.initTimezoneJs()
    @zones = Tzbuddy.Test.getZones()

  describe 'date parsing', ->
    it 'parses 07/01/2014 10:00 PST', ->
      query = new Tzbuddy.Query '07/01/2014 10:00 PST', @zones
      expect(query.date().getFullYear()).toBe 2014
      expect(query.date().getDate()).toBe 1
      expect(query.date().getMonth()).toBe 6
      expect(query.date().getHours()).toBe 10
      expect(query.date().getMinutes()).toBe 0

    it 'parses 07/01/2014 10:00 PST', ->
      query = new Tzbuddy.Query '10am PST this Tuesday', @zones
      expect(query.date().getFullYear()).toBe 2014
      expect(query.date().getDate()).toBe 1
      expect(query.date().getMonth()).toBe 6
      expect(query.date().getHours()).toBe 10
      expect(query.date().getMinutes()).toBe 0

    it 'parses 07/01 10am PST', ->
      query = new Tzbuddy.Query '07/01 10am PST', @zones
      expect(query.date().getFullYear()).toBe 2014
      expect(query.date().getDate()).toBe 1
      expect(query.date().getMonth()).toBe 6
      expect(query.date().getHours()).toBe 10
      expect(query.date().getMinutes()).toBe 0

    it 'parses 07/01 10am PST', ->
      query = new Tzbuddy.Query 'July, 1st 10am PST', @zones
      expect(query.date().getFullYear()).toBe 2014
      expect(query.date().getDate()).toBe 1
      expect(query.date().getMonth()).toBe 6
      expect(query.date().getHours()).toBe 10
      expect(query.date().getMinutes()).toBe 0

  describe 'zone parsing', ->
    it 'parses Tuesday 7/1 at 10am PST', ->
      query = new Tzbuddy.Query 'Tuesday 7/1 at 10am PST', @zones
      expect(query.zone()).toBe 'PST'

    it 'parses 2014/05/01 10am Pacific Time', ->
      query = new Tzbuddy.Query '2014/05/01 10am Pacific Time', @zones
      expect(query.zone()).toBe 'Pacific Time'

    it 'parses 2014/05/01 10am Eastern Time', ->
      query = new Tzbuddy.Query '2014/05/01 10am Eastern Time', @zones
      expect(query.zone()).toBe 'Eastern Time'
