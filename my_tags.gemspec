Gem::Specification.new do |s|
  s.name        = 'my_tags'
  s.version     = '0.0.8'
  s.authors     = ['Vitaly Omelchenko']
  s.email       = ['prosto.vint@gmail.com']
  s.homepage    = 'https://github.com/vintyara/my_tags'
  s.summary     = 'My Tags'
  s.description = 'Simple Tags for rails app'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9.2'

  s.add_runtime_dependency     'activerecord', '>= 3.2.0'
  s.add_development_dependency 'combustion',   '~> 0.4.0'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sqlite3',      '~> 1.3.7'
end
