require 'benchmark'

require 'calculator/basic_operations'

class OperationsMethodCallBenchmark
  class Base
    def operations
      Calculator::BasicOperations.instance
    end
  end

  class DefinedMethod < Base
    define_method(:add) do |num1, num2|
      operations.public_send(__callee__, num1, num2)
    end
  end

  class DynamicMethod < Base
    def method_missing(method, *args)
      operations.public_send(method, *args)
    end
  end

  def self.setup
    @dynamic = DynamicMethod.new
    @defined = DefinedMethod.new
    @numbers = (1..10_000)
  end

  def self.reports
    Benchmark.bm do |x|
      x.report('defined operation') do
        @numbers.each { |n| @defined.add(n, n) }
      end

      x.report('dynamic operation') do
        @numbers.each { |n| @dynamic.add(n, n) }
      end
    end
  end

  def self.run
    setup
    reports
  end
end

OperationsMethodCallBenchmark.run
