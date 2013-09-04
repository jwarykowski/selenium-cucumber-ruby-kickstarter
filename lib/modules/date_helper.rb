# @author Jonathan Chrisp
module DateHelper

  # Sets the log timestamp
  def DateHelper.set_log_timestamp
    Time.now.strftime("%m-%d-%y-%H-%M-%S")
  end

  # Sets the output directory timestamp
  def DateHelper.set_directory_datestamp
    Time.now.strftime("%m-%d-%y")
  end

  # Set timestamp using the format 15-03-00
  def DateHelper.set_timestamp
    Time.now.strftime("%H-%M-%S")
  end

  # Create date stamp using the format 05-11-12
  def DateHelper.set_datestamp
    Time.now.strftime("%m-%d-%y")
  end

  # Create date and time stamp using the format 05-11-12 15:03:00
  def DateHelper.set_date_timestamp
    Time.now.strftime("%m-%d-%y %H:%M:%S")
  end

end