module Musk
  class TrackPrinter
    def self.print!(format, tracks)
      case format.to_s.to_sym
      when :csv    then Musk::Formatter::CSV.print(tracks)
      when :pretty then Musk::Formatter::Pretty.print(tracks)
      else
        raise "Unknown format '#{format}'"
      end
    end
  end
end
