require 'test_helper'
require 'calculator'

class Calculator::TestOperationsHistory < Minitest::Test
  subject { Calculator::OperationsHistory.new }

  context 'when receives an observer' do
    setup do
      @observer = Minitest::Mock.new
      @observer.expect(:hash, Object.new.hash)
      @observer.expect(:update, nil, [Array])
    end

    subject { Calculator::OperationsHistory.new(@observer) }

    should 'execute it after save an entry' do
      subject.save(:add, 1, 1, 2)

      @observer.verify
    end
  end

  context 'when receives an operation data' do

    should 'saves the event' do
      subject.save(:add, 1, 2, 3)

      expected = {operation: :add, num1: 1, num2: 2, result: 3 }

      assert_equal expected, subject.last
    end

    context 'when fail some validation' do
      should 'raises an error when the number of args is wrong' do
        assert_raises(ArgumentError) {
          subject.save(:add, 1)
        }
      end

      should 'raises an error when the operation arg is invalid' do
        assert_raises(ArgumentError) { subject.save(nil, 1, 1, 2) }
        assert_raises(ArgumentError) { subject.save('', 1, 1, 2) }
        assert_raises(ArgumentError) { subject.save(''.to_sym, 1, 1, 2) }
        assert_raises(ArgumentError) { subject.save(:foo, 1, 1, 2) }
      end

      should 'raises an error when the numbers are invalid' do
        assert_raises(ArgumentError) { subject.save(:add, nil, nil, nil) }
        assert_raises(ArgumentError) { subject.save(:add, '', '', '') }
        assert_raises(ArgumentError) { subject.save(:add, '1', '1', '2') }
      end
    end

  end

end
