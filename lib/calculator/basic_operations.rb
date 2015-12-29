require 'singleton'

module Calculator
  class BasicOperations
    include Singleton

    def add(num1, num2)
      return num1 + num2
    end

    def subtract(num1, num2)
      return num1 - num2
    end

    def multiply(num1, num2)
      return num1 * num2
    end

    def divide(num1, num2)
      return num1 / num2
    end
  end
end
