require 'password_blacklist/version'
require 'password_blacklist/checker'

module PasswordBlacklist
  module_function

  def blacklisted?(password)
    Checker.new.blacklisted?(password)
  end
end
