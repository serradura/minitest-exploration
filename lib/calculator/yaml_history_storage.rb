require 'psych'
require 'tmpdir'

module Calculator
  class YAMLHistoryStorage
    FILE_NAME  = 'calculator_history.yml'.freeze
    FILE_PATH  = File.join(Dir.tmpdir, FILE_NAME)
    EMPTY_DATA = Array.new.freeze

    def self.fetch_data
      new.data
    end

    def update(memo)
      data = Psych.dump(memo)

      persist_file data
    end

    def data
      Psych.load_file(FILE_PATH) || EMPTY_DATA
    rescue Errno::ENOENT
      return EMPTY_DATA
    end

    private

    def persist_file(data)
      File.open(FILE_PATH, 'w') { |f| f.puts data }
    end
  end
end
