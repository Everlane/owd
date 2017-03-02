# External dependencies
require 'active_support/core_ext/string'

# Other files
require 'owd/version'
require 'owd/error'
require 'owd/document'

Dir[File.dirname(__FILE__) + "/documents/*.rb"].each do |file|
  require file
end

require 'owd/simple_proxy'
require 'owd/request'
require 'owd/client'
