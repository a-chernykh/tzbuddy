describe 'Converter', ->
  beforeEach (done) -> Tzbuddy.Converter.init '/base/source/tz', '/base/source/cldr', done

  describe 'convert to local time', ->
    it 'converts 07/01/2014 10:00 PST to Moscow Time', ->
      converter = new Tzbuddy.Converter
      local = converter.convert '07/01/2014 10:00 PST', 'Moscow Time'
      expect(local.getFullYear()).toBe 2014
      expect(local.getDate()).toBe 1
      expect(local.getMonth()).toBe 6
      expect(local.getHours()).toBe 21
      expect(local.getMinutes()).toBe 0

    it 'converts 07/01/2014 10:00 PST to EST', ->
      converter = new Tzbuddy.Converter
      local = converter.convert '07/01/2014 10:00 PST', 'EST'
      expect(local.getFullYear()).toBe 2014
      expect(local.getDate()).toBe 1
      expect(local.getMonth()).toBe 6
      expect(local.getHours()).toBe 13
      expect(local.getMinutes()).toBe 0

    it 'converts 07/05/2014 5pm EST to PDT', ->
      converter = new Tzbuddy.Converter
      local = converter.convert '07/05/2014 5pm EST', 'PDT'
      expect(local.getFullYear()).toBe 2014
      expect(local.getDate()).toBe 5
      expect(local.getMonth()).toBe 6
      expect(local.getHours()).toBe 14
      expect(local.getMinutes()).toBe 0
