require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
  task.pattern = 'test/test_*.rb'
  task.name = 'test'
  task.description = 'Run unit tests'
end

task :default => :test
