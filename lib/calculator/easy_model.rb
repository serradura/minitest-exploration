module Calculator
  class EasyModel
    attr_reader :history

    def initialize
      @history    = []
      @operations = BasicOperations.instance
    end

    def add(num1, num2)
      @operations.add(num1, num2).tap do |result|
        save_history(:add, num1, num2, result)
      end
    end

    private

    def save_history(operation, num1, num2, result)
      history.push operation: operation,
                   num1: num1,
                   num2: num2,
                   result: result
    end
  end
end
