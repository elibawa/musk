require "taglib"

module Musk
  class TrackLoader
    def self.load!(path)
      unless path and path.length > 0
        raise "Undefined path to a file or files"
      end
      unless File.file?(path) or File.directory?(path)
        raise "Unknown path '#{path}' to a file or files"
      end
      if File.file?(path)
        unless File.extname(path) == ".mp3"
          raise "Unknown extension '#{File.extname(path)}'"
        end
      end
      path = File.expand_path(path)
      loadpath = "#{File.file?(path) ? File.dirname(path) : path}#{File::SEPARATOR}"
      deeppath = File.file?(path) ? path : File.join(path, "**", "*.mp3")
      Dir[deeppath].map do |fullpath|
        track = Musk::Track.new
        track.loadpath = loadpath
        track.fullpath = fullpath
        TagLib::MPEG::File.open(fullpath) do |file|
          tag = file.id3v2_tag
          if tag.frame_list("TRCK").first
            number, count = tag.frame_list("TRCK").first.to_s.split("/")
            track.position_number = number.to_i
            track.positions_count = count.to_i
          end
          track.title   = tag.title
          track.artist  = tag.artist
          track.release = tag.album
          track.genre   = tag.genre
          track.year    = tag.year
          track.comment = tag.comment
        end
        track
      end
    end
  end
end
