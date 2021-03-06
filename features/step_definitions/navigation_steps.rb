require 'rspec'
require 'net/http'

Given(/^the user navigates to the Brighter website$/) do
  @navigation = Navigation.new(@browser)
  @navigation.navigate_to_page(@browser)
  @brighter_home = BrighterHome.new(@browser)
  expect(@brighter_home.homepage_text_displayed?).to match('The leader in Digital Health Plans')
end

And(/^the user selects the provider link on Brighter Home page$/) do
  @brighter_home.select_provider_link
  @provider_home = ProviderHome.new(@browser)
  expect(@provider_home.contact_info_displayed?).to match('Provider Questions? 1.888.300.4742')
end

And(/^the user navigates to the provider login page$/) do
  @provider_home.select_login_button
  @provider_login = ProviderLogin.new(@browser)
  expect(@provider_login.login_text_displayed?).to match('Log into your account')
end

And(/^the user enters false (.*) in email form$/) do |email|
  @provider_login.enter_email(email)
end

And(/^the user enters valid (.*) in password form$/) do |password|
  @provider_login.enter_password(password)
end

And(/^the user select the login button$/) do
  @provider_login.select_login_button
end

And(/^the user receives an error message$/) do
  expect(@provider_login.error_message_displayed?).to match('Internal Server Error. Please try again later.')
end

And(/^the user selects the Sign Up button$/) do
  @provider_home.select_sign_up_button
end

And(/^the user enters a mismatch (.*)$/) do |phone_number|
  @find_practice = FindPractice.new(@browser)
  @find_practice.enter_number(phone_number)
end

And(/^the user selects the Find My Practice button$/) do
  @find_practice.select_find_practice_button
end

And(/^the user receives mismatch error message$/) do
  expect(@find_practice.mismatch_message_displayed?).to match('We are unable to find a match for that phone number.')
end

And(/^the user goes to Tax Credit Company website$/) do
  @navigation = Navigation.new(@browser)
  @navigation.navigate_to_page(@browser)
end

And(/^the user click on the Solutions tab$/) do
  @tax_solutions = TaxSolutions.new(@browser)
  @tax_solutions.select_solutions_tab
end

And(/^the user gets http codes from each (.*) in this page$/) do |link|
  uri = URI('https://taxcreditco.com/solutions/' + link)
  res = Net::HTTP.get_response(uri)
  puts res.code
end
