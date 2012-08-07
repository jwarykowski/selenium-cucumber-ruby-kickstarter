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

# Create hashes for scenario data
scenario_times      = Array.new
scenario_fails      = Array.new
scenario_passed     = Array.new
scenario_exceptions = Array.new

Around() do |scenario, block|
  # Start Time
  startTime = Time.now

  # Wait for block call
  block.call

  # Calculate total time and store in scenarioDetails
  totalTime       = Time.now - startTime
  scenarioDetails = "#{scenario.scenario_outline.name}" + ' - ' + "#{totalTime.round(2)}"

  # Update scenario_times array
  scenario_times.push(scenarioDetails)
end

# Actions performed after each scenario
After do |scenario|
  if scenario.failed?
    browser.log.error('Cucumber failed scenario at: ' + DateHelper.setLogTimestamp)
    browser.saveScreenshot('failed')
    scenario_fails.push("#{scenario.scenario_outline.name}")
  end

  if scenario.exception
    browser.log.error('Cucumber scenario exception ' + ' at: ' + DateHelper.setLogTimestamp)
    scenario_exceptions.push("#{scenario.scenario_outline.name}")
  end

  if scenario.passed?
    browser.log.info('Cucumber passed scenario at: ' + DateHelper.setLogTimestamp)
    scenario_passed.push("#{scenario.scenario_outline.name}")
  end
end

at_exit do
  # Output the scenario performance
  browser.log.info('------------- SCENARIO PERFORMANCE -------------')
  scenario_times.each_with_index do |value, index| 
    browser.log.info("#{index} - #{value} secs")
  end

  # Output the scenario fails
  browser.log.info('') # HACK - Create a new line 
  browser.log.info('-------------- SCENARIO FAILURES ---------------')
  scenario_fails.each_with_index do |value, index| 
    browser.log.info("#{index} - #{value}")
  end

  # Output the scenario exceptions
  browser.log.info('') # HACK - Create a new line 
  browser.log.info('------------- SCENARIO EXCEPTIONS --------------')
  scenario_exceptions.each_with_index do |value, index| 
    browser.log.info("#{index} - #{value}")
  end

  # Output the scenario exceptions
  browser.log.info('') # HACK - Create a new line 
  browser.log.info('--------------- SCENARIO PASSES ----------------')
  scenario_passed.each_with_index do |value, index| 
    browser.log.info("#{index} - #{value}")
  end

  # Quit Browser
  browser.log.info('') # HACK - Create a new line 
  browser.log.info('Quiting the browser at: ' + DateHelper.setLogTimestamp)
  browser.driver.quit
end
