
ENV['RAILS_ENV'] = 'development'
require './config/environment'
#require './config/boot'
require 'minitest/spec'
require 'rspec/rails'
require 'rack/test'

#require_all 'app/**/*.rb'
require './features/steps/common_helpers.rb'
require './features/steps/common_steps.rb'
require 'net/http'
require 'ruby-debug'

#require 'database_cleaner'
#DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
Spinach.config.save_and_open_page_on_failure = true

module CapybaraApp
  def app; Capybara.app; end
end
