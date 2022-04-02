# frozen_string_literal: true

require 'simplecov'
require 'simplecov-lcov'
require 'simplecov_json_formatter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::LcovFormatter,
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter
  ]
)

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov::Formatter::LcovFormatter.config.single_report_path = 'coverage/lcov.info'

SimpleCov.start

require 'password_blacklist'
