ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'pry'
require 'capybara'

RSpec.configure do |config|

  Capybara.default_driver = :selenium
  config.include Capybara::DSL, type: :feature

  Swat::Capybara.setup(config, { default_pause: 0.5,
       min_pause: 0.3,
       tries: 10,
       default_selector: 'body',
       output: { enabled: true, started: ?>, step: ?. }
   })
end
