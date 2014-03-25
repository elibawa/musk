module Musk
  module Formatter
    class Pretty
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
        tracks.each_with_index do |track, index|
          puts if index > 0
          ATTRIBUTES.map do |attribute|
            track = Musk::Decorator::PrintableTrack.new(track)
            printf("%-10s%s\n", "#{attribute.capitalize}:", track.send(attribute))
          end
        end
      end
    end
  end
end
