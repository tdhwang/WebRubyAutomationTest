require 'selenium-webdriver'

Before do
  if ENV['REMOTE'].eql? 'true'
    capabilities = Selenium::WebDriver::Remote::Capabilities.new
    capabilities['platform'] = 'any'
    capabilities['browserName'] = 'chrome'

    tries = 0

    begin
      @browser = Selenium::WebDriver.for(
        :remote,
        url: ENV['SE_HUB_URL'],
        desired_capabilities: capabilities
      )
      @browser.manage.window.resize_to(1280, 800)
    rescue Net::ReadTimeout => e
      # rubocop:disable Style/GuardClause
      if tries < 3
        # rubocop:enable Style/GuardClause
        tries += 1
        sleep 3
        retry
      else
        raise e
      end
    end
  else
    @browser = Selenium::WebDriver.for :chrome
  end
  @wait = Selenium::WebDriver::Wait.new(timeout: 15)
end

After do |_scenario|
  @browser.quit
  sleep(2)
end
