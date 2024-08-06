# NDBWeather

The source code for my tweak that redirects Weather app data requests to a server of your choice.

This project was only tested on ios 6.0.1 but could work up to 6.1.6

This was designed to redirect the normal Weather app requests to my server Notdbrand.com:8000

To use this for yourself all your need to do is swap out my server url and port and insert your own. Then all you need do to is make the package using theos.

I am using YQL-X-Server to manage the Weather data.

Known Issue (Will be fixed in the future):
Weather widget doesn't work yet.
