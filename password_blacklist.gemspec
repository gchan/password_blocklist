# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_blacklist/version'

Gem::Specification.new do |spec|
  spec.name          = 'password_blacklist'
  spec.version       = PasswordBlacklist::VERSION
  spec.authors       = ['Gordon Chan']
  spec.email         = ['developer.gordon+github@gmail.com']

  spec.summary       = 'Checks a password against a blacklist.'
  spec.description   = 'A simple Ruby library to check if a given string is
    present in a blacklist of common passwords. Defaults to a 95k password
    list, but different size lists can be selected.'
  spec.homepage      = 'https://www.github.com/gchan/password_blacklist'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*.rb'] + Dir['data/*'] +
               %w(password_blacklist.gemspec CHANGELOG.md LICENSE.txt README.md)

  spec.bindir        = 'bin'
  spec.require_paths = ['lib']
  spec.platform      = Gem::Platform::RUBY

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler', ">= 2.2.10"
  spec.add_development_dependency 'rake', ">= 12.3.3"

  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.8.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
  spec.add_development_dependency 'benchmark-ips', '~> 2.10.0'
  spec.add_development_dependency 'memory_profiler', '~> 1.0.0'
end
