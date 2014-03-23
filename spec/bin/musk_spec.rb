require "spec_helper"

describe "musk extract" do
  let(:command) { "bundle exec bin/musk extract" }

  context "called without arguments" do
    it "should fail with the exit code 1" do
      stdout, stderr, status = Open3.capture3(command)
      status.exitstatus.should eq(1)
    end

    it "should write an error message to STDERR" do
      stdout, stderr, status = Open3.capture3(command)
      stderr.should_not be_empty
    end
  end

  context "called with 'path_to_tracks'" do
    it_should_behave_like "a command to print tracks to STDOUT in the pretty format" do
      let(:expected_command) { command }
    end
  end

  context "called with '-f pretty path_to_tracks'" do
    it_should_behave_like "a command to print tracks to STDOUT in the pretty format" do
      let(:expected_command) { "#{command} -f pretty" }
    end
  end

  context "called with '--format pretty path_to_tracks'" do
    it_should_behave_like "a command to print tracks to STDOUT in the pretty format" do
      let(:expected_command) { "#{command} --format pretty" }
    end
  end

  context "called with '--format=pretty path_to_tracks'" do
    it_should_behave_like "a command to print tracks to STDOUT in the pretty format" do
      let(:expected_command) { "#{command} --format=pretty" }
    end
  end
end
