# @author Jonathan Chrisp
module DirectoryHelper

  # Create directory for log files
  def DirectoryHelper.create_log_directory
    begin
      # Set Time for directory name
      directory_name  = "#{Dir::pwd}/logs/#{DateHelper.set_directory_datestamp}/"

      # Check if directory already exists
      if FileTest::directory?(directory_name)
        # directory exists so ignore
      else
        Dir::mkdir(directory_name)
      end
    end

    return directory_name
    end

  end