require 'rspec'

Given(/^a user navigates to the website$/) do
  @navigation = Navigation.new(@browser)
  @navigation.navigate_to_page(@browser)
end

And(/^a user validates elements on page$/) do
  expect(@navigation.page_title_value).to match("Bing")
  expect(@navigation.page_header_value).to match("navigation")
  expect(@navigation.page_search_form_value).to match("search")
end

And(/^a user validates Image of Day section$/) do
  @browser.action.send_keys(:arrow_down).perform
  @browser.action.send_keys(:arrow_down).perform
  @browser.action.send_keys(:arrow_down).perform
  expect(@navigation.image_day_title_displayed).to match("IMAGE OF THE DAY")
  expect(@navigation.image_day_section_displayed).to match("iotd")
end

And(/^a user validates On This Day In History section$/) do
  expect(@navigation.day_history_title_displayed).to match("ON THIS DAY IN HISTORY")
  expect(@navigation.day_history_section_displayed).to match("otd")
end

And(/^a user searches for (.*)$/) do |search_criteria|
  @navigation.search_input(search_criteria)
  sleep(5)
end

And(/^a user validates search page result$/) do
  @navigation.search_result_displayed
  @navigation.result_list_displayed
  @navigation.result_list_name_displayed
end

And(/^a user switches to news tab with same result$/) do
  old_news = @navigation.old_news_displayed
  @navigation.select_news_tab
  new_news = @navigation.new_news_displayed
  expect(old_news).to match(new_news)
end
