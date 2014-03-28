require "taglib"

module Musk
  class TrackLoader
    def self.load!(path)
      new(path).load!
    end

    def initialize(path)
      @path = path
    end

    def load!
      verify_path!
      create_tracks
    end

    private

    def verify_path!
      unless @path and @path.length > 0
        raise "Undefined path to a file or files"
      end
      unless File.file?(@path) or File.directory?(@path)
        raise "Unknown path '#{@path}' to a file or files"
      end
      if File.file?(@path)
        unless File.extname(@path) == ".mp3"
          raise "Unknown extension '#{File.extname(@path)}'"
        end
      end
    end

    def create_tracks
      Dir[deeppath].map do |filepath|
        TagLib::MPEG::File.open(filepath) do |file|
          Musk::TrackAdapter.adapt(file.id3v2_tag).tap do |track|
            track.loadpath = loadpath
            track.fullpath = filepath
          end
        end
      end
    end

    def deeppath
      @deeppath ||= File.file?(fullpath) ? fullpath : File.join(fullpath, "**", "*.mp3")
    end

    def loadpath
      @loadpath ||= "#{File.file?(fullpath) ? basepath : fullpath}#{File::SEPARATOR}"
    end

    def basepath
      @basepath ||= File.dirname(fullpath)
    end

    def fullpath
      @fullpath ||= File.expand_path(@path)
    end
  end
end
