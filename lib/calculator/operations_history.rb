require 'forwardable'

module Calculator
  class OperationsHistory
    extend Forwardable

    def_delegator :@memo, :last

    def initialize
      @memo = Array.new
    end

    def save(*args)
      @memo << build_entry(*args)
    end

    private

    def build_entry(operation, num1, num2, result)
      {
        operation: operation,
        num1: num1,
        num2: num2,
        result: result
      }
    end
  end
end
