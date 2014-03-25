shared_examples "a command to print tracks to STDOUT in the pretty format" do
  it "should print tracks to STDOUT via Musk::Formatter::Pretty" do
    path = ENV["MUSK_TRACKS_PATH"]
    tracks = Musk::TrackLoader.load!(path)
    stdout, stderr, status = Open3.capture3("#{expected_command} #{path}")
    stdout.should eq(capture_stdout { Musk::Formatter::Pretty.print(tracks) })
    status.exitstatus.should eq(0)
  end
end
