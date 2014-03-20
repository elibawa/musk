require 'spec_helper'

describe Musk::Track do
  it { should respond_to(:path) }
  it { should respond_to(:path=) }
  it { should respond_to(:title) }
  it { should respond_to(:title=) }
  it { should respond_to(:position) }
  it { should respond_to(:position=) }
  it { should respond_to(:artist) }
  it { should respond_to(:artist=) }
  it { should respond_to(:album) }
  it { should respond_to(:album=) }
  it { should respond_to(:genre) }
  it { should respond_to(:genre=) }
  it { should respond_to(:year) }
  it { should respond_to(:year=) }
  it { should respond_to(:comment) }
  it { should respond_to(:comment=) }

  describe ".supported_formats" do
    it "should return ['mp3']" do
      subject.class.supported_formats.should eq(['mp3'])
    end
  end

  describe ".supported_extensions" do
    it "should return ['.mp3']" do
      subject.class.supported_extensions.should eq(['.mp3'])
    end
  end

  describe ".load!(path)" do
    context "when path.nil?" do
      it "should raise \"Undefined path to a file or files\"" do
        expect do
          subject.class.load!(nil)
        end.to raise_error("Undefined path to a file or files")
      end
    end

    context "when path.empty?" do
      it "should raise \"Undefined path to a file or files\"" do
        expect do
          subject.class.load!("")
        end.to raise_error("Undefined path to a file or files")
      end
    end

    context "when path is a nonexistent directory" do
      let(:path) { "/nonexistent" }
      it "should raise \"Unknown path '{path}' to a file or files\"" do
        expect do
          subject.class.load!(path)
        end.to raise_error("Unknown path '#{path}' to a file or files")
      end
    end

    context "when path is an exisiting directory" do
      let(:path) { File.join(File.dirname(__FILE__), "../tracks") }
      it "should load tracks from the directory" do
        tracks = subject.class.load!(path)
        tracks.count.should eq(2)
        tracks.map(&:title).should eq(["Jets", "Kamakura"])
      end
    end

    context "when path is a nonexistent file" do
      let(:path) { File.join(File.dirname(__FILE__), "nonexistent.mp3") }
      it "should raise \"Unknown path '{path}' to a file or files\"" do
        expect do
          subject.class.load!(path)
        end.to raise_error("Unknown path '#{path}' to a file or files")
      end
    end

    context "when path is an existing file that is unsupported" do
      let(:path) { File.join(File.dirname(__FILE__), "file.bad") }
      before(:each) { File.stub(:file?).with(path).and_return(true) }
      it "should raise \"Unknown extension '{extension}'\"" do
        expect do
          subject.class.load!(path)
        end.to raise_error("Unknown extension '.bad'")
      end
    end

    context "when path is a existing file that is supported" do
      let(:path) { File.join(File.dirname(__FILE__), "../tracks/bonobo/jets.mp3") }
      it "should load a track from the file" do
        tracks = subject.class.load!(path)
        tracks.count.should eq(1)
        tracks.first.title.should eq("Jets")
      end
    end
  end
end
