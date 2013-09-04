# @author Jonathan Chrisp
class GoogleHomePage

	# Include Module Helpers
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

 		@googleSearchInput = Element.new('googleSearchInput', :css, 'input[id="gbqfq"]', @driver, @log)
 	end

 	# Verifies Elements for page
 	def verifySelf
 		self.verifyGoogleSearchInput
 	end

 	# Enters search into Google Homepage
  #
  # @param [String] searchTerm defines the searchTerm to enter
 	def enterSearch(searchTerm)
 		@googleSearchInput.sendKeys(searchTerm)
 		@googleSearchInput.pressEnter

 		# Return instance of the Google Results Page
 		return GoogleResultsPage.new('GoogleResultsPage', @driver, @log)
 	end

 	# Verifies Google Search Input
 	def verifyGoogleSearchInput
 		@googleSearchInput.findElement
 		@googleSearchInput.verifyElement
 	end

end