require 'forwardable'
require 'observer'

module Calculator
  class OperationsHistory
    extend Forwardable
    include Observable

    def_delegator :@memo, :last

    def initialize(observer=nil)
      @memo = Array.new

      apply_observer(observer)
    end

    def save(*args)
      validate! args

      changed
      @memo << build_record(*args)

      notify_observers(@memo)
    end

    private

    def apply_observer(observer)
      if observer.respond_to? :update
        self.add_observer(observer)
      end
    end

    def validate!(args)
      validate_operation! args.first
      validate_numbers! args[1..4]
    end

    def validate_operation!(operation)
      raise ArgumentError unless BasicOperations.valid?(operation)
    end

    def validate_numbers!(numbers)
      raise ArgumentError unless numbers.all? { |number| number.kind_of? Numeric }
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
