require 'spec_helper'

describe Musk::TrackFormatter do
  subject { Musk::TrackFormatter }

  describe ".format!(format, tracks)" do
    let(:tracks) { build_list(:track, 2) }

    context "when format is the pretty format" do
      it "should call Musk::Format::Pretty.format(tracks)" do
        allow(Musk::Format::Pretty).to receive(:format).with(tracks)
        Musk::TrackFormatter.format!('pretty', tracks)
        expect(Musk::Format::Pretty).to have_received(:format).with(tracks)
      end
    end

    context "when format is an unsupported format" do
      it "should raise \"Unknown format '{format}'\"" do
        error = "Unknown format 'unsupported'"
        expect { subject.format!('unsupported', tracks) }.to raise_error(error)
      end
    end
  end
end
