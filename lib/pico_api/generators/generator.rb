# frozen_string_literal: true

module PicoApi
  module Generators
    class Generator
      class << self
        def call(project_name)
          new(project_name, loaded_commands).call
        end

        def loaded_commands
          command_files.sort.map do |file_path|
            file_name = camelized_file_name(file_path)
            "PicoApi::Generators::Commands::#{file_name}".constantize
          end.compact
        end

        private

        def command_files
          Dir[File.join(PicoApi.lib_path, '/generators/commands/*.rb')]
        end

        def camelized_file_name(file_path)
          file_path.split('/').last.gsub('.rb', '').camelize
        end
      end

      def initialize(project_name, commands = [])
        raise 'Missing project name' unless project_name

        @project_name = project_name
        @commands = commands
      end

      def call
        commands.each { |command| command.call(project_name) }
      end

      private

      attr_reader :project_name, :commands
    end
  end
end
