# password_blacklist
[![Gem Version](https://badge.fury.io/rb/password_blacklist.svg)](http://badge.fury.io/rb/password_blacklist) [![Dependency Status](https://gemnasium.com/gchan/password_blacklist.svg?branch=master)](https://gemnasium.com/gchan/password_blacklist) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

[![Build Status](https://travis-ci.org/gchan/password_blacklist.svg?branch=master)](https://travis-ci.org/gchan/password_blacklist) [![Coverage Status](https://coveralls.io/repos/gchan/password_blacklist/badge.svg?branch=master)](https://coveralls.io/r/gchan/password_blacklist?branch=master) [![Code Climate](https://codeclimate.com/github/gchan/password_blacklist/badges/gpa.svg)](https://codeclimate.com/github/gchan/password_blacklist)

Check the presence of a string in a blacklist of the top 95,000 commonly used passwords (sourced from berzerk0
's [Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists)).

This very simple Ruby library can be integrated into your registration/authentication system to prevent users from setting commonly used (and easy to guess) passwords.

This gem has an insignificant memory footprint with an execution cost of approximately 1 ms. A memory persistence option is available to further reduce execution time.

## Devise Extension

Use [`devise_password_blacklist`](https://www.github.com/gchan/devise_password_blacklist) to easily add password blacklisting to your Rails application.

## Installation

Gemfile:

```ruby
gem 'password_blacklist'
```

Or install it yourself:

    $ gem install password_blacklist

## Usage

```ruby
$ irb
require 'password_blacklist'

PasswordBlacklist.blacklisted?("pokemon")
=> true

PasswordBlacklist.blacklisted?("AccurateUnicornCoalPaperclip")
=> false
```

### Test multiple passwords

The blacklist file is loaded on every call to `PasswordBlacklist.blacklisted?`. Use `PasswordBlacklist::Checker` to persist the blacklist in memory (approximately 0.8MB) if you would like to perform lots of password tests in quick succession.

```ruby
require 'password_blacklist'

checker = PasswordBlacklist::Checker.new
=> #<PasswordBlacklist::Checker:0x3ff979c41758>

checker.blacklisted?("pokemon")
=> true

checker.blacklisted?("AccurateUnicornCoalPaperclip")
=> false
```

## Supported Ruby versions

password_blacklist supports MRI Ruby 2.x. The specific Ruby versions we build and test on can be found at [TravisCI](https://travis-ci.org/gchan/password_blacklist).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` or `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Use `bin/benchmark` to run some benchmarks.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Run `bundle exec rake spec` to manually launch specs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://www.github.com/gchan/password_blacklist.

1. Fork it ( https://github.com/gchan/password_blacklist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Licenses

password_blacklist is Copyright (c) 2017 Gordon Chan and is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Top95Thousand-probable.txt is licensed under CC BY-SA 4.0 (Creative Commons Attribution-ShareAlike 4.0 International)

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/password_blacklist/README.md?flat)](https://github.com/igrigorik/ga-beacon)
