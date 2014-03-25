shared_examples "the track decorator with nullable attributes" do |attributes|
  let(:decorator) { Musk::Decorator::PrintableTrack }

  attributes.each do |attribute|
    describe "##{attribute}" do
      context "when track.#{attribute} == nil" do
        it "should return '-'" do
          track = build(:track)
          allow(track).to receive(attribute).and_return(nil)
          decorator.new(track).send(attribute).should eq("-")
        end
      end

      context "else" do
        it "should return track.#{attribute}" do
          track = build(:track)
          allow(track).to receive(attribute).and_return("VaLuE")
          decorator.new(track).send(attribute).should eq("VaLuE")
        end
      end
    end
  end
end
