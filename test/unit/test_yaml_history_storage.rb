require 'test_helper'
require 'calculator/yaml_history_storage'

module Calculator
  class TestYAMLHistoryStorage < Minitest::Test

    subject { YAMLHistoryStorage.new }

    context 'storage file path' do
      context 'default' do
        should 'be the OS temp dir' do
          assert_equal Dir.tmpdir, subject.file_path
        end
      end

      context 'custom' do
        setup { @file_path = 'tmp' }

        subject { YAMLHistoryStorage.new(@file_path) }

        should 'be the desired path' do
          assert_equal @file_path, subject.file_path
        end
      end
    end

    context 'storage filename' do
      should 'be valid' do
        assert_includes subject.filename, subject.file_path
        assert_includes subject.filename, YAMLHistoryStorage::FILE_NAME
      end
    end

    context 'update storage data' do
      setup do
        @file = Minitest::Mock.new
        @file.expect(:puts, nil, ["---\n- :operation: :add\n  :num1: 1\n  :num2: 1\n  :result: 2\n"])
        @file.expect(:close, nil)
      end

      should 'persist data in a file' do
        File.stub(:open, @file) do
          subject.update([{
            operation: :add,
            num1: 1,
            num2: 1,
            result: 2
          }])

          @file.verify
        end
      end
    end

  end
end
