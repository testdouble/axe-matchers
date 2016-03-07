require 'selenium-webdriver'

# to use out of the box step definitions
require 'axe/cucumber/step_definitions'

# save driver to global so we only have a single shared instance
$page = Selenium::WebDriver.for ENV['BROWSER'].to_sym

Before do
  # save global as ivar so step def has it
  @page = $page
end

at_exit do
  $page.quit
end
