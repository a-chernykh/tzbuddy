(function() {
  var zones;

  timezoneJS.timezone.zoneFileBasePath = '/tz';

  timezoneJS.timezone.init();

  zones = null;

  $.get('/cldr/supplemental/metaZones.json', function(metaZones) {
    return $.get('/cldr/main/en/timeZoneNames.json', function(timeZoneNames) {
      return zones = new Tzbuddy.Zones(metaZones, timeZoneNames);
    });
  });

  $(function() {
    var process;
    process = (function() {
      var date, local, query, text, tzDate, zone;
      text = $('#tzinput').val();
      if (text.length > 0) {
        query = new Tzbuddy.Query(text, zones);
        date = query.date();
        zone = zones.get(query.zone());
        tzDate = new timezoneJS.Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), zone);
        local = Date.create(tzDate.getTime());
        return $('#result').text(local.format());
      } else {
        return $('#result').text('');
      }
    }).debounce(100);
    return $('#tzinput').on('keyup', process);
  });

}).call(this);
