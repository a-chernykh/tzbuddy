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

    it 'converts 07/05/2014 10pm Moscow Time to PST', ->
      converter = new Tzbuddy.Converter
      pst = converter.convert '07/05/2014 10pm Moscow Time to PST'
      expect(pst.getFullYear()).toBe 2014
      expect(pst.getDate()).toBe 5
      expect(pst.getMonth()).toBe 6
      expect(pst.getHours()).toBe 11
      expect(pst.getMinutes()).toBe 0

    it 'converts 10pm 07/03 Moscow Time to Pacific Time', ->
      converter = new Tzbuddy.Converter
      pst = converter.convert '10pm 07/03 Moscow Time to Pacific Time'
      expect(pst.getFullYear()).toBe 2014
      expect(pst.getDate()).toBe 3
      expect(pst.getMonth()).toBe 6
      expect(pst.getHours()).toBe 11
      expect(pst.getMinutes()).toBe 0

    it 'returns null for invalid dates', ->
      converter = new Tzbuddy.Converter
      local = converter.convert 'some invalid date', 'PDT'
      expect(local).toBe null
