require 'minitest/autorun'
require 'calculator'

class TestCalculator < Minitest::Test
  def setup
    @calc = Calculator.new
  end

  def test_addition
    expected = 4

    assert_equal expected, @calc.add(2, 2)
    refute_equal expected, @calc.add(4, 2)
  end

  def test_subtraction
    expected = 0

    assert_equal expected, @calc.subtract(2, 2)
    refute_equal expected, @calc.subtract(4, 2)
  end

  def test_multiplication
    expected = 4

    assert_equal expected, @calc.multiply(2, 2)
    refute_equal expected, @calc.multiply(4, 2)
  end

  def test_division
    expected = 1

    assert_equal expected, @calc.divide(2, 2)
    refute_equal expected, @calc.divide(4, 2)
  end
end
