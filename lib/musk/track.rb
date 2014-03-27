module Musk
  class Track
    ATTRIBUTES = [
      :loadpath,
      :fullpath,
      :title,
      :position_number,
      :positions_count,
      :artist,
      :release,
      :genre,
      :year,
      :comment,
    ]

    attr_accessor *ATTRIBUTES

    def attributes
      Hash[ATTRIBUTES.map { |a| [a, send("#{a}")] }]
    end
  end
end
