require 'forwardable'

module Calculator
  class OperationsHistory
    extend Forwardable

    def_delegator :@memo, :last

    def initialize
      @memo = Array.new
    end

    def save(*args)
      validate_operation!(args.first)
      validate_numbers!(args.slice(1..4))

      @memo << build_entry(*args)
    end

    private

    def validate_operation!(operation)
      return operation if BasicOperations.names.include?(operation)

      raise ArgumentError
    end

    def validate_numbers!(args)
      raise ArgumentError unless args.all? { |arg| arg.kind_of? Numeric }
    end

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
