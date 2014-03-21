require 'musk/format/pretty'

module Musk
  class TrackFormatter
    def self.format!(format, tracks)
      case format.to_s.to_sym
      when :pretty
        Format::Pretty.format(tracks)
      else
        raise "Unknown format '#{format}'"
      end
    end
  end
end
