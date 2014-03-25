shared_examples "a decorator with zeroable attributes" do |attributes|
  subject { Musk::Decorator::PrintableTrack }

  attributes.each do |attribute|
    describe "##{attribute}" do
      context "when track.#{attribute} == nil" do
        it "should return '-'" do
          track = build(:track)
          allow(track).to receive(attribute).and_return(nil)
          subject.new(track).send(attribute).should eq("-")
        end
      end

      context "when track.#{attribute} == 0" do
        it "should return '-'" do
          track = build(:track)
          allow(track).to receive(attribute).and_return(0)
          subject.new(track).send(attribute).should eq("-")
        end
      end

      context "when track.#{attribute} == \"0\"" do
        it "should return '-'" do
          track = build(:track)
          allow(track).to receive(attribute).and_return("0")
          subject.new(track).send(attribute).should eq("-")
        end
      end

      context "else" do
        it "should return track.#{attribute}" do
          track = build(:track)
          allow(track).to receive(attribute).and_return("VaLuE")
          subject.new(track).send(attribute).should eq("VaLuE")
        end
      end
    end
  end
end
