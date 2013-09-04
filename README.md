[![Build Status](https://travis-ci.org/jonathanchrisp/Selenium-Cucumber-Ruby-Kickstarter.png?branch=master)](https://travis-ci.org/jonathanchrisp/Selenium-Cucumber-Ruby-Kickstarter)
[![Dependency Status](https://gemnasium.com/jonathanchrisp/selenium-cucumber-ruby-kickstarter.png)](https://gemnasium.com/jonathanchrisp/selenium-cucumber-ruby-kickstarter)
[![Code Climate](https://codeclimate.com/github/jonathanchrisp/Selenium-Cucumber-Ruby-Kickstarter.png)](https://codeclimate.com/github/jonathanchrisp/Selenium-Cucumber-Ruby-Kickstarter)

#selenium-cucumber-ruby-kickstarter

##Background

A quick example of how to bring Selenium, Cucumber and Ruby together to automate a Google Search.
Each test run creates a log file, please see the relevant logs folder following each run.
This is a very quick example to demo Ruby, Cucumber and Selenium Webdriver.

### Getting Started
      1. Ensure you have the chrome browser and chromedriver setup
      2. Ensure you have ruby installed (built and run with 1.9.2) - use rvm
      3. Ensure you have rubygems and the bundler installed
      4 .Navigate to project in terminal
      5. Run 'bundle install'
      6. Run 'cukesparse kickstarter'

Enjoy that test run....

Please note that this will run the feature in the firefox browser as default. To run this test in chrome just pass the argument
`-c chrome`  e.g. `cukesparse kickstarter -c chrome`

## Cukesparse Gem

The Selenium-Cucumber-Ruby-Kickstarter project uses the cukesparse gem which I created to easily pass default and custom arguments to Cucumber.
To find out more about this gem, please visit: https://github.com/jonathanchrisp/cukesparse

## Feedback
I would be more than happy to recieve feedback, please email me at: jonathan.chrisp@gmail.com.
