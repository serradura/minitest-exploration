require 'test_helper'
require 'calculator/basic_operations'

class Calculator::TestBasicOperationsWithShoulda < Minitest::Test

  subject { Calculator::BasicOperations.instance }
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
      refute_equal -1, subject.subtract(2, 2)
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
