require 'singleton'

module Calculator
  class BasicOperations
    include Singleton

    def add(a, b)
      return a + b
    end

    def subtract(a, b)
      return a - b
    end

    def multiply(a, b)
      return a * b
    end

    def divide(a, b)
      return a / b
    end
  end
end
