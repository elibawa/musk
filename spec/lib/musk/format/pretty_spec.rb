require "spec_helper"

describe Musk::Format::Pretty do
  describe ".print(tracks)" do
    let(:tracks) do
      [build(:jets_track), build(:kamakura_track)]
    end

    let(:stdout) do
      tracks.map do |track|
        "Path:     #{track.path}\n"\
        "Title:    #{track.title}\n"\
        "Position: #{track.position}\n"\
        "Artist:   #{track.artist}\n"\
        "Album:    #{track.album}\n"\
        "Genre:    #{track.genre}\n"\
        "Year:     #{track.year}\n"\
        "Comment:  #{track.comment}\n"\
      end.join("\n")
    end

    it "should print tracks to STDOUT in the pretty format" do
      capture_stdout { subject.class.print(tracks) }.should eq(stdout)
    end
  end
end
