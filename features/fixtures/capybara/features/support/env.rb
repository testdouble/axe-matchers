require 'capybara/cucumber'

# to use out of the box step definitions
require 'axe/cucumber/step_definitions'

# load and select the appropriate browser
Capybara.default_driver = case ENV['BROWSER'].to_sym
                          when :webkit
                            require 'capybara-webkit'
                            Capybara::Webkit.configure do |config|
                              config.block_unknown_urls
                              config.allow_url("abcdcomputech.dequecloud.com")
                            end
                            :webkit
                          when :poltergeist
                            require 'capybara/poltergeist'
                            :poltergeist
                          else
                            require 'selenium-webdriver'
                            Capybara.register_driver :selenium do |app|
                              Capybara::Selenium::Driver.new(app, :browser => ENV['BROWSER'].to_sym)
                            end
                            :selenium
                          end
