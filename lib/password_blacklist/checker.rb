module PasswordBlacklist
  class Checker
    class UnknownListSizeError < StandardError; end

    FILES = {
      xs: 'Top1575-probable-v2.txt',
      sm: 'Top12Thousand-probable-v2.txt',
      md: 'Top95Thousand-probable.txt',
      lg: 'Top304Thousand-probable-v2.txt',
      xl: 'Top1pt6Million-probable-v2.txt'
    }.freeze

    DEFAULT_SIZE = :md

    def initialize(list_size = nil)
      load_list_file(list_size) if list_size
    end

    def blacklisted?(password, list_size = nil)
      load_list_file(DEFAULT_SIZE) if @current_list_size.nil?
      load_list_file(list_size) if list_size && @current_list_size != list_size.to_sym

      !!@data.match(Regexp.escape(password.downcase))
    end

    def inspect
      "#<#{self.class}:0x#{__id__.to_s(16)}>"
    end

    private

    def load_list_file(list_size)
      list_size = list_size.to_sym
      @data = File.read(file_path(list_size))
      @current_list_size = list_size
    end

    def file_path(list_size)
      file_name = FILES[list_size]

      raise UnknownListSizeError unless file_name

      File.expand_path(File.join('../../../data', file_name), __FILE__)
    end
  end
end
