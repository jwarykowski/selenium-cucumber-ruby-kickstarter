# @author Jonathan Chrisp
module DirectoryHelper
  
  # Create directory for screenshots
  def DirectoryHelper.createScreenshotDirectory
    begin
      # Set Time for directory name
      directoryName  = "#{Dir::pwd}/screenshots/#{DateHelper.setDirectoryDateStamp}/"

      # Check if directory already exists
      if FileTest::directory?(directoryName)
        # directory exists so ignore
      else
        Dir::mkdir(directoryName)
      end
    end

    # Return Dirctory
    return directoryName
  end

  # Create directory for log files
  def DirectoryHelper.createLogDirectory
    begin
      # Set Time for directory name
      directoryName  = "#{Dir::pwd}/logs/#{DateHelper.setDirectoryDateStamp}/"

      # Check if directory already exists
      if FileTest::directory?(directoryName)
        # directory exists so ignore
      else
        Dir::mkdir(directoryName)
      end
    end

      # Return Dirctory
      return directoryName
    end

  end