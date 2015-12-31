module Calculator
  class EasyModel
    attr_reader :history

    def initialize
      @history    = OperationsHistory.new
      @operations = BasicOperations.instance
    end

    BasicOperations.names.each do |operation_name|
      define_method(operation_name) { |num1, num2|
        call(operation_name, num1, num2)
      }
    end

    private

    def call(operation, num1, num2)
      result = @operations.public_send(operation, num1, num2)

      @history.save(operation, num1, num2, result)

      result
    end
  end
end
