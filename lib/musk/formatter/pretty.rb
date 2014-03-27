module Musk
  module Formatter
    class Pretty < Base
      def self.print(tracks)
        new(tracks).print
      end

      def print
        puts @tracks.map { |t| printed(t) }.join("\n")
      end

      private

      def printed(track)
        @fields.map { |f| sprintf("%-10s%s\n", "#{f.capitalize}:", track.send(f)) }.join
      end
    end
  end
end
