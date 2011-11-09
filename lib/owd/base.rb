# Other files
require 'owd/version'
require 'owd/error'
require 'owd/document'

Dir[File.dirname(__FILE__) + "/documents/**/*.rb"].each do |file|
  require File.basename(f, '.rb')
end

require 'owd/client'