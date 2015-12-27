require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def setup
    @calc = Calculator.new
  end

  def test_addition
    assert_equal 4, @calc.add(2, 2)
  end
end
