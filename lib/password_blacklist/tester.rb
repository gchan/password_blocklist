module PasswordBlacklist
  class Tester
    def initialize
      file_path = File.expand_path('../../../data/100k_passwords.txt', __FILE__)

      @data = File.read(file_path)
    end

    def test(password)
      !@data.match(/#{password}/).nil?
    end

    def inspect
      "#<#{self.class}:0x#{__id__.to_s(16)}>"
    end
  end
end
