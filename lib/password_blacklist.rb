require 'password_blacklist/version'
require 'password_blacklist/checker'

module PasswordBlacklist
  module_function

  def blacklisted?(password, list_size = :md)
    Checker.new.blacklisted?(password, list_size)
  end
end
