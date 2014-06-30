(function() {
  Tzbuddy.Query = (function() {
    function Query(text, zones) {
      this.text = text;
      this.zones = zones;
    }

    Query.prototype.date = function() {
      var date, zone;
      zone = this.zone();
      date = this.text.replace(new RegExp(zone, 'ig'), '');
      return Date.create(date);
    };

    Query.prototype.zone = function() {
      var allZones;
      allZones = this.zones.all();
      return allZones.findAll((function(_this) {
        return function(zone) {
          return _this.text.toLowerCase().indexOf(zone.toLowerCase()) !== -1;
        };
      })(this))[0];
    };

    return Query;

  })();

}).call(this);
