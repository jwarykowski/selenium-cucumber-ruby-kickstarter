# @author Jonathan Chrisp
class Element
  include DateHelper
  include DirectoryHelper

  attr_reader :name, :selector, :path, :driver, :element

  # Initialises Element Class
  #
  # @param [String] name names the element
  # @param [Symbol] selector defines the selctor for the element e.g. :name, :css etc
  # @param [String] path defines the path to the element
  # @param [Object] driver the driver instance
  # @param [Object] log the log instance
  def initialize(name, selector, path, driver, log)
    @name 	  = name
    @selector = selector
    @path 	  = path
    @driver   = driver
    @log 	  	= log

    @log.debug('Creating new element: ' + @name)
  end

  # Highlights the element
  def highlight_element
    old_style = @element.attribute('style')
    @driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", @element, old_style + " outline: 1px dashed red;");
  end

  # Asserts the text passed against element text
  def assert_text(text)
    @log.info('Asserting text: ' + text + ' against element text!')
    begin
      if @element.text == text
        @log.info('Text matches')
      else
      @log.info('Text does not match as expected')
        raise 'Text does not match as expected'
      end
    end
  end

  # Clicks the element defined
  def click_element
    @log.info('Clicking the ' + @name + ' element')
    @element.click
  end

  # Find element within the application
  def find_element
    @log.debug('Finding the ' + @name + ' element using ' + @selector.to_s + ' and ' + @path)

    # Try and find the element and highlight if set to true
    begin
      @element = @driver.find_element(@selector, @path)
      self.highlight_element
    rescue Exception => e
      @log.error('Failed while trying to find element: ' + @name )
      @log.error('Failed xpath:' + @path )
      raise 'Failed while trying to find element: ' + @name
    end
  end

  # Get the text within the element
  def get_text
    @log.debug('Returning ' + @name + ' elements text: ' + @element.text)
    return @element.text
  end

  # Enters the required text into the element
  #
  # @param [String] text the text entered into the element
  def send_keys(text)
    @log.info('Sending ' + @name + ' element text: ' + text)
    @element.send_keys(text)
  end

  # Presses the enter key on the element
  def press_enter
    @log.debug('Pressing enter ' + @name + ' element')
    @element.send_keys(:enter)
  end

  # Verify the element is displayed as expected
  #
  # @param [Integer] timeout the amount of time to find element
  def verify_element(timeout = 20)
    @log.debug('Verifying the ' + @name + ' element')

    # Verify the Element is on the page as expected
    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
      wait.until { @element.displayed? }
    rescue Exception => e
      @log.error('Failed while trying to verify element: ' + e.message )
      # Raise error to cucumber so scenario skipped
      raise 'Failed while trying to verify element: ' + e.message
    end
  end
end