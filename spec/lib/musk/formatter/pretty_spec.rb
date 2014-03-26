require "spec_helper"

describe Musk::Formatter::Pretty do
  describe ".print(tracks)" do
    let(:tracks) {[build(:jets_track), build(:kamakura_track)]}
    let(:stdout) do
      printable_tracks = tracks.map {|t| Musk::Decorator::PrintableTrack.new(t)}
      printable_tracks.map do |track|
        "Path:     #{track.path}\n"\
        "Title:    #{track.title}\n"\
        "Position: #{track.position}\n"\
        "Artist:   #{track.artist}\n"\
        "Release:  #{track.release}\n"\
        "Genre:    #{track.genre}\n"\
        "Year:     #{track.year}\n"\
        "Comment:  #{track.comment}\n"
      end.join("\n")
    end

    it "should print tracks to STDOUT in the pretty format" do
      capture_stdout {described_class.print(tracks)}.should eq(stdout)
    end
  end
end
