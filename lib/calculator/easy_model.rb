module Calculator
  class EasyModel
    attr_reader :history

    def initialize(operations_history = OperationsHistory.new)
      @history    = operations_history
      @operations = BasicOperations.instance
    end

    BasicOperations.names.each do |operation_name|
      define_method(operation_name) do |num1, num2|
        call(operation_name, num1, num2)
      end
    end

    private

    def call(operation, num1, num2)
      result = @operations.public_send(operation, num1, num2)

      @history.save(operation, num1, num2, result)

      result
    end
  end
end
