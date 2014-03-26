require "spec_helper"

describe Musk::Track do
  it { should respond_to(:loadpath) }
  it { should respond_to(:loadpath=) }
  it { should respond_to(:fullpath) }
  it { should respond_to(:fullpath=) }
  it { should respond_to(:title) }
  it { should respond_to(:title=) }
  it { should respond_to(:position_number) }
  it { should respond_to(:position_number=) }
  it { should respond_to(:positions_count) }
  it { should respond_to(:positions_count=) }
  it { should respond_to(:artist) }
  it { should respond_to(:artist=) }
  it { should respond_to(:release) }
  it { should respond_to(:release=) }
  it { should respond_to(:genre) }
  it { should respond_to(:genre=) }
  it { should respond_to(:year) }
  it { should respond_to(:year=) }
  it { should respond_to(:comment) }
  it { should respond_to(:comment=) }

  describe "#attributes" do
    it "should return a track attributes hash" do
      track = build(:jets_track)
      track.attributes.should eq(Hash[
        Musk::Track::ATTRIBUTES.map {|a| [a, track.send("#{a}")]}
      ])
    end
  end
end
