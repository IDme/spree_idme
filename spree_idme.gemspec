# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_idme'
  s.version     = '1.1.0'
  s.summary     = 'This extention will enable IDme.'
  s.description = 'You will be able to add a new type of Promotion Rule in order to enable ID.me verification functionality.'
  s.required_ruby_version = '>= 1.8.7'

  s.author      = 'ID.me'
  s.email       = 'christopher@troopswap.com'
  s.homepage    = 'http://id.me/'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.0'
  s.add_dependency 'httparty'

  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'pg'
end
