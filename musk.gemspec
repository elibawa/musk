$LOAD_PATH << File.expand_path("../lib", __FILE__)

require "musk/version"

Gem::Specification.new do |s|
  s.name          = "musk"
  s.author        = "Eugene Pempel"
  s.email         = "eugene.pempel@gmail.com"
  s.summary       = "Yet another MP3 tagging tool."
  s.description   = "Extract tags from MP3 files and perfume MP3 files with fragrant tags."
  s.homepage      = "https://github.com/pempel/musk"
  s.license       = "MIT"

  s.date          = Time.now
  s.version       = Musk::VERSION
  s.platform      = Gem::Platform::RUBY

  s.files         = `git ls-files`.split($\)
  s.test_files    = `git ls-files -- spec/*`.split($\)
  s.executables   = `git ls-files -- bin/*`.split($\).map {|f| File.basename(f)}

  s.require_paths         = ["lib"]
  s.required_ruby_version = "~> 2.0"

  s.add_runtime_dependency "gli", "~> 2.9"
  s.add_runtime_dependency "taglib-ruby", "~> 0.6"
end
