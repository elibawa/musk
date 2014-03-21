require 'spec_helper'

describe "musk extract" do
  it "should fail with the exit code 1" do
    stdout, stderr, status = Open3.capture3(subject)
    status.exitstatus.should eq(1)
  end

  it "should print an error message to STDERR" do
    stdout, stderr, status = Open3.capture3(subject)
    stderr.should_not be_empty
  end
end

#describe "musk extract path_to_tracks" do
#end
#
#describe "musk extract -f pretty path_to_tracks" do
#end
#
#describe "musk extract --format pretty path_to_tracks" do
#end
#
#describe "musk extract --format=pretty path_to_tracks" do
#  it "should load tracks from path_to_tracks" do
#  end
#
#  it "should print the tracks to STDOUT in the pretty format" do
#  end
#end
