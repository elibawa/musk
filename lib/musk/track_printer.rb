module Musk
  class TrackPrinter
    def self.print!(format, tracks)
      new(format, tracks).print!
    end

    def initialize(format, tracks)
      @format = format
      @tracks = tracks
    end

    def print!
      case @format.to_s.to_sym
      when :csv then Musk::Formatter::CSV.print(@tracks)
      when :pretty then Musk::Formatter::Pretty.print(@tracks)
      else
        raise "Unknown format '#{@format}'"
      end
    end
  end
end
