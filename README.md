# tzbuddy

[tzbuddy] is a small utility which helps to convert any date and time in any timezone into your local time. You can paste some date like `10am PST this Tuesday` and it will return the time in your local timezone: `July 1, 2014 9:00pm`. Time conversion is a simple task using server which has an access to [tzdata], but [tzbuddy] does it with pure JavaScript.

## Bootstrap

### tzdata

You should download latest [tzdata] which is used by [timezone-js]. Here how it can be done:

```bash
mkdir source/tz
curl ftp://ftp.iana.org/tz/tzdata-latest.tar.gz -o source/tz/tzdata-latest.tar.gz
tar -xvzf source/tz/tzdata-latest.tar.gz -C source/tz
rm -f source/tz/tzdata-latest.tar.gz
```

### cldr

[cldr] is a largest locale repository available. It contains the list of time zone abbreviations which we use to map to the [tzdata] zones. It can be downloaded using the following script:

```bash
mkdir source/cldr
curl http://www.unicode.org/Public/cldr/25/json.zip -o source/cldr/json.zip
unzip -d source/cldr source/cldr/json.zip
rm -f source/cldr/json.zip
```

## Usage

It should be asynchronously initialized with JSON paths first:

```javascript
Tzbuddy.Converter.init('tz', 'cldr', function() {
  alert('I am ready');

  converter = new Tzbuddy.Converter;
  converter.convert('10am PST this Tuesday', 'Moscow Time'); // returns timezoneJS.Date object in Moscow timezone
  alert(Date.create(converted.getTime()).format()); // prints "July 1, 2014 9:00pm"
});
```

Where `tz` and `cldr` are paths to `tzdata` and `cldr` on your webserver.

## Tests

You should start [middleman] first:

```bash
bundle exec middleman server
```

Unit tests are handled by [karma]:

```bash
karma start karma.conf.js
```

End to end testing handled by [nightwatch]:

```bash
./nightwatch
```

[tzbuddy]: http://andrey.chernih.me/tzbuddy/
[tzdata]: http://www.iana.org/time-zones
[timezone-js]: https://github.com/mde/timezone-js
[cldr]: http://cldr.unicode.org/
[middleman]: http://middlemanapp.com/
[karma]: http://karma-runner.github.io
[nightwatch]: http://nightwatchjs.org
