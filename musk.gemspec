$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'musk/version'

Gem::Specification.new do |s|
  s.version     = Musk::VERSION
  s.name        = 'musk'
  s.summary     = 'Your music with the demonic scent of musk'
  s.description = 'Your music with the demonic scent of musk.'
  s.homepage    = 'https://github.com/pempel/musk'
  s.date        = '2014-03-19'
  s.author      = 'Eugene Pempel'
  s.email       = 'eugene.pempel@gmail.com'
  s.files       = `git ls-files`.split($\)
  s.executables = `git ls-files -- bin/*`.split($\).map { |f| File.basename(f) }
  s.license     = 'MIT'

  s.add_runtime_dependency 'gli', '~> 2.9'
  s.add_runtime_dependency 'taglib-ruby', '~> 0.6'

  s.add_development_dependency 'pry', '~> 0.9'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'factory_girl', '~> 4.4'
end
