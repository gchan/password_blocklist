require 'password_blacklist/version'
require 'password_blacklist/checker'
require 'logger'

module PasswordBlacklist
  module_function

  Logger.new(STDOUT).warn(
    "password_blacklist has been renamed to password_blacklist. Please " \
    "switch to password_blocklist for continued support and new features. " \
    "Migration guide can be found in the README."
  )

  def blacklisted?(password)
    Checker.new.blacklisted?(password)
  end
end
