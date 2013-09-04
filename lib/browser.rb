# @author Jonathan Chrisp
class Browser

  # Include Module Helpers
  include DateHelper
  include DirectoryHelper

  attr_reader :driver, :browserName, :xPosition, :yPosition, :screenWidth, :screenHeight, :log

  # Initialises Browser Class
  #
  # @param [String] browserName defines the browserName
  # @param [String] xPosition defines the xPosition
  # @param [String] yPosition defines the yPosition
  # @param [String] screenWidth defines the screenWidth
  # @param [String] screenHeight defines the screenHeight
  def initialize(browserName, xPosition, yPosition, screenWidth, screenHeight)
    @browserName     = browserName
    @screenshotDirectory = DirectoryHelper.createScreenshotDirectory
    @log             = Logger.new(DirectoryHelper.createLogDirectory + browserName + '-' + DateHelper.setLogTimestamp, 'daily')
    @driver          = startBrowser(@browserName)
    @xPosition       = xPosition
    @yPosition       = yPosition
    @screenWidth     = screenWidth
    @screenHeight    = screenHeight

    # Enjoy that test run.... :D
    @log.info('Browser initialised...enjoy that test run!')
  end

  # Deletes all cookies from the browser
  def deleteCookies
    @log.info('Deleting the ' + @browserName + 'browser cookies')
    @driver.manage.delete_all_cookies
  end

  # Moves the browser window to set position on screen
  def moveBrowser(xPosition, yPosition)
    # Set screenWidth and screenHeight if constant defined
    xPosition ? xPosition : xPosition = 0
    yPosition ? yPosition : yPosition = 0

    @log.info('Moving the browser to: ' + xPosition.to_s + ', ' + yPosition.to_s)
    @driver.manage.window.move_to(xPosition, yPosition)
  end

  # Opens google
  def openGoogle
    @log.info('Opening Google!!')
    begin
      # Delete cookies and then open browser with url passed
      self.deleteCookies
      @driver.navigate.to('http://www.google.co.uk')
    rescue
      @log.info('An issue occured when opening Google')
    else
    end

    # Return GoogleHome page instance
    return GoogleHomePage.new('GoogleHomePage', @driver, @log)
  end

  # Saves a screenshot
  def saveScreenshot(errorType)
    # Create fileName for the screenshot
    fileName = @screenshotDirectory + errorType + '-' + DateHelper.setScreenshotTimestamp + '.png'

    @log.info('Took screenshot and stored as: ' + fileName)
    
    # Give a brief delay and then take screenshot
    sleep(5)
    @driver.save_screenshot(fileName)
  end

  # Sets the timeout to find elements
  #
  # @param [String] timeout value for timeout
  def setTimeout(timeout)
    @log.info('Setting the selenium timeout to: ' + timeout.to_s)
    @driver.manage.timeouts.implicit_wait = timeout
  end

  # Sets the width and height of window
  #
  # @param [String] screenWidth sets the width of the browsers window
  # @param [String] screenHeight sets the height of the browsers window
  def setWindowSize(screenWidth, screenHeight)
    # Set screenWidth and screenHeight if defined
    screenWidth   ? screenWidth   : screenWidth   = 1280
    screenHeight  ? screenHeight  : screenHeight  = 1024

    @log.info('Setting the screen window size to: ' + screenWidth.to_s + 'x' + screenHeight.to_s)
    # @note this is currently supported in Chrome and FF
    @driver.manage.window.resize_to(screenWidth, screenHeight)
  end

  # Starts the browser
  #
  # @param [String] browser define browser to use
  def startBrowser(browser)
    @log.info('Starting the browser: ' + browser)

    # Define browser to use from config
    case browser
      when 'firefox'
        driver = Selenium::WebDriver.for :firefox
      when 'chrome'
        # Check Platform running script
        if RUBY_PLATFORM.downcase.include?("darwin")
          @log.info("Using the Mac operating system")
          driver = Selenium::WebDriver.for :chrome
        elsif RUBY_PLATFORM.downcase.include?("linux")
          @log.info("Using Linux operating system")
          Selenium::WebDriver::Chrome.path = "/usr/lib/chromium-browser/chromium-browser"
          driver = Selenium::WebDriver.for :chrome
        else
          # Default to standard if unable to determine
          @log.info("Unable to determine OS - probably Windows")
          driver = Selenium::WebDriver.for :chrome
        end
      when 'safari'
          driver = Selenium::WebDriver.for :safari
      when 'ios'
          if RUBY_PLATFORM.downcase.include?("darwin")
            driver = Selenium::WebDriver.for :iphone
          else
            raise "You can't run IOS tests on non-mac machine"
          end
      else
        # Default to using chrome
        @log.info("Couldn't determine the browser to use so using chrome")
        driver = Selenium::WebDriver.for :chrome
    end

    # Return driver
    return driver
  end

end