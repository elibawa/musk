module Musk
  module Formatter
    class Base
      def initialize(tracks)
        @tracks = tracks.map { |t| Musk::Decorator::PrintableTrack.new(t) }
        @fields = [:path, :title, :position, :artist, :release, :genre, :year, :comment]
      end
    end
  end
end
