require "minitest/autorun"
require "minitest/reporters"
require "./test/support/xml_assertions"
require './lib/owd'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
