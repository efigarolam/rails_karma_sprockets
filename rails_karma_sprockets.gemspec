$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails_karma_sprockets/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_karma_sprockets'
  s.version     = RailsKarmaSprockets::VERSION
  s.authors     = ['Eduardo Figarola']
  s.email       = ['eduardofigarola@gmail.com']
  s.homepage    = 'https://github.com/efigarolam/rails_karma_sprockets'
  s.summary     = 'Makes your integration between Rails and Karma easier'
  s.description = 'This gem will compile your js manifest in a specific location and the run Karma tests.'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_development_dependency 'pry', '~> 0.10.0'
end
