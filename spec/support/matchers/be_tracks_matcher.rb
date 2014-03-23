class BeTracksMatcher
  include RSpec::Matchers

  def initialize(tracks)
    @tracks = tracks
  end

  def matches?(tracks)
    @tracks.map(&:attributes).should =~ tracks.map(&:attributes)
  end
end

module Matchers
  def be_tracks(tracks = [])
    BeTracksMatcher.new(tracks)
  end
end
