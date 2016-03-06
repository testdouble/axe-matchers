require 'capybara/cucumber'
Capybara.default_driver = :webkit

require 'capybara-webkit'
Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  config.allow_url("abcdcomputech.dequecloud.com")
end

# to use out of the box step definitions
require 'axe/cucumber/step_definitions'
