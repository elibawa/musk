require "spec_helper"

describe Musk::Decorator::PrintableTrack do
  it_should_behave_like "a decorator with zeroable attributes", [
    :position_number,
    :positions_count,
    :comment,
    :year,
  ]

  it_should_behave_like "a decorator with nullable attributes", [
    :path,
    :title,
    :artist,
    :album,
    :genre,
  ]

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
end
