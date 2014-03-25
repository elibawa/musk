require "spec_helper"

describe "musk extract" do
  context "called without arguments" do
    it "should fail with the exit code 1" do
      stdout, stderr, status = Open3.capture3("bundle exec bin/musk extract")
      status.exitstatus.should eq(1)
    end

    it "should write an error message to STDERR" do
      stdout, stderr, status = Open3.capture3("bundle exec bin/musk extract")
      stderr.should_not be_empty
    end
  end

  context "called with 'path_to_tracks'" do
    it_should_behave_like "the extract command with the pretty format"
  end

  context "called with 'path_to_tracks -f pretty'" do
    it_should_behave_like "the extract command with the pretty format", "-f pretty"
  end

  context "called with 'path_to_tracks --format pretty'" do
    it_should_behave_like "the extract command with the pretty format", "--format pretty"
  end

  context "called with 'path_to_tracks --format=pretty'" do
    it_should_behave_like "the extract command with the pretty format", "--format=pretty"
  end

  context "called with 'path_to_tracks -f csv'" do
    it_should_behave_like "the extract command with the csv format", "-f csv"
  end

  context "called with 'path_to_tracks --format csv'" do
    it_should_behave_like "the extract command with the csv format", "--format csv"
  end

  context "called with 'path_to_tracks --format=csv'" do
    it_should_behave_like "the extract command with the csv format", "--format=csv"
  end
end
