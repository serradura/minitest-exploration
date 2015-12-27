require 'spec_helper'
require 'calculator'

describe Calculator do
  subject { Calculator.new }

  describe 'addition' do
    let(:expected) { 4 }

    it 'add two numbers properly' do
      subject.add(2, 2).must_equal expected
    end

    it 'not add incorrectly' do
      subject.add(4, 2).wont_equal expected
    end
  end

  describe 'subtraction' do
    let(:expected) { 0 }

    it 'subtract two numbers properly' do
      subject.subtract(2, 2).must_equal expected
    end

    it 'not subtract incorrectly' do
      subject.subtract(4, 2).wont_equal expected
    end
  end

  describe 'multiplication' do
    let(:expected) { 4 }

    it 'multiply two numbers properly' do
      subject.multiply(2, 2).must_equal expected
    end

    it 'not multiply incorrectly' do
      subject.multiply(4, 2).wont_equal expected
    end
  end

  describe 'division' do
    let(:expected) { 1 }

    it 'divide two numbers properly' do
      subject.divide(2, 2).must_equal expected
    end

    it 'not divide incorrectly' do
      subject.divide(4, 2).wont_equal expected
    end
  end
end
