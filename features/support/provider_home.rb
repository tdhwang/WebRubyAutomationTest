# Provider Home page
class ProviderHome
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def select_login_button
    @wait.until { provider_login_button.displayed? }
    provider_login_button.click
  end

  def select_get_started_button
    @wait.until { started_button.displayed? }
    started_button.click
  end

  def contact_info_displayed?
    @wait.until { contact_info.displayed? }
    contact_info.text
  end

  def select_sign_up_button
    @wait.until { sign_up_button.displayed? }
    sign_up_button.click
  end

  private

  def provider_login_button
    @browser.find_element(:xpath, '//a[text()="provider login"]')
  end

  def started_button
    @browser.find_element(:xpath, '//a[text()="Get Started"]')
  end

  def contact_info
    locater = '//div[@class="logged-out"]//p[text()="Provider questions? 1.888.300.4742"]'
    @browser.find_element(:xpath, locater)
  end

  def sign_up_button
    @browser.find_element(:xpath, '//a[text()="SIGN UP"]')
  end
end
