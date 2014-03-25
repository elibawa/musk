module Musk
  module Formatter
    class CSV
      ATTRIBUTES = [
        :path,
        :title,
        :position,
        :artist,
        :album,
        :genre,
        :year,
        :comment,
      ]

      def self.print(tracks)
        tracks.each do |track|
          track = Musk::Decorator::PrintableTrack.new(track)
          puts ATTRIBUTES.map {|a| track.send(a)}.join(",")
        end
      end
    end
  end
end
