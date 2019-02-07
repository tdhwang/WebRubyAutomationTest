# Brighter Home page
# Brighter Home page
class BrighterHome
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def select_provider_link
    @wait.until { provider_link.displayed? }
    provider_link.click
  end

  def homepage_text_displayed?
    @wait.until { homepage_text.displayed? }
    homepage_text.text
  end

  private

  def homepage_text
    @browser.find_element(:css, 'div.content>h1')
  end

  def provider_link
    @browser.find_element(:css, 'div.logged-out>ul>li:nth-child(1)>a')
  end
end
