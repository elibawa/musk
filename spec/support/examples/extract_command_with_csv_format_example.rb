shared_examples "the extract command with the csv format" do |options|
  let(:command) { "bundle exec bin/musk extract" }

  it "should print tracks to STDOUT via Musk::Formatter::CSV" do
    path = ENV["MUSK_TRACKS_PATH"]
    tracks = Musk::TrackLoader.load!(path)
    stdout, stderr, status = Open3.capture3("#{command} #{options} #{path}")
    stdout.should eq(capture_stdout {Musk::Formatter::CSV.print(tracks)})
    status.exitstatus.should eq(0)
  end
end
