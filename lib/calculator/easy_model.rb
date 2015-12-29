module Calculator
  class EasyModel
    attr_reader :history

    def initialize
      @history    = []
      @operations = BasicOperations.instance
    end

    BasicOperations.names.each do |operation_name|
      define_method(operation_name) { |num1, num2|
        call(operation_name, num1, num2)
      }
    end

    private

    def call(operation_name, num1, num2)
      result = @operations.public_send(operation_name, num1, num2)

      save_history(operation_name, num1, num2, result)

      result
    end

    def save_history(operation, num1, num2, result)
      history.push operation: operation,
                   num1: num1,
                   num2: num2,
                   result: result
    end
  end
end
