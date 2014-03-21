require 'gli'
require 'musk/track'
require 'musk/track_formatter'

module Musk
  module App
    def self.included(base)
      base.send(:include, Engine)
      exit Engine.run(ARGV)
    end

    module Engine
      extend GLI::App

      desc 'Extract meta-data (tags) from MP3 files'
      arg_name 'path_to_file or path_to_files'
      command :extract do |command|
        command.arg_name "format"
        command.default_value "pretty"
        command.flag [:f, :format]
        command.action do |global_options, options, arguments|
          begin
            tracks = Musk::Track.load!(arguments.first)
            Musk::TrackFormatter.format!(options[:f], tracks)
          rescue RuntimeError => error
            STDERR.puts error
            exit 1
          end
        end
      end
    end
  end
end
