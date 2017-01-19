require "password_blacklist/version"
require "password_blacklist/tester"

module PasswordBlacklist
  extend self

  def test(password)
    Tester.new.test(password)
  end
end
