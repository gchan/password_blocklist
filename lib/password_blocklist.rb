# frozen_string_literal: true

require 'password_blocklist/version'
require 'password_blocklist/checker'

module PasswordBlocklist
  module_function

  def blocklisted?(password, list_size = :md)
    Checker.new.blocklisted?(password, list_size)
  end
end
