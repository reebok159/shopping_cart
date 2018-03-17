require 'cancan'
require 'devise'
require 'aasm'
require 'draper'
require 'haml'
require 'simple_form'
require "shopping_cart/engine"

module ShoppingCart
  class Engine < ::Rails::Engine

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
