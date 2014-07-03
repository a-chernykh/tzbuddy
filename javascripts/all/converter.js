(function() {
  Tzbuddy.Converter = (function() {
    function Converter() {}

    Converter._zones = null;

    Converter.getZones = function() {
      return this._zones;
    };

    Converter.init = function(tzdataPath, cldrPath, readyCallback) {
      var metaZonesReq, timeZoneNamesReq;
      timezoneJS.timezone.zoneFileBasePath = tzdataPath;
      timezoneJS.timezone.init();
      metaZonesReq = $.get("" + cldrPath + "/supplemental/metaZones.json");
      timeZoneNamesReq = $.get("" + cldrPath + "/main/en/timeZoneNames.json");
      return $.when(metaZonesReq, timeZoneNamesReq).then(function(metaZonesJson, timeZoneNamesJson) {
        Converter._zones = new Tzbuddy.Zones(metaZonesJson[0], timeZoneNamesJson[0]);
        return readyCallback();
      });
    };

    Converter.prototype.convert = function(input, toZone) {
      var date, fromZone, query, tzDate;
      query = new Tzbuddy.Query(input, Converter._zones);
      date = query.getDate();
      if (date) {
        fromZone = Converter._zones.get(query.getZone());
        tzDate = new timezoneJS.Date(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), fromZone);
        if (toZone == null) {
          toZone = query.getTargetZone();
        }
        if (toZone) {
          toZone = Converter._zones.get(toZone);
          return new timezoneJS.Date(tzDate, toZone);
        } else {
          return new timezoneJS.Date(tzDate.getTime());
        }
      } else {
        return null;
      }
    };

    return Converter;

  })();

}).call(this);
