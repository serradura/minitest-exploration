require 'singleton'

module Calculator
  class BasicOperations
    include Singleton

    NAMES = [:add, :subtract, :multiply, :divide].freeze

    def self.names
      instance.names
    end

    def self.valid?(name)
      names.include? name
    end

    def names
      NAMES
    end

    def add(num1, num2)
      num1 + num2
    end

    def subtract(num1, num2)
      num1 - num2
    end

    def multiply(num1, num2)
      num1 * num2
    end

    def divide(num1, num2)
      num1 / num2
    end
  end
end
