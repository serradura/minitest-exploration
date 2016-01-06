require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |task|
  task.libs << %w(test lib tmp)
  task.pattern = 'test/**/test_*.rb'
  task.name = 'test'
  task.description = 'Run tests'
end

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
  task.pattern = 'test/benchmark/**/*_benchmark.rb'
  task.name = 'bench'
  task.description = 'Run benchmarks'
end

RuboCop::RakeTask.new
