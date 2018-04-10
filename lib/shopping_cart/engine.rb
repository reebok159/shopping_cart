module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart
    require 'cancan'
    require 'devise'
    require 'aasm'
    require 'draper'
    require 'haml'
    require 'simple_form'
    require 'country_select'
    require 'jquery-rails'

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
