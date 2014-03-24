require "spec_helper"

describe Musk::TrackPrinter do
  describe ".print!(format, tracks)" do
    let(:tracks) { build_list(:track, 2) }

    context "when format is the pretty format" do
      it "should call Musk::Formatter::Pretty.print(tracks)" do
        allow(Musk::Formatter::Pretty).to receive(:print).with(tracks)
        described_class.print!('pretty', tracks)
        expect(Musk::Formatter::Pretty).to have_received(:print).with(tracks)
      end
    end

    context "when format is an unsupported format" do
      it "should raise \"Unknown format '{format}'\"" do
        error = "Unknown format 'unsupported'"
        expect { described_class.print!('unsupported', tracks) }.to raise_error(error)
      end
    end
  end
end
