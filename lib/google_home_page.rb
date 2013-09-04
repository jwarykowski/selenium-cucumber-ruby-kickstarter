# @author Jonathan Chrisp
class GoogleHomePage
  include DateHelper
  include DirectoryHelper

  attr_reader :name, :driver, :log

  # Initialises GoogleHomePage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  def initialize(name, driver, log)
    @name 	= name
    @driver = driver
    @log		= log

    @google_search_input = Element.new('google_search_input', :css, 'input[id="gbqfq"]', @driver, @log)
  end

  # Verifies Elements for page
  def verify_self
    self.verify_google_search_input
  end

  # Enters search into Google Homepage
  #
  # @param [String] search_term defines the searchTerm to enter
  def enter_search(search_term)
    @google_search_input.send_keys(search_term)
    @google_search_input.press_enter

    # Return instance of the Google Results Page
    return GoogleResultsPage.new('google_results_page', @driver, @log)
  end

  # Verifies Google Search Input
  def verify_google_search_input
    @google_search_input.find_element
    @google_search_input.verify_element
  end
end