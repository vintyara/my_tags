Gem::Specification.new do |s|
  s.name        = 'my_tags'
  s.version     = '0.0.7'
  s.authors     = ['Vitaly Omelchenko']
  s.email       = ['prosto.vint@gmail.com']
  s.homepage    = 'https://github.com/vintyara/my_tags'
  s.summary     = 'My Tags'
  s.description = 'Simple Tags for rails app'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>=1.9.2'
end
