require 'aruba/cucumber'
require 'cucumber/formatter/unicode'

Before do
  step %Q{I use a fixture named "capybara"}
end
