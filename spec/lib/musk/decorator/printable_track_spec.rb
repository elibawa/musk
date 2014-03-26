require "spec_helper"

describe Musk::Decorator::PrintableTrack do
  describe "#path" do
    it "should return track.fullpath.gsub(track.loadpath, '')" do
      track = build(:track)
      allow(track).to receive(:loadpath).and_return("/tmp")
      allow(track).to receive(:fullpath).and_return("/tmp/tracks/track.mp3")
      path = described_class.new(track).path
      path.should eq("/tracks/track.mp3")
      expect(track).to have_received(:loadpath)
      expect(track).to have_received(:fullpath)
    end
  end

  describe "#position" do
    it "should return '{position_number}/{positions_count}'" do
      track = described_class.new(build(:track))
      allow(track).to receive(:position_number).and_return(1)
      allow(track).to receive(:positions_count).and_return(2)
      position = track.position
      position.should eq("1/2")
      expect(track).to have_received(:position_number)
      expect(track).to have_received(:positions_count)
    end
  end

  it_should_behave_like "the track decorator with zeroable attributes", [
    :position_number,
    :positions_count,
    :comment,
    :year,
  ]

  it_should_behave_like "the track decorator with nullable attributes", [
    :title,
    :artist,
    :release,
    :genre,
  ]
end
