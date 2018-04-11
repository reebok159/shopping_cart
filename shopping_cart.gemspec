$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Eugene V."]
  s.email       = ["kokokoi9@mail.ru"]
  s.homepage    = "https://github.com/reebok159/shopping_cart"
  s.summary     = "Summary of ShoppingCart."
  s.description = "Description of ShoppingCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 5.1.5"
  s.add_dependency 'aasm', '~> 4.12', '>= 4.12.2'
  s.add_dependency 'devise', '~> 4.3'
  s.add_dependency 'haml-rails', '~> 1.0'
  s.add_dependency 'draper', '~> 3.0', '>= 3.0.1'
  s.add_dependency 'i18n', '~> 0.8.6'
  s.add_dependency 'simple_form', '~> 3.5'
  s.add_dependency 'country_select', '~> 3.1', '>= 3.1.1'
  s.add_dependency 'cancancan', '~> 2.0'
  s.add_dependency 'jquery-rails', '~> 4.3', '>= 4.3.1'

  s.add_development_dependency 'rspec-rails', '~> 3.6', '>= 3.6.1'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'database_cleaner', '~> 1.6.1'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'capybara', '~> 2.13.0'
  s.add_development_dependency 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'capybara-webkit', '~> 1.14.0'
end
