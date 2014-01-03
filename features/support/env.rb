
ENV['RAILS_ENV'] = 'development'
require './config/environment'
#require './config/boot'
require 'minitest/spec'
require 'rspec/rails'
require 'spinach-rails'
require 'rack/test'
require 'show_me_the_cookies'

#require_all 'app/**/*.rb'
require './features/steps/common_helpers.rb'
require 'ruby-debug'

#require 'database_cleaner'
#DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario do DatabaseCleaner.clean 
  ShowMeTheCookies 
end
Spinach.config.save_and_open_page_on_failure = true

require 'spinach/capybara'
Capybara.run_server = false
Capybara.app_host = 'http://localhost:3000'
#Capybara.default_driver = :selenium
#Capybara.default_wait_time = 20
