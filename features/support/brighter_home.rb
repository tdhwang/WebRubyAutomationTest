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
    @browser.find_element(:xpath, '//h1[text()="The leader in Digital Health Plans"]')
  end

  def provider_link
    @browser.find_element(:xpath, '//a[text()="For Providers"]')
  end
end
