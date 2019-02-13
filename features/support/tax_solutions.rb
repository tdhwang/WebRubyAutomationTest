# Class for TCC solution tab
class TaxSolutions
  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def select_solutions_tab
    @wait.until { solutions_tab.displayed? }
    solutions_tab.click
  end

  def solutions_tab
    @browser.find_element(:xpath, '//ul//a[text()="Solutions"]')
  end
end
