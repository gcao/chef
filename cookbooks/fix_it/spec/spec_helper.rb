$:.push(File.dirname(__FILE__) + '/../recipes')

require 'rubygems'
require 'spec'

Spec::Runner.configure do |config|
  config.mock_with :rr
end