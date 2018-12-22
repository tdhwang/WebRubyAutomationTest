class Navigation

  def initialize(browser)
    @browser = browser
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def navigate_to_page(browser)
    path = 'https://www.bing.com/'
    @browser.navigate.to(path)
    sleep(5)
  end

  def page_title_value
    @wait.until { page_title.displayed? }
    page_title.text
  end

  def page_header_value
    @wait.until { page_title.displayed? }
    page_header.attribute('role')
  end
  
  def page_search_form_value
    @wait.until { page_title.displayed? }
    page_search_form.attribute('role')
  end

  def image_day_title_displayed
    @wait.until { image_day_title.displayed? }
    image_day_title.text
  end

  def image_day_section_displayed
    @wait.until { image_day_section.displayed? }
    image_day_section.attribute('data-vsname')
  end

  def day_history_title_displayed
    @wait.until { day_history_title.displayed? }
    day_history_title.text
  end

  def day_history_section_displayed
    @wait.until { day_history_section.displayed? }
    day_history_section.attribute('data-vsname')
  end

  def search_input(search_criteria)
    @wait.until { input_form.displayed? }
    input_form.click
    input_form.send_keys(search_criteria)
    search_button.click
  end

  def search_result_displayed
    @wait.until { search_result.displayed? }
    puts search_result.text
    @wait.until { info_box.displayed? }
  end

  def result_list_displayed
    foo = result_list.length
    puts "Count= #{foo}"
  end

  def result_list_name_displayed
    count = 0 
    for foo in result_list
      puts result_list[count].text
      count +=1
      if count == result_list.length
        break
      end
    end
  end
        
  def select_news_tab
    @wait.until { news_tab.displayed? }
    news_tab.click
  end

  def old_news_displayed
    @wait.until { news_result.displayed? } 
    news_result.text
  end

  def new_news_displayed
    @wait.until { new_news_result.displayed? }
    new_news_result.text
  end

  private 

  def page_title
    @browser.find_element(:xpath, '//div[@id="sbox"]')
  end

  def page_header
    @browser.find_element(:xpath, '//div/ul[@role="navigation"]')
  end

  def page_search_form
    @browser.find_element(:xpath, '//div[@class="b_searchboxForm"]')
  end

  def image_day_section
    @browser.find_element(:xpath, '//div[@id="vert_iotd"]')
  end

  def image_day_title
    @browser.find_element(:xpath, '//h2[text()="Image of the day"]')
  end

  def day_history_section
    @browser.find_element(:xpath, '//div[@id="vert_otd"]')
  end

  def day_history_title
    @browser.find_element(:xpath, '//h2[text()="On This Day in History"]')
  end

  def input_form
    @browser.find_element(:xpath, '//div/input[@id="sb_form_q"]')
  end

  def search_button
    @browser.find_element(:xpath, '//input[@id="sb_form_go"]')
  end

  def search_result
    @browser.find_element(:xpath, '//span[@class="sb_count"]')
  end

  def result_list
    @browser.find_elements(:xpath, "//h2/a[text()]")
  end

  def all_result_list
    @browser.find_elements(:xpath => "//h2//a")
  end

  def test_name
    @browser.find_elements(:xpath, "//h2")
  end

  def info_box
    @browser.find_element(:xpath, '//div[@class="b_entityTP"]')
  end

  def news_result
    @browser.find_element(:xpath, '//*[@id="ans_nws"]/div[2]/div[1]/div[1]/div/a/div[1]/p[1]')
  end

  def news_tab
    @browser.find_element(:xpath, '//a[text()="News"]')
  end

  def new_news_result
    @browser.find_element(:xpath, '//div[@class="t_t"]//a[1]')
  end

end
