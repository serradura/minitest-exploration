# Project to explore the Minitest library
Based on posts:
- [Make Your Ruby Tests Cleaner with Minitest and Shoulda](http://www.sitepoint.com/minitest-shoulda)
- [Top 8 tools for Ruby on Rails code optimization and cleanup]( https://infinum.co/the-capsized-eight/articles/top-8-tools-for-ruby-on-rails-code-optimization-and-cleanup)

## Installation
```sh
  # Install ruby 2.3.0. e.g:
  # rvm install 2.3.0

  # Enter in the project folder. e.g:
  # cd ./minitest-exploration

  bundle install

  # Execute autotest to verify the test coverage. e.g:
  # autotest
  # After execute autotest, open tmp/* to see all the code quality reports.
```

## Usage
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
Shell.new.cat storage.filename
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

## How run the test suite
```sh
rake test
# Or
autotest
```

## How run the benchmarks
```sh
rake bench
```

## Code Quality tools
```sh
# https://github.com/colszowka/simplecov/blob/master/README.md
rake test

open tmp/coverage/index.html

# https://github.com/whitesmith/rubycritic/blob/master/README.md
rake rubycritic

open tmp/rubycritic/overview.html

# https://github.com/makaroni4/sandi_meter/blob/master/README.md
rake sandi_meter

open tmp/sandi_meter/index.html
```
