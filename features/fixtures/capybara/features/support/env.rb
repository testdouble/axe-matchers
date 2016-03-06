require 'capybara/cucumber'
require 'capybara-webkit'
Capybara.default_driver = :webkit

# to use out of the box step definitions
require 'axe/cucumber/step_definitions'
