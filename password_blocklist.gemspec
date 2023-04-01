# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_blocklist/version'

Gem::Specification.new do |spec|
  spec.name          = 'password_blocklist'
  spec.version       = PasswordBlocklist::VERSION
  spec.authors       = ['Gordon Chan']
  spec.email         = ['developer.gordon+github@gmail.com']

  spec.summary       = 'Checks a password against a blocklist.'
  spec.description   = 'A simple Ruby library to check if a given string is
    present in a blocklist of common passwords. Defaults to a 95k password
    list, but different size lists can be selected.'
  spec.homepage      = 'https://www.github.com/gchan/password_blocklist'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*.rb'] + Dir['data/*'] +
               %w[password_blocklist.gemspec CHANGELOG.md LICENSE.txt README.md]

  spec.bindir        = 'bin'
  spec.require_paths = ['lib']
  spec.platform      = Gem::Platform::RUBY

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler', '>= 2.2.10'
  spec.add_development_dependency 'rake', '>= 12.3.3'

  spec.add_development_dependency 'benchmark-ips', '~> 2.11.0'
  spec.add_development_dependency 'memory_profiler', '~> 1.0.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rubocop', '~> 1.48.1'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.9.0'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.8.0'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
