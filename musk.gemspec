Gem::Specification.new do |s|
  s.name    = 'musk'
  s.version = '0.0.1'
  s.summary = 'Your music with the demonic scent of musk'
  s.date    = '2014-03-14'
  s.author  = 'Eugene Pempel'
  s.email   = 'eugene.pempel@gmail.com'
  s.files   = `git ls-files`.split($\)
  s.license = 'MIT'

  s.add_runtime_dependency 'gli', '~> 2.9.0'
  s.add_runtime_dependency 'taglib-ruby', '~> 0.6.0'
  s.add_runtime_dependency 'discogs-wrapper', '~> 1.1.4'

  s.add_development_dependency 'pry', '~> 0.9.12.6'
  s.add_development_dependency 'rspec', '~> 2.14.1'
end
