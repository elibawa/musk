module Musk
  class TrackAdapter
    def self.adapt(tag)
      new(tag).adapt
    end

    def initialize(tag)
      @tag = tag
    end

    def adapt
      Musk::Track.new(attributes)
    end

    private

    def attributes
      Musk::Track::ATTRIBUTES.inject({}) do |hash, attribute|
        hash[attribute] = send(attribute) if respond_to?(attribute, true)
        hash
      end
    end

    def number
      @tag.frame_list("TRCK").first.to_s.split("/").first
    end

    def number_of
      @tag.frame_list("TRCK").first.to_s.split("/").last
    end

    def title
      @tag.title
    end

    def artist
      @tag.artist
    end

    def release
      @tag.album
    end

    def genre
      @tag.genre
    end

    def year
      @tag.year.to_s
    end

    def comment
      @tag.comment
    end
  end
end
