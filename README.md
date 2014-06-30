# tzbuddy

[tzbuddy] is a small utility which helps to convert any date and time in any timezone into your local time.

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

[tzdata]: http://www.iana.org/time-zones
[timezone-js]: https://github.com/mde/timezone-js
[cldr]: http://cldr.unicode.org/
