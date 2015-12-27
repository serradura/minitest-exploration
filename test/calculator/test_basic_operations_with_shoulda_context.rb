require 'test_helper'
require 'calculator/basic_operations'

class Calculator::TestBasicOperationsWithShoulda < Minitest::Test
  context 'a calculator' do
    setup do # notice the difference
      @calc = Calculator::BasicOperations.instance
    end

    should 'add two numbers properly' do
      assert_equal 4, @calc.add(2, 2)
    end

    should 'not add incorrectly' do
      refute_equal 5, @calc.add(2, 2)
    end

    should 'subtract two numbers properly' do
      assert_equal 0, @calc.subtract(2, 2)
    end

    should 'not subtract incorrectly' do
      refute_equal -1, @calc.subtract(2, 2)
    end
  end
end
