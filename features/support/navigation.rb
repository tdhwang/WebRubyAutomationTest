# Initial Navigation class
class Navigation
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def navigate_to_page(browser)
    # path = "#{ENV['PLATFORM_URL']}"
    path = 'https://www.brighter.com/'
    @browser.navigate.to(path)
  end
end
