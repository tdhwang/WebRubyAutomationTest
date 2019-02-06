class FindPractice
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def find_practice_page_displayed?
    @wait.until { find_practice_page.displayed? }
  end

  def enter_number(phone_number)
    @wait.until { number_form.displayed? }
    number_form.click
    number_form.send_keys(phone_number)
  end

  def select_find_practice_button
    @wait.until { find_practice_button.displayed? }
    find_practice_button.click
  end

  def mismatch_message_displayed?
    @wait.until { mismatch_message.displayed? }
  end

  private

  def find_practice_page
    @browser.find_element(:xpath, '//h2[text()="Find your practice"]')
  end

  def number_form
    @browser.find_element(:xpath, '//input[@type="tel"]')
  end

  def find_practice_button
    @browser.find_element(:xpath, '//button[text()="Find my practice"]')
  end

  def mismatch_message
    @browser.find_element(:xpath, '//h2[text()="We are unable to find a match for that phone number."]')
  end
end
