require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
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
