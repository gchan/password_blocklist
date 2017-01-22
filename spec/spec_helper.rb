require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
)

# No JRuby support for SimpleCov
# https://github.com/metricfu/metric_fu/commit/2248706
unless defined?(JRUBY_VERSION)
  SimpleCov.start do
    add_filter '/spec/'
    # Travis configures bundler to install dependencies in vendor
    # https://github.com/colszowka/simplecov/issues/360
    add_filter '/vendor/'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'password_blacklist'
