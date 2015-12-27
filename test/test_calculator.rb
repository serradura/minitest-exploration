require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def setup
    @calc = Calculator.new
  end

  def test_addition
    assert_equal 4, @calc.add(2, 2)
  end

  def test_subtraction
    assert_equal 0, @calc.subtract(2, 2)
  end

  def test_multiplication
    assert_equal 9, @calc.multiply(3, 3)
  end

  def test_multiplication
    assert_equal 9, @calc.multiply(3, 3)
  end

  def test_division
    assert_equal 2, @calc.divide(4, 2)
  end
end
