require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda/context'

# Use the option below to have the default output with colors
# Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new,
  Minitest::Reporters::MeanTimeReporter.new
]
