# Other files
require 'owd/version'
require 'owd/error'
require 'owd/document'

Dir[File.dirname(__FILE__) + "/documents/**/*.rb"].each do |file|
  require File.basename(file, '.rb')
end

require 'owd/simple_proxy'
require 'owd/client'