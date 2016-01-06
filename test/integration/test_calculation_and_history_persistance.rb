require 'test_helper'
require 'calculator'
require 'fileutils'

module Calculator
  class TestCalculationAndHistoryPersistance < Minitest::Test
    context 'a calculator with a persisted history' do
      setup do
        @storage = YAMLHistoryStorage.new('tmp')

        FileUtils.rm(@storage.filename) if File.exist?(@storage.filename)

        @history = OperationsHistory.new(@storage)
      end

      subject { EasyModel.new(@history) }

      should 'perform a math operation' do
        assert_equal subject.add(1, 2), 3
      end

      should 'saves the operation in the history' do
        subject.multiply(3, 3)

        assert_equal subject.history.last[:result], 9
      end

      should 'creates a storage file' do
        subject.subtract(778, 1)

        expected = "---\n- :operation: :subtract\n  :num1: 778\n  :num2: 1\n  :result: 777\n"

        assert_equal expected, File.read(@storage.filename)
      end
    end
  end
end
