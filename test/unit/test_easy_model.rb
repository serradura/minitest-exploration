require 'test_helper'
require 'calculator'

module Calculator
  class TestEasyModel < Minitest::Test
    subject { EasyModel.new }

    def build_history_entry(operation, num1, num2, result)
      {
        operation: operation,
        num1: num1,
        num2: num2,
        result: result
      }
    end

    context 'given an addition operation' do
      setup do
        @history_entry = build_history_entry(:add, 3, 2, 5)
      end

      should 'saves the operation history' do
        subject.add(@history_entry[:num1], @history_entry[:num2])

        assert_equal @history_entry, subject.history.last
      end
    end

    context 'given a subtraction operation' do
      setup do
        @history_entry = build_history_entry(:subtract, 3, 2, 1)
      end

      should 'saves the operation history' do
        subject.subtract(@history_entry[:num1], @history_entry[:num2])

        assert_equal @history_entry, subject.history.last
      end
    end

    context 'given a multiplication operation' do
      setup do
        @history_entry = build_history_entry(:multiply, 3, 2, 6)
      end

      should 'saves the operation history' do
        subject.multiply(@history_entry[:num1], @history_entry[:num2])

        assert_equal @history_entry, subject.history.last
      end
    end

    context 'given a division operation' do
      setup do
        @history_entry = build_history_entry(:divide, 3.0, 2, 1.5)
      end

      should 'saves the operation history' do
        subject.divide(@history_entry[:num1], @history_entry[:num2])

        assert_equal @history_entry, subject.history.last
      end
    end
  end
end
