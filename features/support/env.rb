# Rubygems and Bundler
require "rubygems"
require "bundler/setup"

# Gems
require "selenium-webdriver"
require "test/unit/assertions"
require "cucumber"
require "xmlsimple"
require "net/http"
require "nokogiri"
require "require_all"

require_all 'lib'

# Setup Browser
browser = Browser.new(ENV['CONTROLLER'], ENV['XPOSITION'], ENV['YPOSITION'], ENV['SCREENWIDTH'], ENV['SCREENHEIGHT'])
browser.set_window_size(browser.screen_width, browser.screen_height)
browser.move_browser(browser.x_position, browser.y_position)
browser.delete_cookies
browser.set_timeout(20)

# Actions performed before each scenario
Before do |scenario|
  # Create browser instance variable
  @browser = browser
  browser.log.info('Starting the scenario: ' + "#{scenario.scenario_outline.name}")
end

at_exit do
  browser.log.info('Quiting the browser at: ' + DateHelper.set_log_timestamp)
  browser.driver.quit
end
