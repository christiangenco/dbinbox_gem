# yardoc info: http://cheat.errtheblog.com/s/yard/

class Dbinbox
  # @author Christian Genco (@cgenco)
  VERSION = "0.0.1"

  require 'rest_client'

  # @attribute username [String] the username that items are sent to
  # @attribute path [String] the subdirectory items are sent to
  # @attribute record [Array] a record of all files uploaded
  attr_accessor :username, :path, :record

  # A new instance of Dbinbox, which will keep the username and path constant for multiple uploads.
  # 
  # @param [String] username_path initializes both the username and the path
  def initialize(username_path)
    @username, *@path = username_path.split("/")
  end

  # Uploads an array of files, strings, and directories to a specified user's dbinbox account under a specified path.
  # 
  # @example
  #   Dbinbox.send('USERNAME', ["hello there!", "cat.jpg", "dogs/"])
  #   Dbinbox.send('USERNAME/photos', ["beach.png"])
  # 
  # @param [String] username the username (and optional path) that items are sent to
  # @param [Array] args an array of files, strings, and directories to be uploaded
  def self.send(username, args)
    url = "http://dbinbox.com/send/#{username}"

    # force args to an array
    args = [args] unless args.respond_to? :each

    args.each{ |arg|
      if File.directory?(arg)
        # STDERR.puts "#{arg} is a directory"
        Dir.glob(File.join(arg, "*")).each{|f|
          Dbinbox.send("#{username}/#{arg}", f)
        }
      elsif File.exists?(arg)
        STDERR.puts "Uploading #{arg} to #{url}"
        RestClient.post(url, "files[]" => File.new(arg))
      else
        STDERR.puts "Sending \"#{arg}\" to #{url}"
        RestClient.post(url, "message" => arg)
      end
    }
  end

  # An alias for Dbinbox.send, but uses the username and filepath specified in the constructor.
  # 
  # @example
  #   dbinbox = Dbinbox.new('USERNAME')
  #   dbinbox.send ["hello there!", "cat.jpg", "dogs/"]
  # 
  #   dbinbox = Dbinbox.new('USERNAME/photos')
  #   dbinbox.send ["beach.png"]
  # 
  # @param [Array] args an array of files, strings, and directories to be uploaded
  def send(args)
    Dbinbox.send([@username, @path].join('/'), args)
  end
end