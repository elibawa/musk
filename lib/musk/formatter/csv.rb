module Musk
  module Formatter
    class CSV
      def self.print(tracks)
        new(tracks).print
      end

      def initialize(tracks)
        @tracks = tracks.map {|t| Musk::Decorator::PrintableTrack.new(t)}
        @fields = [:path, :title, :position, :artist, :release, :genre, :year, :comment]
      end

      def print
        @tracks.each {|t| puts @fields.map {|f| t.send(f)}.join(",")}
      end
    end
  end
end
