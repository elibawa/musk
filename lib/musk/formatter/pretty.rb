module Musk
  module Formatter
    class Pretty
      def self.print(tracks)
        new(tracks).print
      end

      def initialize(tracks)
        @tracks = tracks.map { |t| Musk::Decorator::PrintableTrack.new(t) }
        @fields = [:path, :title, :position, :artist, :release, :genre, :year, :comment]
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
