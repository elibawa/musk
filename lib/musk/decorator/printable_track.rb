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

      [:position_number, :positions_count, :year, :comment].each do |method|
        define_method(method) do
          [nil, 0, "0"].include?(@track.send(method)) ? "-" : @track.send(method)
        end
      end

      [:title, :artist, :album, :genre].each do |method|
        define_method(method) do
          @track.send(method) or "-"
        end
      end
    end
  end
end
