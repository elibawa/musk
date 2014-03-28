module Musk
  module Decorator
    class PrintableTrack
      def initialize(track)
        @track = track
      end

      def path
        @track.fullpath.gsub(@track.loadpath, "")
      end

      def position
        "#{number}/#{number_of}"
      end

      def number
        [nil, 0, "0"].include?(@track.number) ? "-" : @track.number
      end

      def number_of
        [nil, 0, "0"].include?(@track.number_of) ? "-" : @track.number_of
      end

      def year
        [nil, 0, "0"].include?(@track.year) ? "-" : @track.year
      end

      def comment
        [nil, 0, "0"].include?(@track.comment) ? "-" : @track.comment
      end

      def title
        @track.title or "-"
      end

      def artist
        @track.artist or "-"
      end

      def release
        @track.release or "-"
      end

      def genre
        @track.genre or "-"
      end
    end
  end
end
