# @author Jonathan Chrisp
class GoogleResultsPage
  include DateHelper
  include DirectoryHelper

  attr_reader :name, :driver, :log

  # Initialises GoogleSearchPage Class
  #
  # @param [String] name defines the name of the instance
  # @param [Object] driver defines the driver instance
  # @param [Object] log defines the log instance
  def initialize(name, driver, log)
    @name 	= name
    @driver = driver
    @log		= log

    @search_results_container = Element.new('search_results_container', :css, 'div[id="search"]', @driver, @log)
  end

  # Verifies Elements for page
  def verify_self
    self.verify_google_search_input
  end

  # Verifies Google Search Results container
  def verify_google_search_input
    @search_results_container.find_element
    @search_results_container.verify_element
  end

end