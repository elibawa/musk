module Musk
  class Track
    ATTRIBUTES = [:path,
                  :title,
                  :position,
                  :artist,
                  :album,
                  :genre,
                  :year,
                  :comment]

    attr_accessor *ATTRIBUTES

    def attributes
      Hash[ATTRIBUTES.map {|a| [a, send("#{a}")]}]
    end
  end
end
