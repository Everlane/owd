require "minitest/autorun"
require "minitest/reporters"
require "./test/support/xml_assertions"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
