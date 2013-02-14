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
browser = Browser.new(ENV['BROWSERNAME'], ENV['XPOSITION'], ENV['YPOSITION'], ENV['SCREENWIDTH'], ENV['SCREENHEIGHT'])
browser.setWindowSize(browser.screenWidth, browser.screenHeight)
browser.moveBrowser(browser.xPosition, browser.yPosition)
browser.deleteCookies
browser.setTimeout(20)

# Actions performed before each scenario
Before do |scenario|
  # Create browser instance variable
  @browser = browser
  browser.log.info('Starting the scenario: ' + "#{scenario.scenario_outline.name}")
end

at_exit do
  browser.log.info('Quiting the browser at: ' + DateHelper.setLogTimestamp)
  browser.driver.quit
end
