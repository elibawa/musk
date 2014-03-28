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

    def fullpath
      @fullpath ||= File.expand_path(@path)
    end

    def basepath
      @basepath ||= File.dirname(fullpath)
    end

    def loadpath
      @loadpath ||= "#{File.file?(fullpath) ? basepath : fullpath}#{File::SEPARATOR}"
    end

    def deeppath
      @deeppath ||= File.file?(fullpath) ? fullpath : File.join(fullpath, "**", "*.mp3")
    end

    def create_tracks
      Dir[deeppath].map do |filepath|
        TagLib::MPEG::File.open(filepath) do |file|
          create_track(filepath, file.id3v2_tag)
        end
      end
    end

    def create_track(filepath, tag)
      Musk::Track.new.tap do |track|
        track.attributes = {
          loadpath:  loadpath,
          fullpath:  filepath,
          number:    tag.frame_list("TRCK").first.to_s.split("/").first,
          number_of: tag.frame_list("TRCK").first.to_s.split("/").last,
          title:     tag.title,
          artist:    tag.artist,
          release:   tag.album,
          genre:     tag.genre,
          year:      tag.year.to_s,
          comment:   tag.comment,
        }
      end
    end
  end
end
