# password_blocklist
[![Gem Version](https://badge.fury.io/rb/password_blocklist.svg)](http://badge.fury.io/rb/password_blocklist) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

[![Ruby Tests on Github Actions](https://github.com/gchan/password_blocklist/actions/workflows/ruby.yml/badge.svg)](https://github.com/gchan/password_blocklist/actions/workflows/ruby.yml) [![Coverage Status](https://coveralls.io/repos/github/gchan/password_blocklist/badge.svg?branch=main)](https://coveralls.io/github/gchan/password_blocklist?branch=main) [![Code Climate](https://codeclimate.com/github/gchan/password_blocklist/badges/gpa.svg)](https://codeclimate.com/github/gchan/password_blocklist)

Check the presence of a string in a blocklist of the most commonly used passwords (sourced from berzerk0
's [Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists)). Different sized lists are
supported, with the default list containing 95,000 passwords.

This very simple Ruby library can be integrated into your registration/authentication system to prevent users from setting commonly used (and easy to guess) passwords.

This gem has a tiny memory footprint with an execution cost of approximately 1 ms for the default list size. A memory persistence option is available to further reduce execution time.

## Installation

Gemfile:

```ruby
gem 'password_blocklist'
```

Or install it yourself:

    $ gem install password_blocklist

## Usage

```ruby
$ irb
require 'password_blocklist'

PasswordBlocklist.blocklisted?("pokemon")
=> true

PasswordBlocklist.blocklisted?("AccurateUnicornCoalPaperclip")
=> false
```
### Optional list size selection

Pass a `list_size` parameter to select a different list than the default (medium) size

```ruby
PasswordBlocklist.blocklisted?('pokemon', :lg)
```

| list_size    | File name                        | File size | Passwords
| ----         | ----                             | ----      | ----
| xs           | `Top1575-probable-v2.txt`        | 12 KB     | 1,575
| sm           | `Top12Thousand-probable-v2.txt`  | 100 KB    | 12,645
| md (default) | `Top95Thousand-probable.txt`     | 822 KB    | 94,988
| lg           | `Top304Thousand-probable-v2.txt` | 2.8 MB    | 303,872
| xl           | `Top1pt6Million-probable-v2.txt` | 15.9 MB   | 1,667,462

Note the list size you select will use more memory and linearly affect
the processing time.

### Test multiple passwords

The blocklist file is loaded on every call to `PasswordBlocklist.blocklisted?`. Use `PasswordBlocklist::Checker` to persist the blocklist in memory (approximately 0.8MB) if you would like to perform lots of password tests in quick succession.

```ruby
require 'password_blocklist'

checker = PasswordBlocklist::Checker.new
=> #<PasswordBlocklist::Checker:0x3ff979c41758>

checker.blocklisted?("pokemon")
=> true

checker.blocklisted?("AccurateUnicornCoalPaperclip")
=> false
```

You can also use a list size other than the default 'md' list

```ruby
checker = PasswordBlocklist::Checker.new(:xl)
=> #<PasswordBlocklist::Checker:0x3ff979c41758>

checker.blocklisted?("pokemon")
=> true
```

## Supported Ruby versions

password_blocklist supports MRI Ruby 2.5+ and Ruby 3.x. The specific Ruby versions we build and test on can be found on this Github Action [workflow file](https://github.com/gchan/password_blocklist/blob/main/.github/workflow/ruby.yml).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` or `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Use `bin/benchmark` to run some benchmarks.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Run `bundle exec rake spec` to manually launch specs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://www.github.com/gchan/password_blocklist.

1. Fork it ( https://github.com/gchan/password_blocklist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Licenses

password_blocklist is Copyright (c) 2017 Gordon Chan and is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

The [Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists) data files are licensed under CC BY-SA 4.0 (Creative Commons Attribution-ShareAlike 4.0 International)

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/password_blocklist/README.md?flat)](https://github.com/igrigorik/ga-beacon)
