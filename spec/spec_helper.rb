require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
)

SimpleCov.start

require 'password_blacklist'
