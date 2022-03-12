module PasswordBlacklist
  class Checker
    def blacklisted?(password, list_size='md')
      file_path = get_file_path(list_size)
      @data = File.read(file_path)
      !!@data.match(Regexp.escape(password.downcase))
    end

    def inspect
      "#<#{self.class}:0x#{__id__.to_s(16)}>"
    end

    private

    def get_file_path(list_size)
      files = {
        'xs' => 'Top1575-probable-v2.txt',
        'sm' => 'Top12Thousand-probable-v2.txt',
        'md' => 'Top95Thousand-probable.txt',
        'lg' => 'Top304Thousand-probable-v2.txt',
        'xl' => 'Top1pt6Million-probable-v2.txt'
      }
      File.expand_path(File.join('../../../data', files[list_size]), __FILE__)
    end
  end
end
