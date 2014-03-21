require 'simplecov'

SimpleCov.start do
  add_filter ".bundle/"
  add_filter "spec/"
end

require 'factory_girl'
require 'open3'
require 'musk'

Dir[File.expand_path("../factories/**/*.rb", __FILE__)].each { |f| require f }
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
end
