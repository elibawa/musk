require "musk/decorator/printable_track"

module Musk
  module Formatter
    class Pretty
      def self.print(tracks)
        tracks.each_with_index do |track, index|
          track = Musk::Decorator::PrintableTrack.new(track)
          puts if index > 0
          printf("%-10s%s\n", "Path:",     track.path)
          printf("%-10s%s\n", "Title:",    track.title)
          printf("%-10s%s\n", "Position:", track.position)
          printf("%-10s%s\n", "Artist:",   track.artist)
          printf("%-10s%s\n", "Album:",    track.album)
          printf("%-10s%s\n", "Genre:",    track.genre)
          printf("%-10s%s\n", "Year:",     track.year)
          printf("%-10s%s\n", "Comment:",  track.comment)
        end
      end
    end
  end
end
