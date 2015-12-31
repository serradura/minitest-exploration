require 'test_helper'
require 'calculator'

class Calculator::TestOperationsHistory < Minitest::Test
  subject { Calculator::OperationsHistory.new }

  context 'when receives an operation data' do

    should 'saves the event' do
      subject.save(:add, 1, 2, 3)

      expected = {operation: :add, num1: 1, num2: 2, result: 3 }

      assert_equal expected, subject.last
    end

  end

end
