# @author Jonathan Chrisp
class GoogleResultsPage

	# Include Module Helpers
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

 		@searchResultsContainer = Element.new('searchResultsContainer', :css, 'div[id="search"]', @driver, @log)
 	end

 	# Verifies Elements for page
 	def verifySelf
 		self.verifyGoogleSearchInput
 	end

 	# Verifies Google Search Results container
 	def verifyGoogleSearchInput
 		@searchResultsContainer.findElement
 		@searchResultsContainer.verifyElement
 	end

end