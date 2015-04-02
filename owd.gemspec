$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'owd/version'

Gem::Specification.new 'owd', OWD::VERSION do |s|
  s.summary           = "A simple client for One World Direct's XML API"
  s.description       = "One World Direct (OWD) is a 3PL provider based in South Dakota.  The Ruby owd gem is a simple client for their XML-based API."
  s.author            = 'Jesse Farmer'
  s.email             = "jesse@everlane.com"
  s.homepage          = "http://www.everlane.com/"
  s.files             = `git ls-files`.split("\n") - %w[.gitignore]
  s.test_files        = s.files.select { |p| p =~ /^test\/.*_test.rb/ }
  s.extra_rdoc_files  = s.files.select { |p| p =~ /^README/ } << 'LICENSE'
  s.rdoc_options      = %w[--line-numbers --inline-source --title OWD --main README.rdoc]

  s.add_dependency 'activesupport'
  s.add_dependency 'crack'
  s.add_dependency 'builder'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'
end
