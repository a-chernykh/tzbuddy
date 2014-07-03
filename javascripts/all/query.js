(function() {
  Tzbuddy.Query = (function() {
    function Query(text, zones) {
      this.text = text;
      this.zones = zones;
      this.allZones = this.zones.all();
      this.lowerText = this.text.toLowerCase();
      this._parse();
    }

    Query.prototype.getDate = function() {
      return this.date;
    };

    Query.prototype.getZone = function() {
      return this.zone;
    };

    Query.prototype.getTargetZone = function() {
      return this.targetZone;
    };

    Query.prototype._parse = function() {
      var date;
      this.targetZone = this._parseTargetZone();
      if (this.targetZone) {
        this.lowerText = this.lowerText.replace(new RegExp('to ' + this.targetZone, 'gi'), '');
      }
      this.zone = this.allZones.findAll((function(_this) {
        return function(zone) {
          return _this.lowerText.indexOf(zone.toLowerCase()) !== -1;
        };
      })(this))[0];
      this.lowerText = this.lowerText.replace(new RegExp(this.zone, 'gi'), '');
      date = Date.create(this.lowerText);
      return this.date = date.toString() === 'Invalid Date' ? null : date;
    };

    Query.prototype._parseTargetZone = function() {
      var possibleZone, possibleZoneEnd, possibleZoneStart, toStart;
      toStart = this.lowerText.indexOf('to ');
      if (toStart !== -1) {
        possibleZoneStart = toStart + 3;
        possibleZoneEnd = this.lowerText.length;
        possibleZone = this.lowerText.substring(possibleZoneStart, possibleZoneEnd);
        return this.allZones.findAll((function(_this) {
          return function(zone) {
            return possibleZone.indexOf(zone.toLowerCase()) !== -1;
          };
        })(this))[0];
      }
    };

    return Query;

  })();

}).call(this);
