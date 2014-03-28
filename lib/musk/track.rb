module Musk
  class Track
    ATTRIBUTES = [
      :loadpath,
      :fullpath,
      :title,
      :number,
      :number_of,
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

    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value) if respond_to?("#{key}=")
      end
    end
  end
end
