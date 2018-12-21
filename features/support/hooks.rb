require 'selenium-webdriver'

Before do
  @browser = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(timeout: 15)
end

After do |_scenario|
  @browser.quit
  sleep(2)
end