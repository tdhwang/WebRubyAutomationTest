# Provider Login page
class ProviderLogin
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def login_text_displayed?
    @wait.until { login_text.displayed? }
    login_text.text
  end

  def enter_email(email)
    @wait.until { email_form.displayed? }
    email_form.click
    email_form.send_keys(email + '@gmail')
  end

  def enter_password(password)
    @wait.until { password_form.displayed? }
    password_form.click
    password_form.send_keys(password)
  end

  def select_login_button
    @wait.until { login_button.displayed? }
    login_button.click
  end

  def error_message_displayed?
    @wait.until { error_message.displayed? }
    error_message.text
  end

  private

  def login_text
    @browser.find_element(:css, 'div#login-left>form>h2')
  end

  def email_form
    @browser.find_element(:css, 'div.label-float>input[type=email]')
  end

  def password_form
    @browser.find_element(:css, 'div.label-float>input[type=password]')
  end

  def login_button
    @browser.find_element(:css, 'div>button[type=submit]')
  end

  def error_message
    @browser.find_element(:css, 'div>h4>span')
  end
end
