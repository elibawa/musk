require "spec_helper"

describe Musk::Formatter::CSV do
  describe ".print(tracks)" do
    let(:tracks) {[build(:jets_track), build(:kamakura_track)]}
    let(:stdout) do
      printable_tracks = tracks.map {|t| Musk::Decorator::PrintableTrack.new(t)}
      printable_tracks.map do |track|
        "#{track.path},"\
        "#{track.title},"\
        "#{track.position},"\
        "#{track.artist},"\
        "#{track.release},"\
        "#{track.genre},"\
        "#{track.year},"\
        "#{track.comment}\n"
      end.join
    end

    it "should print tracks to STDOUT in the csv format" do
      capture_stdout {described_class.print(tracks)}.should eq(stdout)
    end
  end
end
