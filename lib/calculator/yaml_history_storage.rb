require 'psych'
require 'tmpdir'

module Calculator
  class YAMLHistoryStorage
    FILE_NAME  = 'calculator_history.yml'.freeze
    EMPTY_DATA = [].freeze

    attr_reader :file_path

    def self.fetch_data
      new.data
    end

    def initialize(file_path = nil)
      @file_path = file_path || Dir.tmpdir
    end

    def update(memo)
      data = serializer.dump(memo)

      persist_file data
    end

    def filename
      @filename ||= File.join(file_path, FILE_NAME)
    end

    def data
      serializer.load_file(filename) || EMPTY_DATA
    rescue Errno::ENOENT
      return EMPTY_DATA
    end

    private

    def serializer
      Psych
    end

    def persist_file(data)
      file = File.open(filename, 'w')
      file.puts(data)
      file.close
    end
  end
end
