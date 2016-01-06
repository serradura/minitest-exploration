require 'forwardable'
require 'observer'

module Calculator
  class OperationsHistory
    extend Forwardable
    include Observable

    def_delegator :@memo, :last

    def initialize(observer = nil)
      @memo = []

      apply_observer(observer)
    end

    def save(*args)
      validate_operation! args.first
      validate_numbers! args[1..4]

      push(args)
    end

    private

    def apply_observer(observer)
      add_observer(observer) if observer.respond_to? :update
    end

    def push(args)
      changed
      @memo << build_record(*args)
      notify_observers(@memo)
    end

    def validate_operation!(operation)
      fail ArgumentError unless BasicOperations.valid?(operation)
    end

    def validate_numbers!(numbers)
      fail ArgumentError unless numbers.all? { |number| number.is_a? Numeric }
    end

    def build_record(operation, num1, num2, result)
      {
        operation: operation,
        num1: num1,
        num2: num2,
        result: result
      }
    end
  end
end
