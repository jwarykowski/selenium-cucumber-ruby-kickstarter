class GoogleHomePage
  def initialize(driver)
    @driver = driver
  end

  def enter_search(search_term)
    input = @driver.find_element(:name => 'q');
    input.send_keys(search_term)
    input.send_keys(:enter)

    GoogleResultsPage.new(@driver)
  end

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => 'main') }
  end
end