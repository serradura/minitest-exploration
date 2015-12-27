require 'minitest/autorun'
require 'calculator'

describe Calculator do
  before do
    @calc = Calculator.new
  end

  describe "#addition" do
    let(:expected) { 4 }

    it "must add the values" do
      @calc.add(2, 2).must_equal expected
      @calc.add(4, 2).wont_equal expected
    end
  end

  describe "#subtraction" do
    let(:expected) { 0 }

    it "must subtract the values" do
      @calc.subtract(2, 2).must_equal expected
      @calc.subtract(4, 2).wont_equal expected
    end
  end

  describe "#multiplication" do
    let(:expected) { 4 }

    it "must multiply the values" do
      @calc.multiply(2, 2).must_equal expected
      @calc.multiply(4, 2).wont_equal expected
    end
  end

  describe "#division" do
    let(:expected) { 1 }

    it "must divide the values" do
      @calc.divide(2, 2).must_equal expected
      @calc.divide(4, 2).wont_equal expected
    end
  end
end
