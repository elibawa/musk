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
        "#{position_number}/#{positions_count}"
      end

      def position_number
        [nil, 0, "0"].include?(@track.position_number) ? "-" : @track.position_number
      end

      def positions_count
        [nil, 0, "0"].include?(@track.positions_count) ? "-" : @track.positions_count
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
