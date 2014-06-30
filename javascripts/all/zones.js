(function() {
  Tzbuddy.Zones = (function() {
    var parseMetaZones, parseTimeZoneNames;

    function Zones(metaZones, timeZoneNames) {
      var mapZone;
      this.zones = {};
      mapZone = parseMetaZones(metaZones);
      this.zones = parseTimeZoneNames(timeZoneNames, mapZone);
    }

    Zones.prototype.all = function() {
      return Object.keys(this.zones);
    };

    Zones.prototype.get = function(name) {
      return this.zones[name];
    };

    parseMetaZones = function(metaZones) {
      var mapZone;
      mapZone = {};
      metaZones['supplemental']['metaZones']['metazones'].map('mapZone').each(function(mz) {
        return mapZone[mz['_other']] = mz['_type'];
      });
      return mapZone;
    };

    parseTimeZoneNames = function(timeZoneNames, mapZone) {
      var tzNames;
      tzNames = {};
      Object.extended(timeZoneNames['main']['en']['dates']['timeZoneNames']['metazone']).each((function(_this) {
        return function(name, aliases) {
          var parseAliases;
          parseAliases = function(aliases) {
            return Object.extended(aliases).each(function(k, v) {
              return tzNames[v] = mapZone[name];
            });
          };
          if (aliases['long']) {
            parseAliases(aliases['long']);
          }
          if (aliases['short']) {
            return parseAliases(aliases['short']);
          }
        };
      })(this));
      return tzNames;
    };

    return Zones;

  })();

}).call(this);
