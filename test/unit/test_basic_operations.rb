require 'test_helper'
require 'calculator/basic_operations'

module Calculator
  class TestBasicOperationsWithShoulda < Minitest::Test
    subject { BasicOperations.instance }

    context 'operation names' do
      setup do
        @names = [:divide, :multiply, :subtract, :add]
      end

      should 'list all valid names' do
        assert_same_elements @names, BasicOperations.names
        assert_same_elements @names, subject.names
      end
    end

    context 'given an operation name' do
      should 'verify if its valid' do
        assert BasicOperations.valid?(:add)
        refute BasicOperations.valid?(:foo)
      end
    end

    context 'given an addition operation' do
      should 'add two numbers properly' do
        assert_equal 4, subject.add(2, 2)
      end

      should 'not add incorrectly' do
        refute_equal 5, subject.add(2, 2)
      end
    end

    context 'given a subtraction operation' do
      should 'subtract two numbers properly' do
        assert_equal 0, subject.subtract(2, 2)
      end

      should 'not subtract incorrectly' do
        refute_equal(-1, subject.subtract(2, 2))
      end
    end

    context 'given a multiplication operation' do
      should 'multiply two numbers properly' do
        assert_equal 4, subject.multiply(2, 2)
      end

      should 'not multiply incorrectly' do
        refute_equal 5, subject.multiply(2, 2)
      end
    end

    context 'given a division operation' do
      should 'divide two numbers properly' do
        assert_equal 1, subject.divide(2, 2)
      end

      should 'not divide incorrectly' do
        refute_equal 0, subject.divide(2, 2)
      end
    end
  end
end
