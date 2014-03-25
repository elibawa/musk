require "spec_helper"

describe Musk::Formatter::CSV do
  describe ".print(tracks)" do
    let(:tracks) do
      [build(:jets_track), build(:kamakura_track)]
    end

    let(:printable_tracks) do
      tracks.map {|t| Musk::Decorator::PrintableTrack.new(t)}
    end

    let(:attributes) do
      [:path, :title, :position, :artist, :album, :genre, :year, :comment]
    end

    let(:stdout) do
      printable_tracks.map do |track|
        attributes.map {|a| track.send(a)}.join(",").concat("\n")
      end.join
    end

    it "should print tracks to STDOUT in the csv format" do
      capture_stdout { described_class.print(tracks) }.should eq(stdout)
    end
  end
end
