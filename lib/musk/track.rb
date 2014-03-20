require 'taglib'

module Musk
  class Track
    attr_accessor :path,
                  :title,
                  :position,
                  :artist,
                  :album,
                  :genre,
                  :year,
                  :comment

    def self.supported_formats
      ["mp3"]
    end

    def self.supported_extensions
      supported_formats.map { |f| ".#{f}" }
    end

    def self.load!(path)
      unless path and path.length > 0
        raise "Undefined path to a file or files"
      end
      unless File.file?(path) or File.directory?(path)
        raise "Unknown path '#{path}' to a file or files"
      end
      if File.file?(path)
        unless supported_extensions.include?(File.extname(path))
          raise "Unknown extension '#{File.extname(path)}'"
        end
      end
      if File.directory?(path)
        path = File.join(path, "**", "*.{#{supported_formats.join(',')}}")
      end
      Dir[path].map do |path|
        track = new
        track.path = path
        TagLib::MPEG::File.open(path) do |file|
          tag = file.id3v2_tag
          track.title    = tag.title
          track.position = tag.track
          track.artist   = tag.artist
          track.album    = tag.album
          track.genre    = tag.genre
          track.year     = tag.year
          track.comment  = tag.comment
        end
        track
      end
    end
  end
end
