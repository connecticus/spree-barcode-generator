Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_barcode'
  s.version     = '2.1.8'
  s.summary     = 'Point of sale screen for Spree'
  s.required_ruby_version = '>= 1.8.7'
  s.authors = ['Torsten R', 'Enrique Alvarez', 'Stanislav Bourakov']

  s.email             = 's@connecticus.org'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'


  s.add_dependency('spree_core', '>= 2.1')
  s.add_dependency('barby')
  s.add_dependency('prawn')
  s.add_dependency('rqrcode') # missing dependency in barby
  s.add_dependency('chunky_png')
end
