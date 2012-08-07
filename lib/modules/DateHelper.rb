# @author Jonathan Chrisp
module DateHelper

  # Sets the log timestamp
  def DateHelper.setLogTimestamp
    @time = Time.now
    return @time.strftime("%m-%d-%y-%H-%M-%S")
  end

  # Sets the output directory timestamp
  def DateHelper.setDirectoryDateStamp
    @time = Time.now
    return @time.strftime("%m-%d-%y")
  end

  # Sets the screenshot  timestamp
  def DateHelper.setScreenshotTimestamp
    @time = Time.now
    return @time.strftime("%m-%d-%y-%H-%M-%S")
  end

  # Set timestamp using the format 15-03-00
  def DateHelper.setTimestamp
    @time = Time.now
    return @time.strftime("%H-%M-%S")
  end

  # Create date stamp using the format 05-11-12
  def DateHelper.setDatestamp
    @time = Time.now
    return @time.strftime("%m-%d-%y")
  end

  # Create date and time stamp using the format 05-11-12 15:03:00
  def DateHelper.setDateTimestamp
    @time = Time.now
    return @time.strftime("%m-%d-%y %H:%M:%S")
  end
  
end