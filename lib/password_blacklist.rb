require 'password_blacklist/version'
require 'password_blacklist/tester'

module PasswordBlacklist
  module_function

  def test(password)
    Tester.new.test(password)
  end
end
