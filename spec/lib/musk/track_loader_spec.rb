require "spec_helper"

describe Musk::TrackLoader do
  describe ".supported_formats" do
    it "should return ['mp3']" do
      described_class.supported_formats.should eq(["mp3"])
    end
  end

  describe ".supported_extensions" do
    it "should return ['.mp3']" do
      described_class.supported_extensions.should eq([".mp3"])
    end
  end

  describe ".load!(path)" do
    context "when path.nil?" do
      it "should raise \"Undefined path to a file or files\"" do
        error = "Undefined path to a file or files"
        expect { described_class.load!(nil) }.to raise_error(error)
      end
    end

    context "when path.empty?" do
      it "should raise \"Undefined path to a file or files\"" do
        error = "Undefined path to a file or files"
        expect { described_class.load!("") }.to raise_error(error)
      end
    end

    context "when path is a nonexistent directory" do
      it "should raise \"Unknown path '{path}' to a file or files\"" do
        path = File.join(ENV["MUSK_TRACKS_PATH"], "/nonexistent")
        error = "Unknown path '#{path}' to a file or files"
        expect { described_class.load!(path) }.to raise_error(error)
      end
    end

    context "when path is an exisiting directory" do
      it "should create tracks from files in the directory and its subdirectories" do
        described_class.load!(ENV["MUSK_TRACKS_PATH"]).should be_tracks([
          build(:jets_track, :loaded),
          build(:kamakura_track, :loaded),
        ])
      end
    end

    context "when path is a nonexistent file" do
      it "should raise \"Unknown path '{path}' to a file or files\"" do
        path = File.join(ENV["MUSK_TRACKS_PATH"], "/nonexistent.mp3")
        error = "Unknown path '#{path}' to a file or files"
        expect { described_class.load!(path) }.to raise_error(error)
      end
    end

    context "when path is an existing file that is unsupported" do
      it "should raise \"Unknown extension '{extension}'\"" do
        path = File.join(ENV["MUSK_TRACKS_PATH"], "/track.bad")
        error = "Unknown extension '.bad'"
        allow(File).to receive(:file?).with(path).and_return(true)
        expect { described_class.load!(path) }.to raise_error(error)
      end
    end

    context "when path is an existing file that is supported" do
      it "should create a track from the file" do
        path = File.join(ENV["MUSK_TRACKS_PATH"], "/bonobo/jets.mp3")
        described_class.load!(path).should be_tracks([build(:jets_track, :loaded)])
      end
    end
  end
end
