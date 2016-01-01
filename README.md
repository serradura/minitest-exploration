# Project to explore the Minitest library

Based on post http://www.sitepoint.com/minitest-shoulda

# How run the test suite
```sh
rake test
# Or
autotest
```

# How run the benchmarks
```sh
rake bench
```

# Usage
```ruby
# Load in the console (IRB)
# $ irb -I lib -r calculator

# With a default OperationsHistory
calc = Calculator::EasyModel.new

calc.multiply 3,3
# => 9
calc.history.last
# => {:operation=>:multiply, :num1=>3, :num2=>3, :result=>9}

# With a custom OperationsHistory
storage = Calculator::YAMLHistoryStorage.new
history = Calculator::OperationsHistory.new(storage)
scalc   = Calculator::EasyModel.new(history)

scalc.add 1, 1
# => 2
scalc.subtract 5, 2
# => 3
storage.data
# => [{:operation=>:add, :num1=>1, :num2=>1, :result=>2}, {:operation=>:subtract, :num1=>5, :num2=>2, :result=>3}]
scalc.history.last == storage.data.last
# => true

# Verify the operations history file cache
require 'shell'
Shell.new.cat Calculator::YAMLHistoryStorage::FILE_PATH
# => ---
# - :operation: :add
#   :num1: 1
#   :num2: 1
#   :result: 2
# - :operation: :subtract
#   :num1: 5
#   :num2: 2
#   :result: 3

```
