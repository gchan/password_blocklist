# password_blacklist
[![Gem Version](https://badge.fury.io/rb/password_blacklist.svg)](http://badge.fury.io/rb/password_blacklist) [![Dependency Status](https://gemnasium.com/gchan/password_blacklist.svg?branch=main)](https://gemnasium.com/gchan/password_blacklist) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

[![Build Status](https://travis-ci.org/gchan/password_blacklist.svg?branch=main)](https://travis-ci.org/gchan/password_blacklist) [![Coverage Status](https://coveralls.io/repos/gchan/password_blacklist/badge.svg?branch=main)](https://coveralls.io/r/gchan/password_blacklist?branch=main) [![Code Climate](https://codeclimate.com/github/gchan/password_blacklist/badges/gpa.svg)](https://codeclimate.com/github/gchan/password_blacklist)

Check the presence of a string in a blacklist of the most commonly used passwords (sourced from berzerk0
's [Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists)).

This very simple Ruby library can be integrated into your registration/authentication system to prevent users from setting commonly used (and easy to guess) passwords.

This gem has a tiny memory footprint with an execution cost of approximately 1 ms for the default list size. A memory persistence option is available to further reduce execution time.

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
### Optional List Size Selection

Pass a `list_size` parameter to select a different list than the default (medium) size:
  ```ruby
  # PasswordBlacklist.blacklisted?(password, list_size)
  # e.g.
  PasswordBlacklist.blacklisted?('pokemon', 'lg')
  ```

| list_size | File name | File size|
| ---- | ---- | ----|
| xs | `Top1575-probable-v2.txt` | 12 KB |
| sm | `Top12Thousand-probable-v2.txt` | 100 KB |
| md (default) | `Top95Thousand-probable.txt` | 822 KB |
| lg | `Top304Thousand-probable-v2.txt` | 2.8 MB |
| xl | `Top1pt6Million-probable-v2.txt` | 15.9 MB |

Note: The list size you select will impact memory footprint and processing time.
Here is a comparison, for example, of the medium (default), and large lists:

  ```
  841.74 kB allocated on 95k wordlist # 'md' memory
  2.83 MB allocated on 304k wordlist (~3.36x more) # 'lg' memory

  2110.9 i/s on 95k wordlist # 'md' speed
  613.7 i/s on 304 wordlist (~3.44x slower). # 'lg' speed
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

The [Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists) data files are licensed under CC BY-SA 4.0 (Creative Commons Attribution-ShareAlike 4.0 International)

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/password_blacklist/README.md?flat)](https://github.com/igrigorik/ga-beacon)
