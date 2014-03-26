module Musk
  module Formatter
    class Pretty
      ATTRIBUTES = [
        :path,
        :title,
        :position,
        :artist,
        :release,
        :genre,
        :year,
        :comment,
      ]

      def self.print(tracks)
        tracks.each_with_index do |track, index|
          track = Musk::Decorator::PrintableTrack.new(track)
          puts if index > 0
          ATTRIBUTES.map do |attribute|
            printf("%-10s%s\n", "#{attribute.capitalize}:", track.send(attribute))
          end
        end
      end
    end
  end
end
