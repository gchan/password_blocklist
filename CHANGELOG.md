0.5.0 / 2022-04-02
------
* Support different sized blocklists as an option. Thanks roberttravispierce!
* Renamed password_blacklist to password_blocklist.

0.4.1 / 2022-04-02
------
* Added a post-install message and deprecation message regarding renaming
this library.
* No other functional changes.

0.4.0 / 2021-08-10
------
* Support Ruby 3.0. Thanks matssigge!
* Update simplecov and coveralls development dependency versions. Thanks matssigge!
* Update rake and bundler development dependency versions.
* Fix benchmark code.
* Add memory profiler to compare String, Array and Set.

0.3.0 / 2017-07-13
------
* Use the "Probable-Wordlists" (https://github.com/berzerk0/Probable-Wordlists) wordlist. Thanks olbrich!

0.2.0 / 2017-07-12
------
* Ignore password case sensitivity when testing a password. Thanks olbrich!

0.1.1 / 2017-06-27
------
* Escape regular expression characters when checking passwords. Thanks mmzoo!

0.1.0 / 2017-02-01
------
* Rename `test` methods to `blocklisted?`.
* Rename `PasswordBlocklist::Tester` to `PasswordBlocklist::Checker`.
* Update README.
* Minor changes to resolve Rubcop violations.

0.1.0.pre / 2017-01-20
------
* First release
