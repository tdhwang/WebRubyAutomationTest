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
    @browser.find_element(:css, 'div>ul>li>a[ui-sref=login]')
  end

  def contact_info
    @browser.find_element(:css, 'div.logged-out>div>p')
  end

  def sign_up_button
    @browser.find_element(:css, 'div#homepage-banner>div>a')
  end
end
