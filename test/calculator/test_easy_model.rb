require 'test_helper'
require 'calculator'

class Calculator::TestEasyModel < Minitest::Test
  subject { Calculator::EasyModel.new }

  context 'given an addition operation' do
    setup do
      @history_entry = { operation: :add, num1: 3, num2: 2, result: 5 }
    end

    should 'saves the operation history' do
      subject.add(@history_entry[:num1], @history_entry[:num2])

      assert_equal @history_entry, subject.history.last
    end
  end
end
