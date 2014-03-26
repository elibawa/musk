require "simplecov"

SimpleCov.start do
  add_filter ".bundle/"
  add_filter "spec/"
end

require "coveralls"
Coveralls.wear!

ENV["MUSK_TRACKS_PATH"] = File.expand_path("../support/tracks", __FILE__)

require "factory_girl"
require "open3"
require "musk"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
  config.include Matchers
end
