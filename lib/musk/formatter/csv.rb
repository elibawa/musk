module Musk
  module Formatter
    class CSV < Base
      def self.print(tracks)
        new(tracks).print
      end

      def print
        @tracks.each { |t| puts printed(t) }
      end

      private

      def printed(track)
        @fields.map { |f| track.send(f) }.join(",")
      end
    end
  end
end
