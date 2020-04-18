# Wifimap
[![Build Status](https://travis-ci.com/gpaddis/wifimap.svg?branch=master)](https://travis-ci.com/gpaddis/wifimap)
[![Coverage Status](https://coveralls.io/repos/github/gpaddis/wifimap/badge.svg?branch=master)](https://coveralls.io/github/gpaddis/wifimap?branch=master)

Parse wifi dump files and get a structured collection of access points and stations, including probes and associations (see [supported dump formats](#supported-dump-formats)). You can then import the formatted data into your application, e.g. to build a database or a map of wireless networks and clients.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wifimap'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wifimap

## Usage

Require wifimap and pass the content of a dump file to the `parse` method:
```rb
require 'wifimap'

dump = File.read('airodump.csv')
parsed = Wifimap.parse(dump)
# Alternative:
# parsed = Wifimap.parse_file('airodump.csv')

parsed.access_points  # returns an array of AccessPoint objects
parsed.stations       # returns an array of Station objects
```

### Attributes

An AccessPoint instance contains the following attributes:

```rb
access_point.bssid         # ex.: '04:F0:21:13:32:29'
access_point.privacy       # ex.: 'WPA2'
access_point.essid         # ex.: 'Home Network'
access_point.manufacturer  # ex.: 'Compex Systems Pte Ltd'
```

A Station instance contains the following attributes:

```rb
station.mac           # ex.: 'AE:91:B5:23:87:9D'
station.associations  # ex.: ['04:F0:21:13:32:29']
station.probes        # ex.: ['Home Network']
station.manufacturer  # ex.: 'Apple, Inc.'
```

### Supported dump formats
- Airodump CSV ([airodump-ng](https://www.aircrack-ng.org/doku.php?id=airodump-ng))
- Sniff Probes ([sniff-probes](https://github.com/brannondorsey/sniff-probes))

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gpaddis/wifimap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wifimap/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wifimap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wifimap/blob/master/CODE_OF_CONDUCT.md).
